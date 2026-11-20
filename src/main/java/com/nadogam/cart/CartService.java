package com.nadogam.cart;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.UUID;

import org.springframework.jdbc.core.simple.JdbcClient;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nadogam.common.Fmt;

// 장바구니 담기(가격은 DB 값으로 서버가 계산)와 모의 결제. 결제는 실제로 일어나지 않고 예약만 만든다.
@Service
public class CartService {

	public static final int MAX_CART_ITEMS = 20;
	public static final int MAX_NIGHTS = 14;
	public static final int MAX_ROOMS = 5;
	public static final int MAX_CRUISE_PEOPLE = 8;
	public static final int MAX_FLIGHT_PEOPLE = 9;

	private final JdbcClient jdbc;
	private final CartItemRepository carts;
	private final ReservationRepository reservations;
	private final ReservationItemRepository reservationItems;

	public CartService(JdbcClient jdbc, CartItemRepository carts, ReservationRepository reservations,
		ReservationItemRepository reservationItems) {
		this.jdbc = jdbc;
		this.carts = carts;
		this.reservations = reservations;
		this.reservationItems = reservationItems;
	}

	// 입력이 잘못되면 화면에 그대로 보여 줄 메시지와 함께 IllegalArgumentException 을 던진다.
	public CartLine price(String type, Long refId, Long optionId, String cabin, Integer nights, Integer quantity) {
		return price(type, refId, optionId, cabin, nights, quantity, null);
	}

	// 항공권은 여행일이 운항 요일인지도 확인해야 해서 날짜를 함께 받는다(null 이면 요일 검사를 건너뛴다).
	public CartLine price(String type, Long refId, Long optionId, String cabin, Integer nights, Integer quantity, LocalDate date) {
		ItemType itemType = ItemType.of(type).orElseThrow(() -> new IllegalArgumentException("담을 수 없는 상품이에요."));
		if (refId == null || quantity == null) {
			throw new IllegalArgumentException("상품과 수량을 다시 확인해 주세요.");
		}
		return switch (itemType) {
			case FLIGHT -> flightLine(refId, cabin, quantity, date);
			case TRANSPORT -> transportLine(refId, quantity);
			case TOUR -> tourLine(refId, optionId, quantity);
			case HOTEL -> hotelLine(refId, nights, quantity);
			case CRUISE -> cruiseLine(refId, cabin, quantity);
		};
	}

	// 항공권: 좌석 등급별 요금(운임 + 세금·유류할증료, 편도 1인). 남은 좌석보다 많이 담을 수 없다.
	private CartLine flightLine(long flightId, String cabin, int people, LocalDate date) {
		if (cabin == null || cabin.isBlank()) {
			throw new IllegalArgumentException("좌석 등급을 골라 주세요.");
		}
		if (people < 1 || people > MAX_FLIGHT_PEOPLE) {
			throw new IllegalArgumentException("인원은 1~" + MAX_FLIGHT_PEOPLE + "명까지 담을 수 있어요.");
		}
		var rows = jdbc.sql("""
			SELECT f.flight_no, f.departure_time, f.operating_days, ao.city_name_ko AS origin_city, aa.city_name_ko AS arrival_city,
				ff.base_price, ff.tax_fuel, ff.seats_left
			FROM flight f
			JOIN destination d ON d.destination_id = f.destination_id AND d.status = 'AVAILABLE'
			JOIN airport ao ON ao.airport_code = f.origin_airport
			JOIN airport aa ON aa.airport_code = f.arrival_airport
			JOIN flight_fare ff ON ff.flight_id = f.flight_id AND ff.cabin_class = :cabin
			WHERE f.flight_id = :id AND f.status = 'ON_SALE'
			""").param("id", flightId).param("cabin", cabin).query().listOfRows();
		if (rows.isEmpty()) {
			throw new IllegalArgumentException("없는 항공편이거나 고를 수 없는 좌석 등급이에요.");
		}
		var r = rows.get(0);
		String days = (String) r.get("OPERATING_DAYS");
		if (date != null && days != null && days.length() >= 7 && days.charAt(date.getDayOfWeek().getValue() - 1) != '1') {
			throw new IllegalArgumentException("선택한 날짜에는 운항하지 않아요. 운항 요일을 확인해 주세요.");
		}
		int left = ((Number) r.get("SEATS_LEFT")).intValue();
		if (people > left) {
			throw new IllegalArgumentException("남은 좌석이 " + left + "석뿐이에요.");
		}
		int unit = ((Number) r.get("BASE_PRICE")).intValue() + ((Number) r.get("TAX_FUEL")).intValue();
		String title = r.get("FLIGHT_NO") + " " + r.get("ORIGIN_CITY") + "→" + r.get("ARRIVAL_CITY");
		String detail = Fmt.cabin(cabin) + " · 편도 · " + people + "명 · " + Fmt.time(toTime(r.get("DEPARTURE_TIME"))) + " 출발";
		return new CartLine(ItemType.FLIGHT, flightId, title, detail, unit, people, cabin);
	}

	private static java.time.LocalTime toTime(Object value) {
		return value instanceof java.sql.Time t ? t.toLocalTime() : (java.time.LocalTime) value;
	}

	// 국내 이동편: 성인 편도 1인 요금.
	private CartLine transportLine(long transportId, int people) {
		if (people < 1 || people > MAX_FLIGHT_PEOPLE) {
			throw new IllegalArgumentException("인원은 1~" + MAX_FLIGHT_PEOPLE + "명까지 담을 수 있어요.");
		}
		var rows = jdbc.sql("""
			SELECT t.name, t.origin, t.depart_time, t.fare
			FROM domestic_transport t JOIN domestic_city c ON c.city_id = t.city_id AND c.status = 'AVAILABLE'
			WHERE t.transport_id = :id
			""").param("id", transportId).query().listOfRows();
		if (rows.isEmpty()) {
			throw new IllegalArgumentException("없는 이동편이에요.");
		}
		var r = rows.get(0);
		String origin = "DAEJEON".equals(r.get("ORIGIN")) ? "대전" : "서울";
		String detail = "편도 · " + people + "명 · " + origin + " " + Fmt.time(toTime(r.get("DEPART_TIME"))) + " 출발";
		return new CartLine(ItemType.TRANSPORT, transportId, (String) r.get("NAME"), detail,
			((Number) r.get("FARE")).intValue(), people);
	}

	private CartLine tourLine(long tourId, Long optionId, int people) {
		if (optionId == null) {
			throw new IllegalArgumentException("투어 기간을 골라 주세요.");
		}
		var rows = jdbc.sql("""
			SELECT t.title, o.nights, o.days, o.price_per_person, o.min_people, o.max_people
			FROM tour t JOIN tour_option o ON o.tour_id = t.tour_id
			WHERE t.tour_id = :tour AND o.option_id = :opt AND t.status = 'ON_SALE'
			""").param("tour", tourId).param("opt", optionId).query().listOfRows();
		if (rows.isEmpty()) {
			throw new IllegalArgumentException("없는 투어예요.");
		}
		var r = rows.get(0);
		int min = ((Number) r.get("MIN_PEOPLE")).intValue();
		int max = ((Number) r.get("MAX_PEOPLE")).intValue();
		if (people < min || people > max) {
			throw new IllegalArgumentException("인원은 " + min + "~" + max + "명 사이로 정해 주세요.");
		}
		String detail = r.get("NIGHTS") + "박 " + r.get("DAYS") + "일 · " + people + "명";
		return new CartLine(ItemType.TOUR, tourId, (String) r.get("TITLE"), detail,
			((Number) r.get("PRICE_PER_PERSON")).intValue(), people);
	}

	private CartLine hotelLine(long hotelId, Integer nights, int rooms) {
		if (nights == null || nights < 1 || nights > MAX_NIGHTS) {
			throw new IllegalArgumentException("숙박 일수는 1~" + MAX_NIGHTS + "박이에요.");
		}
		if (rooms < 1 || rooms > MAX_ROOMS) {
			throw new IllegalArgumentException("객실은 1~" + MAX_ROOMS + "개까지 담을 수 있어요.");
		}
		var row = jdbc.sql("SELECT name, price_per_night FROM hotel WHERE hotel_id = :id AND status = 'ON_SALE'")
			.param("id", hotelId).query().listOfRows();
		if (row.isEmpty()) {
			throw new IllegalArgumentException("없는 호텔이에요.");
		}
		int perNight = ((Number) row.get(0).get("PRICE_PER_NIGHT")).intValue();
		return new CartLine(ItemType.HOTEL, hotelId, (String) row.get(0).get("NAME"),
			nights + "박 · 객실 " + rooms + "개 (1박 " + Fmt.won(perNight) + ")", perNight * nights, rooms);
	}

	private CartLine cruiseLine(long cruiseId, String cabin, int people) {
		boolean balcony = "BALCONY".equals(cabin);
		if (!balcony && !"INSIDE".equals(cabin)) {
			throw new IllegalArgumentException("객실 종류를 골라 주세요.");
		}
		if (people < 1 || people > MAX_CRUISE_PEOPLE) {
			throw new IllegalArgumentException("인원은 1~" + MAX_CRUISE_PEOPLE + "명까지 담을 수 있어요.");
		}
		var row = jdbc.sql("SELECT title, nights, price_inside, price_balcony FROM cruise WHERE cruise_id = :id AND status = 'ON_SALE'")
			.param("id", cruiseId).query().listOfRows();
		if (row.isEmpty()) {
			throw new IllegalArgumentException("없는 크루즈예요.");
		}
		var r = row.get(0);
		int nights = ((Number) r.get("NIGHTS")).intValue();
		int unit = ((Number) r.get(balcony ? "PRICE_BALCONY" : "PRICE_INSIDE")).intValue();
		return new CartLine(ItemType.CRUISE, cruiseId, (String) r.get("TITLE"),
			nights + "박 " + (nights + 1) + "일 · " + (balcony ? "발코니" : "내측") + " 객실 · " + people + "명", unit, people);
	}

	// 여행일은 내일부터 1년 안으로만 받는다.
	public static LocalDate checkDate(LocalDate date, LocalDate today) {
		if (date == null) {
			throw new IllegalArgumentException("여행 날짜를 골라 주세요.");
		}
		if (!date.isAfter(today) || date.isAfter(today.plusYears(1))) {
			throw new IllegalArgumentException("여행 날짜는 내일부터 1년 안에서 골라 주세요.");
		}
		return date;
	}

	@Transactional
	public CartItem add(Long memberId, CartLine line, LocalDate travelDate) {
		if (carts.countByMemberId(memberId) >= MAX_CART_ITEMS) {
			throw new IllegalArgumentException("장바구니에는 최대 " + MAX_CART_ITEMS + "개까지 담을 수 있어요.");
		}
		return carts.save(CartItem.create(memberId, line, travelDate));
	}

	// 결제하면 항공권 좌석이 줄어든다. 같은 항공편·등급의 줄은 합쳐서 한 번에 줄이고, 조건부 UPDATE 라 동시에 결제해도 남은 좌석보다 많이 팔리지 않는다.
	// 하나라도 부족하면 예외로 트랜잭션 전체가 취소되어 이미 줄인 좌석도 되돌아간다.
	private void reserveFlightSeats(List<CartItem> items) {
		java.util.Map<String, Integer> need = new java.util.TreeMap<>();   // 정렬해서 잠그는 순서를 고정한다(교착 방지)
		java.util.Map<String, String> names = new java.util.HashMap<>();
		for (CartItem c : items) {
			if ("FLIGHT".equals(c.getItemType()) && c.getCabinClass() != null) {
				String key = String.format("%012d:%s", c.getRefId(), c.getCabinClass());
				need.merge(key, c.getQuantity(), Integer::sum);
				names.putIfAbsent(key, c.getTitle());
			}
		}
		for (var e : need.entrySet()) {
			long flightId = Long.parseLong(e.getKey().substring(0, 12));
			String cabin = e.getKey().substring(13);
			int n = jdbc.sql("""
				UPDATE flight_fare SET seats_left = seats_left - :n, version = version + 1
				WHERE flight_id = :flight AND cabin_class = :cabin AND seats_left >= :n
				  AND EXISTS (SELECT 1 FROM flight f WHERE f.flight_id = flight_fare.flight_id AND f.status = 'ON_SALE')
				""").param("n", e.getValue()).param("flight", flightId).param("cabin", cabin).update();
			if (n == 0) {
				throw new IllegalArgumentException(names.get(e.getKey()) + " 항공권의 남은 좌석이 부족하거나 판매가 중지되었어요. 장바구니를 확인해 주세요.");
			}
			jdbc.sql("UPDATE flight_sales_stat SET sales_count = sales_count + :n WHERE flight_id = :flight")
				.param("n", e.getValue()).param("flight", flightId).update();
		}
	}

	// 모의 결제: 장바구니 전체로 예약을 만들고 장바구니를 비운다. 금액은 장바구니 줄(서버가 계산해 저장한 값)로만 합친다.
	@Transactional
	public Reservation checkout(Long memberId, String method) {
		PayMethod payMethod = PayMethod.of(method).orElseThrow(() -> new IllegalArgumentException("결제 수단을 골라 주세요."));
		List<CartItem> items = carts.findByMemberIdOrderByCreatedAtDesc(memberId);
		if (items.isEmpty()) {
			throw new IllegalArgumentException("장바구니가 비어 있어요.");
		}
		reserveFlightSeats(items);
		long total = items.stream().mapToLong(CartItem::getLineAmount).sum();
		String no = "NG" + LocalDate.now().format(DateTimeFormatter.BASIC_ISO_DATE) + "-"
			+ UUID.randomUUID().toString().replace("-", "").substring(0, 6).toUpperCase();
		Reservation saved = reservations.save(Reservation.paid(memberId, no, total, payMethod));
		for (CartItem c : items) {
			reservationItems.save(ReservationItem.from(saved.getReservationId(), c));
		}
		carts.deleteByMemberId(memberId);
		return saved;
	}
}
