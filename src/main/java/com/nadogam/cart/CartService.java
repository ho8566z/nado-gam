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
		ItemType itemType = ItemType.of(type).orElseThrow(() -> new IllegalArgumentException("담을 수 없는 상품이에요."));
		if (refId == null || quantity == null) {
			throw new IllegalArgumentException("상품과 수량을 다시 확인해 주세요.");
		}
		return switch (itemType) {
			case TOUR -> tourLine(refId, optionId, quantity);
			case HOTEL -> hotelLine(refId, nights, quantity);
			case CRUISE -> cruiseLine(refId, cabin, quantity);
		};
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

	// 모의 결제: 장바구니 전체로 예약을 만들고 장바구니를 비운다. 금액은 장바구니 줄(서버가 계산해 저장한 값)로만 합친다.
	@Transactional
	public Reservation checkout(Long memberId, String method) {
		PayMethod payMethod = PayMethod.of(method).orElseThrow(() -> new IllegalArgumentException("결제 수단을 골라 주세요."));
		List<CartItem> items = carts.findByMemberIdOrderByCreatedAtDesc(memberId);
		if (items.isEmpty()) {
			throw new IllegalArgumentException("장바구니가 비어 있어요.");
		}
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
