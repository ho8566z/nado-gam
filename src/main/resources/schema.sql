-- nado_gam DB 스키마 (설계서: nado_gam_word/design/02_DB설계서.md)
-- MySQL 8 / H2(MODE=MySQL) 공통 문법. 개발용 초기화 스크립트라 시작할 때마다 테이블을 지우고 다시 만든다.

DROP TABLE IF EXISTS monthly_plan_flight;
DROP TABLE IF EXISTS monthly_plan;
DROP TABLE IF EXISTS flight_sales_stat;
DROP TABLE IF EXISTS flight_fare;
DROP TABLE IF EXISTS flight_segment;
DROP TABLE IF EXISTS flight;
DROP TABLE IF EXISTS airline;
DROP TABLE IF EXISTS destination;
DROP TABLE IF EXISTS airport;
DROP TABLE IF EXISTS country;
DROP TABLE IF EXISTS member;
DROP TABLE IF EXISTS tour_day;
DROP TABLE IF EXISTS tour_option;
DROP TABLE IF EXISTS tour;
DROP TABLE IF EXISTS cruise;
DROP TABLE IF EXISTS hotel;
DROP TABLE IF EXISTS domestic_transport;
DROP TABLE IF EXISTS domestic_city;
DROP TABLE IF EXISTS support_inquiry;
DROP TABLE IF EXISTS popup_event;
DROP TABLE IF EXISTS admin_audit_log;
DROP TABLE IF EXISTS admin_account;

-- ============================================================
-- [A] 관리자 영역
-- ============================================================
CREATE TABLE admin_account (
    admin_id       BIGINT       NOT NULL AUTO_INCREMENT,
    login_id       VARCHAR(30)  NOT NULL,
    password_hash  VARCHAR(100) NOT NULL,
    name           VARCHAR(50)  NOT NULL,
    phone          VARCHAR(20)  NOT NULL,
    email          VARCHAR(100) NOT NULL,
    role           VARCHAR(20)  NOT NULL DEFAULT 'ROLE_ADMIN',
    status         VARCHAR(10)  NOT NULL DEFAULT 'ACTIVE',
    last_login_at  DATETIME     NULL,
    created_at     DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (admin_id),
    CONSTRAINT uq_admin_login_id UNIQUE (login_id),
    CONSTRAINT uq_admin_email UNIQUE (email)
);

CREATE TABLE admin_audit_log (
    log_id        BIGINT       NOT NULL AUTO_INCREMENT,
    admin_id      BIGINT       NOT NULL,
    action        VARCHAR(30)  NOT NULL,
    target_table  VARCHAR(50)  NOT NULL,
    target_id     VARCHAR(50)  NULL,
    detail        TEXT         NULL,
    created_at    DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (log_id),
    CONSTRAINT fk_audit_admin FOREIGN KEY (admin_id) REFERENCES admin_account (admin_id)
);

CREATE TABLE popup_event (
    popup_id       BIGINT       NOT NULL AUTO_INCREMENT,
    title          VARCHAR(100) NOT NULL,
    body           VARCHAR(500) NOT NULL,
    qr_target_url  VARCHAR(300) NULL,
    start_at       DATETIME     NOT NULL,
    end_at         DATETIME     NOT NULL,
    is_active      BOOLEAN      NOT NULL DEFAULT TRUE,
    created_by     BIGINT       NOT NULL,
    created_at     DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (popup_id),
    CONSTRAINT fk_popup_admin FOREIGN KEY (created_by) REFERENCES admin_account (admin_id)
);

-- ============================================================
-- [U] 사용자 영역 (예약 테이블은 2단계)
-- ============================================================
CREATE TABLE member (
    member_id      BIGINT       NOT NULL AUTO_INCREMENT,
    login_id       VARCHAR(30)  NOT NULL,
    password_hash  VARCHAR(100) NOT NULL,
    name           VARCHAR(50)  NOT NULL,
    phone          VARCHAR(20)  NOT NULL,
    email          VARCHAR(100) NOT NULL,
    role           VARCHAR(20)  NOT NULL DEFAULT 'ROLE_USER',
    status         VARCHAR(10)  NOT NULL DEFAULT 'ACTIVE',
    created_at     DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at     DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    withdrawn_at   DATETIME     NULL,
    PRIMARY KEY (member_id),
    CONSTRAINT uq_member_login_id UNIQUE (login_id),
    CONSTRAINT uq_member_email UNIQUE (email)
);

CREATE TABLE support_inquiry (
    inquiry_id      BIGINT       NOT NULL AUTO_INCREMENT,
    member_id       BIGINT       NOT NULL,
    category        VARCHAR(15)  NOT NULL,
    title           VARCHAR(100) NOT NULL,
    content         TEXT         NOT NULL,
    status          VARCHAR(10)  NOT NULL DEFAULT 'RECEIVED',
    answer_content  TEXT         NULL,
    answered_by     BIGINT       NULL,
    created_at      DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    answered_at     DATETIME     NULL,
    PRIMARY KEY (inquiry_id),
    CONSTRAINT fk_inquiry_member FOREIGN KEY (member_id) REFERENCES member (member_id),
    CONSTRAINT fk_inquiry_admin FOREIGN KEY (answered_by) REFERENCES admin_account (admin_id)
);
CREATE INDEX idx_inquiry_member ON support_inquiry (member_id, created_at);

-- ============================================================
-- [M] 운영 마스터 (관리자가 등록·수정, 사용자는 조회)
-- ============================================================
CREATE TABLE country (
    country_code  CHAR(2)      NOT NULL,
    name_ko       VARCHAR(50)  NOT NULL,
    name_en       VARCHAR(50)  NOT NULL,
    region        VARCHAR(20)  NOT NULL,
    PRIMARY KEY (country_code)
);

CREATE TABLE airport (
    airport_code   CHAR(3)       NOT NULL,
    name_ko        VARCHAR(100)  NOT NULL,
    name_en        VARCHAR(100)  NOT NULL,
    city_name_ko   VARCHAR(50)   NOT NULL,
    country_code   CHAR(2)       NOT NULL,
    latitude       DECIMAL(9,6)  NOT NULL,
    longitude      DECIMAL(9,6)  NOT NULL,
    timezone       VARCHAR(40)   NOT NULL,
    is_hub         BOOLEAN       NOT NULL DEFAULT FALSE,
    PRIMARY KEY (airport_code),
    CONSTRAINT fk_airport_country FOREIGN KEY (country_code) REFERENCES country (country_code)
);

CREATE TABLE destination (
    destination_id      BIGINT        NOT NULL AUTO_INCREMENT,
    name_ko             VARCHAR(50)   NOT NULL,
    name_en             VARCHAR(50)   NOT NULL,
    country_code        CHAR(2)       NOT NULL,
    main_airport        CHAR(3)       NOT NULL,
    latitude            DECIMAL(9,6)  NOT NULL,
    longitude           DECIMAL(9,6)  NOT NULL,
    status              VARCHAR(15)   NOT NULL DEFAULT 'AVAILABLE',
    unavailable_reason  VARCHAR(200)  NULL,
    summary             VARCHAR(300)  NULL,
    image_url           VARCHAR(300)  NULL,
    poster_color_from   CHAR(7)       NULL,
    poster_color_to     CHAR(7)       NULL,
    sort_order          INT           NOT NULL DEFAULT 0,
    PRIMARY KEY (destination_id),
    CONSTRAINT fk_dest_country FOREIGN KEY (country_code) REFERENCES country (country_code),
    CONSTRAINT fk_dest_airport FOREIGN KEY (main_airport) REFERENCES airport (airport_code)
);

CREATE TABLE airline (
    airline_code  VARCHAR(3)   NOT NULL,
    name_ko       VARCHAR(50)  NOT NULL,
    name_en       VARCHAR(50)  NOT NULL,
    carrier_type  VARCHAR(5)   NOT NULL,
    PRIMARY KEY (airline_code)
);

CREATE TABLE flight (
    flight_id           BIGINT       NOT NULL AUTO_INCREMENT,
    flight_no           VARCHAR(10)  NOT NULL,
    airline_code        VARCHAR(3)   NOT NULL,
    destination_id      BIGINT       NOT NULL,
    origin_airport      CHAR(3)      NOT NULL,
    arrival_airport     CHAR(3)      NOT NULL,
    flight_type         VARCHAR(10)  NOT NULL,
    stops               TINYINT      NOT NULL DEFAULT 0,
    departure_time      TIME         NOT NULL,
    arrival_time        TIME         NOT NULL,
    arrival_day_offset  TINYINT      NOT NULL DEFAULT 0,
    duration_minutes    INT          NOT NULL,
    aircraft            VARCHAR(30)  NULL,
    baggage_kg          INT          NULL,
    meal_included       BOOLEAN      NOT NULL DEFAULT TRUE,
    operating_days      VARCHAR(7)   NOT NULL DEFAULT '1111111',
    status              VARCHAR(10)  NOT NULL DEFAULT 'ON_SALE',
    created_at          DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at          DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (flight_id),
    CONSTRAINT fk_flight_airline FOREIGN KEY (airline_code) REFERENCES airline (airline_code),
    CONSTRAINT fk_flight_dest FOREIGN KEY (destination_id) REFERENCES destination (destination_id),
    CONSTRAINT fk_flight_origin FOREIGN KEY (origin_airport) REFERENCES airport (airport_code),
    CONSTRAINT fk_flight_arrival FOREIGN KEY (arrival_airport) REFERENCES airport (airport_code)
);
-- 여행지 선택 후 출발지 목록, 항공편 목록 조회용
CREATE INDEX idx_flight_dest_origin ON flight (destination_id, origin_airport);

CREATE TABLE flight_segment (
    segment_id        BIGINT   NOT NULL AUTO_INCREMENT,
    flight_id         BIGINT   NOT NULL,
    seq               TINYINT  NOT NULL,
    from_airport      CHAR(3)  NOT NULL,
    to_airport        CHAR(3)  NOT NULL,
    duration_minutes  INT      NOT NULL,
    layover_minutes   INT      NULL,
    PRIMARY KEY (segment_id),
    CONSTRAINT uq_segment_seq UNIQUE (flight_id, seq),
    CONSTRAINT fk_segment_flight FOREIGN KEY (flight_id) REFERENCES flight (flight_id),
    CONSTRAINT fk_segment_from FOREIGN KEY (from_airport) REFERENCES airport (airport_code),
    CONSTRAINT fk_segment_to FOREIGN KEY (to_airport) REFERENCES airport (airport_code)
);

-- 표시 가격 = base_price + tax_fuel (편도, 성인 1인)
CREATE TABLE flight_fare (
    fare_id       BIGINT        NOT NULL AUTO_INCREMENT,
    flight_id     BIGINT        NOT NULL,
    cabin_class   VARCHAR(10)   NOT NULL,
    base_price    INT           NOT NULL,
    tax_fuel      INT           NOT NULL DEFAULT 0,
    seats_total   INT           NOT NULL,
    seats_left    INT           NOT NULL,
    refundable    BOOLEAN       NOT NULL DEFAULT FALSE,
    change_fee    INT           NOT NULL DEFAULT 0,
    mileage_rate  DECIMAL(3,2)  NOT NULL DEFAULT 0,
    version       BIGINT        NOT NULL DEFAULT 0,
    PRIMARY KEY (fare_id),
    CONSTRAINT uq_fare_flight_cabin UNIQUE (flight_id, cabin_class),
    CONSTRAINT fk_fare_flight FOREIGN KEY (flight_id) REFERENCES flight (flight_id)
);

CREATE TABLE flight_sales_stat (
    flight_id    BIGINT    NOT NULL,
    sales_count  INT       NOT NULL DEFAULT 0,
    rank_no      INT       NULL,
    updated_at   DATETIME  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (flight_id),
    CONSTRAINT fk_stat_flight FOREIGN KEY (flight_id) REFERENCES flight (flight_id)
);

CREATE TABLE monthly_plan (
    plan_id         BIGINT        NOT NULL AUTO_INCREMENT,
    plan_month      CHAR(7)       NOT NULL,
    destination_id  BIGINT        NOT NULL,
    title           VARCHAR(100)  NOT NULL,
    subtitle        VARCHAR(200)  NULL,
    badge_text      VARCHAR(20)   NULL,
    highlights      VARCHAR(500)  NULL,
    start_at        DATETIME      NOT NULL,
    end_at          DATETIME      NOT NULL,
    is_active       BOOLEAN       NOT NULL DEFAULT TRUE,
    banner_image    VARCHAR(300)  NULL,
    PRIMARY KEY (plan_id),
    CONSTRAINT fk_plan_dest FOREIGN KEY (destination_id) REFERENCES destination (destination_id)
);

-- 설계서의 복합 PK(plan_id, flight_id)에 cabin_class 를 더했다. 등급마다 특가가 다르기 때문이다.
CREATE TABLE monthly_plan_flight (
    plan_id         BIGINT       NOT NULL,
    flight_id       BIGINT       NOT NULL,
    cabin_class     VARCHAR(10)  NOT NULL,
    sale_price      INT          NOT NULL,
    original_price  INT          NOT NULL,
    limited_seats   INT          NOT NULL DEFAULT 0,
    display_order   INT          NOT NULL DEFAULT 0,
    PRIMARY KEY (plan_id, flight_id, cabin_class),
    CONSTRAINT fk_planflight_plan FOREIGN KEY (plan_id) REFERENCES monthly_plan (plan_id),
    CONSTRAINT fk_planflight_flight FOREIGN KEY (flight_id) REFERENCES flight (flight_id)
);

-- ============================================================
-- [M] 국내여행·투어 (11/20 추가)
-- ============================================================
CREATE TABLE domestic_city (
    city_id            BIGINT        NOT NULL AUTO_INCREMENT,
    name_ko            VARCHAR(30)   NOT NULL,
    province           VARCHAR(20)   NOT NULL,
    latitude           DECIMAL(9,6)  NOT NULL,
    longitude          DECIMAL(9,6)  NOT NULL,
    summary            VARCHAR(300)  NOT NULL,
    poster_color_from  CHAR(7)       NULL,
    poster_color_to    CHAR(7)       NULL,
    status             VARCHAR(15)   NOT NULL DEFAULT 'AVAILABLE',
    sort_order         INT           NOT NULL DEFAULT 0,
    PRIMARY KEY (city_id),
    CONSTRAINT uq_domestic_city_name UNIQUE (name_ko)
);

CREATE TABLE domestic_transport (
    transport_id      BIGINT        NOT NULL AUTO_INCREMENT,
    city_id           BIGINT        NOT NULL,
    origin            VARCHAR(10)   NOT NULL,
    mode              VARCHAR(15)   NOT NULL,
    name              VARCHAR(60)   NOT NULL,
    depart_time       TIME          NOT NULL,
    duration_minutes  INT           NOT NULL,
    fare              INT           NOT NULL,
    note              VARCHAR(200)  NULL,
    sort_order        INT           NOT NULL DEFAULT 0,
    PRIMARY KEY (transport_id),
    CONSTRAINT fk_transport_city FOREIGN KEY (city_id) REFERENCES domestic_city (city_id)
);

CREATE TABLE hotel (
    hotel_id          BIGINT        NOT NULL AUTO_INCREMENT,
    destination_id    BIGINT        NULL,
    city_id           BIGINT        NULL,
    name              VARCHAR(80)   NOT NULL,
    grade             TINYINT       NOT NULL,
    area              VARCHAR(50)   NOT NULL,
    summary           VARCHAR(200)  NOT NULL,
    amenities         VARCHAR(200)  NOT NULL,
    price_per_night   INT           NOT NULL,
    status            VARCHAR(15)   NOT NULL DEFAULT 'ON_SALE',
    sort_order        INT           NOT NULL DEFAULT 0,
    PRIMARY KEY (hotel_id),
    CONSTRAINT fk_hotel_dest FOREIGN KEY (destination_id) REFERENCES destination (destination_id),
    CONSTRAINT fk_hotel_city FOREIGN KEY (city_id) REFERENCES domestic_city (city_id)
);

CREATE TABLE cruise (
    cruise_id        BIGINT        NOT NULL AUTO_INCREMENT,
    destination_id   BIGINT        NOT NULL,
    title            VARCHAR(100)  NOT NULL,
    ship_name        VARCHAR(50)   NOT NULL,
    departure_port   VARCHAR(60)   NOT NULL,
    itinerary        VARCHAR(300)  NOT NULL,
    nights           TINYINT       NOT NULL,
    price_inside     INT           NOT NULL,
    price_balcony    INT           NOT NULL,
    highlights       VARCHAR(300)  NOT NULL,
    status           VARCHAR(15)   NOT NULL DEFAULT 'ON_SALE',
    sort_order       INT           NOT NULL DEFAULT 0,
    PRIMARY KEY (cruise_id),
    CONSTRAINT fk_cruise_dest FOREIGN KEY (destination_id) REFERENCES destination (destination_id)
);

CREATE TABLE tour (
    tour_id         BIGINT        NOT NULL AUTO_INCREMENT,
    scope           VARCHAR(10)   NOT NULL,
    destination_id  BIGINT        NULL,
    city_id         BIGINT        NULL,
    theme           VARCHAR(20)   NOT NULL,
    title           VARCHAR(100)  NOT NULL,
    subtitle        VARCHAR(200)  NOT NULL,
    collab_brand    VARCHAR(50)   NULL,
    highlights      VARCHAR(500)  NOT NULL,
    includes        VARCHAR(500)  NOT NULL,
    excludes        VARCHAR(500)  NOT NULL,
    source_note     VARCHAR(200)  NULL,
    status          VARCHAR(10)   NOT NULL DEFAULT 'ON_SALE',
    sort_order      INT           NOT NULL DEFAULT 0,
    PRIMARY KEY (tour_id),
    CONSTRAINT fk_tour_destination FOREIGN KEY (destination_id) REFERENCES destination (destination_id),
    CONSTRAINT fk_tour_city FOREIGN KEY (city_id) REFERENCES domestic_city (city_id),
    CONSTRAINT uq_tour_destination_theme UNIQUE (destination_id, theme),
    CONSTRAINT uq_tour_city_theme UNIQUE (city_id, theme)
);

CREATE TABLE tour_option (
    option_id         BIGINT   NOT NULL AUTO_INCREMENT,
    tour_id           BIGINT   NOT NULL,
    nights            TINYINT  NOT NULL,
    days              TINYINT  NOT NULL,
    price_per_person  INT      NOT NULL,
    min_people        TINYINT  NOT NULL DEFAULT 2,
    max_people        TINYINT  NOT NULL DEFAULT 20,
    PRIMARY KEY (option_id),
    CONSTRAINT fk_option_tour FOREIGN KEY (tour_id) REFERENCES tour (tour_id),
    CONSTRAINT uq_option_tour_nights UNIQUE (tour_id, nights)
);

CREATE TABLE tour_day (
    tour_day_id  BIGINT        NOT NULL AUTO_INCREMENT,
    option_id    BIGINT        NOT NULL,
    day_no       TINYINT       NOT NULL,
    title        VARCHAR(100)  NOT NULL,
    description  VARCHAR(500)  NOT NULL,
    PRIMARY KEY (tour_day_id),
    CONSTRAINT fk_day_option FOREIGN KEY (option_id) REFERENCES tour_option (option_id),
    CONSTRAINT uq_day_option_no UNIQUE (option_id, day_no)
);
