-- nado_gam 더미데이터. design/gen_data_sql.py 가 flight_dummy.csv 로 생성한 파일이다. 직접 고치지 말고 스크립트를 고친다.
-- 모든 항공편·편명·가격은 실제 노선을 참고한 가상 데이터이다.

-- [A] 관리자 / [U] 사용자 계정 (비밀번호 1234 의 BCrypt 해시)
INSERT INTO admin_account (login_id, password_hash, name, phone, email, role, status) VALUES ('admin', '$2a$10$/28dEnfkyY/xvDMFV71mqu8VARF0MC5jpDbh31V4cexP7PVMQD6l2', 'admin', '010-1234-5678', 'admin@gmail.com', 'ROLE_ADMIN', 'ACTIVE');
INSERT INTO member (login_id, password_hash, name, phone, email, role, status) VALUES ('user', '$2a$10$Hv5Dp9BXiWIzFmNLl29Kjey5Qofy/kCC8cY05NzmBUrWJWx2Y7IsW', 'user', '010-1111-2222', 'user@naver.com', 'ROLE_USER', 'ACTIVE');

-- [M] 국가
INSERT INTO country (country_code, name_ko, name_en, region) VALUES ('KR', '한국', 'South Korea', 'ASIA');
INSERT INTO country (country_code, name_ko, name_en, region) VALUES ('JP', '일본', 'Japan', 'ASIA');
INSERT INTO country (country_code, name_ko, name_en, region) VALUES ('CN', '중국', 'China', 'ASIA');
INSERT INTO country (country_code, name_ko, name_en, region) VALUES ('HK', '홍콩', 'Hong Kong', 'ASIA');
INSERT INTO country (country_code, name_ko, name_en, region) VALUES ('TH', '태국', 'Thailand', 'ASIA');
INSERT INTO country (country_code, name_ko, name_en, region) VALUES ('TW', '대만', 'Taiwan', 'ASIA');
INSERT INTO country (country_code, name_ko, name_en, region) VALUES ('SG', '싱가포르', 'Singapore', 'ASIA');
INSERT INTO country (country_code, name_ko, name_en, region) VALUES ('RU', '러시아', 'Russia', 'ASIA');
INSERT INTO country (country_code, name_ko, name_en, region) VALUES ('FR', '프랑스', 'France', 'EUROPE');
INSERT INTO country (country_code, name_ko, name_en, region) VALUES ('GB', '영국', 'United Kingdom', 'EUROPE');
INSERT INTO country (country_code, name_ko, name_en, region) VALUES ('DE', '독일', 'Germany', 'EUROPE');
INSERT INTO country (country_code, name_ko, name_en, region) VALUES ('ES', '스페인', 'Spain', 'EUROPE');
INSERT INTO country (country_code, name_ko, name_en, region) VALUES ('IT', '이탈리아', 'Italy', 'EUROPE');
INSERT INTO country (country_code, name_ko, name_en, region) VALUES ('TR', '튀르키예', 'Turkiye', 'EUROPE');
INSERT INTO country (country_code, name_ko, name_en, region) VALUES ('FI', '핀란드', 'Finland', 'EUROPE');
INSERT INTO country (country_code, name_ko, name_en, region) VALUES ('US', '미국', 'United States', 'NORTH_AMERICA');
INSERT INTO country (country_code, name_ko, name_en, region) VALUES ('CA', '캐나다', 'Canada', 'NORTH_AMERICA');
INSERT INTO country (country_code, name_ko, name_en, region) VALUES ('BR', '브라질', 'Brazil', 'SOUTH_AMERICA');
INSERT INTO country (country_code, name_ko, name_en, region) VALUES ('AE', '아랍에미리트', 'United Arab Emirates', 'MIDDLE_EAST');
INSERT INTO country (country_code, name_ko, name_en, region) VALUES ('QA', '카타르', 'Qatar', 'MIDDLE_EAST');
INSERT INTO country (country_code, name_ko, name_en, region) VALUES ('EG', '이집트', 'Egypt', 'AFRICA');
INSERT INTO country (country_code, name_ko, name_en, region) VALUES ('ZA', '남아프리카공화국', 'South Africa', 'AFRICA');
INSERT INTO country (country_code, name_ko, name_en, region) VALUES ('ET', '에티오피아', 'Ethiopia', 'AFRICA');
INSERT INTO country (country_code, name_ko, name_en, region) VALUES ('AU', '호주', 'Australia', 'OCEANIA');
INSERT INTO country (country_code, name_ko, name_en, region) VALUES ('NL', '네덜란드', 'Netherlands', 'EUROPE');
INSERT INTO country (country_code, name_ko, name_en, region) VALUES ('CZ', '체코', 'Czechia', 'EUROPE');
INSERT INTO country (country_code, name_ko, name_en, region) VALUES ('AT', '오스트리아', 'Austria', 'EUROPE');
INSERT INTO country (country_code, name_ko, name_en, region) VALUES ('PT', '포르투갈', 'Portugal', 'EUROPE');
INSERT INTO country (country_code, name_ko, name_en, region) VALUES ('MO', '마카오', 'Macao', 'ASIA');
INSERT INTO country (country_code, name_ko, name_en, region) VALUES ('VN', '베트남', 'Vietnam', 'ASIA');
INSERT INTO country (country_code, name_ko, name_en, region) VALUES ('ID', '인도네시아', 'Indonesia', 'ASIA');
INSERT INTO country (country_code, name_ko, name_en, region) VALUES ('MY', '말레이시아', 'Malaysia', 'ASIA');
INSERT INTO country (country_code, name_ko, name_en, region) VALUES ('MX', '멕시코', 'Mexico', 'NORTH_AMERICA');
INSERT INTO country (country_code, name_ko, name_en, region) VALUES ('GU', '괌', 'Guam', 'OCEANIA');

-- [M] 공항 (좌표는 지구본용)
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('ICN', '인천국제공항', 'Incheon International Airport', '인천', 'KR', 37.4602, 126.4407, 'Asia/Seoul', FALSE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('GMP', '김포국제공항', 'Gimpo International Airport', '서울', 'KR', 37.5583, 126.7906, 'Asia/Seoul', FALSE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('PUS', '김해국제공항', 'Gimhae International Airport', '부산', 'KR', 35.1795, 128.9382, 'Asia/Seoul', FALSE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('CDG', '샤를드골국제공항', 'Charles de Gaulle Airport', '파리', 'FR', 49.0097, 2.5479, 'Europe/Paris', FALSE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('LHR', '히드로공항', 'London Heathrow Airport', '런던', 'GB', 51.47, -0.4543, 'Europe/London', FALSE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('BER', '브란덴부르크공항', 'Berlin Brandenburg Airport', '베를린', 'DE', 52.3667, 13.5033, 'Europe/Berlin', FALSE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('MAD', '바라하스공항', 'Adolfo Suarez Madrid-Barajas Airport', '마드리드', 'ES', 40.4983, -3.5676, 'Europe/Madrid', FALSE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('FCO', '피우미치노공항', 'Leonardo da Vinci-Fiumicino Airport', '로마', 'IT', 41.8003, 12.2389, 'Europe/Rome', FALSE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('BCN', '엘프라트공항', 'Barcelona-El Prat Airport', '바르셀로나', 'ES', 41.2974, 2.0833, 'Europe/Madrid', FALSE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('HND', '하네다공항', 'Tokyo Haneda Airport', '도쿄', 'JP', 35.5494, 139.7798, 'Asia/Tokyo', FALSE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('NRT', '나리타국제공항', 'Narita International Airport', '도쿄', 'JP', 35.772, 140.3929, 'Asia/Tokyo', FALSE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('KIX', '간사이국제공항', 'Kansai International Airport', '오사카', 'JP', 34.432, 135.2304, 'Asia/Tokyo', FALSE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('FUK', '후쿠오카공항', 'Fukuoka Airport', '후쿠오카', 'JP', 33.5859, 130.4507, 'Asia/Tokyo', FALSE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('CTS', '신치토세공항', 'New Chitose Airport', '삿포로', 'JP', 42.7752, 141.6923, 'Asia/Tokyo', FALSE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('PEK', '베이징서우두공항', 'Beijing Capital International Airport', '베이징', 'CN', 40.0799, 116.6031, 'Asia/Shanghai', FALSE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('BKK', '수완나품공항', 'Suvarnabhumi Airport', '방콕', 'TH', 13.69, 100.7501, 'Asia/Bangkok', FALSE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('VVO', '블라디보스토크공항', 'Vladivostok International Airport', '블라디보스토크', 'RU', 43.399, 132.148, 'Asia/Vladivostok', FALSE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('JFK', '존F케네디공항', 'John F. Kennedy International Airport', '뉴욕', 'US', 40.6413, -73.7781, 'America/New_York', FALSE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('IAD', '덜레스국제공항', 'Washington Dulles International Airport', '워싱턴D.C.', 'US', 38.9531, -77.4565, 'America/New_York', FALSE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('LAX', '로스앤젤레스국제공항', 'Los Angeles International Airport', '로스앤젤레스', 'US', 33.9416, -118.4085, 'America/Los_Angeles', FALSE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('HKG', '홍콩국제공항', 'Hong Kong International Airport', '홍콩', 'HK', 22.308, 113.9185, 'Asia/Hong_Kong', FALSE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('PVG', '푸둥국제공항', 'Shanghai Pudong International Airport', '상하이', 'CN', 31.1443, 121.8083, 'Asia/Shanghai', FALSE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('DXB', '두바이국제공항', 'Dubai International Airport', '두바이', 'AE', 25.2532, 55.3657, 'Asia/Dubai', TRUE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('ORD', '오헤어국제공항', 'O''Hare International Airport', '시카고', 'US', 41.9742, -87.9073, 'America/Chicago', FALSE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('SYD', '시드니공항', 'Sydney Kingsford Smith Airport', '시드니', 'AU', -33.9399, 151.1753, 'Australia/Sydney', FALSE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('YVR', '밴쿠버국제공항', 'Vancouver International Airport', '밴쿠버', 'CA', 49.1967, -123.1815, 'America/Vancouver', FALSE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('GRU', '과룰류스국제공항', 'Sao Paulo-Guarulhos International Airport', '상파울루', 'BR', -23.4356, -46.4731, 'America/Sao_Paulo', FALSE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('CAI', '카이로국제공항', 'Cairo International Airport', '카이로', 'EG', 30.1219, 31.4056, 'Africa/Cairo', FALSE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('CPT', '케이프타운국제공항', 'Cape Town International Airport', '케이프타운', 'ZA', -33.9715, 18.6021, 'Africa/Johannesburg', FALSE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('FRA', '프랑크푸르트공항', 'Frankfurt Airport', '프랑크푸르트', 'DE', 50.0379, 8.5622, 'Europe/Berlin', TRUE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('IST', '이스탄불공항', 'Istanbul Airport', '이스탄불', 'TR', 41.2753, 28.7519, 'Europe/Istanbul', TRUE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('HEL', '헬싱키공항', 'Helsinki-Vantaa Airport', '헬싱키', 'FI', 60.3172, 24.9633, 'Europe/Helsinki', TRUE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('DOH', '하마드국제공항', 'Hamad International Airport', '도하', 'QA', 25.2731, 51.6081, 'Asia/Qatar', TRUE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('TPE', '타오위안국제공항', 'Taiwan Taoyuan International Airport', '타이베이', 'TW', 25.0777, 121.2328, 'Asia/Taipei', TRUE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('SEA', '시애틀타코마국제공항', 'Seattle-Tacoma International Airport', '시애틀', 'US', 47.4502, -122.3088, 'America/Los_Angeles', TRUE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('HNL', '호놀룰루공항', 'Daniel K. Inouye International Airport', '호놀룰루', 'US', 21.3187, -157.9224, 'Pacific/Honolulu', TRUE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('SIN', '창이공항', 'Singapore Changi Airport', '싱가포르', 'SG', 1.3644, 103.9915, 'Asia/Singapore', TRUE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('ADD', '볼레국제공항', 'Addis Ababa Bole International Airport', '아디스아바바', 'ET', 8.9779, 38.7993, 'Africa/Addis_Ababa', TRUE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('MXP', '밀라노말펜사공항', 'Milan Malpensa Airport', '밀라노', 'IT', 45.6306, 8.7281, 'Europe/Rome', FALSE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('AMS', '스키폴공항', 'Amsterdam Airport Schiphol', '암스테르담', 'NL', 52.3105, 4.7683, 'Europe/Amsterdam', FALSE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('PRG', '바츨라프하벨공항', 'Vaclav Havel Airport Prague', '프라하', 'CZ', 50.1008, 14.26, 'Europe/Prague', FALSE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('VIE', '빈국제공항', 'Vienna International Airport', '빈', 'AT', 48.1103, 16.5697, 'Europe/Vienna', FALSE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('LIS', '리스본공항', 'Lisbon Humberto Delgado Airport', '리스본', 'PT', 38.7742, -9.1342, 'Europe/Lisbon', FALSE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('EDI', '에든버러공항', 'Edinburgh Airport', '에든버러', 'GB', 55.95, -3.3725, 'Europe/London', FALSE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('MFM', '마카오국제공항', 'Macau International Airport', '마카오', 'MO', 22.1496, 113.5916, 'Asia/Macau', FALSE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('DAD', '다낭국제공항', 'Da Nang International Airport', '다낭', 'VN', 16.0439, 108.199, 'Asia/Ho_Chi_Minh', FALSE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('CXR', '캄란국제공항', 'Cam Ranh International Airport', '나트랑', 'VN', 11.9982, 109.2194, 'Asia/Ho_Chi_Minh', FALSE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('PQC', '푸꾸옥국제공항', 'Phu Quoc International Airport', '푸꾸옥', 'VN', 10.1698, 103.9931, 'Asia/Ho_Chi_Minh', FALSE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('DPS', '응우라라이공항', 'Ngurah Rai International Airport', '발리', 'ID', -8.7482, 115.167, 'Asia/Makassar', FALSE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('HAN', '노이바이국제공항', 'Noi Bai International Airport', '하노이', 'VN', 21.2212, 105.8072, 'Asia/Ho_Chi_Minh', FALSE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('SGN', '떤선녓국제공항', 'Tan Son Nhat International Airport', '호치민', 'VN', 10.8188, 106.652, 'Asia/Ho_Chi_Minh', FALSE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('KUL', '쿠알라룸푸르국제공항', 'Kuala Lumpur International Airport', '쿠알라룸푸르', 'MY', 2.7456, 101.7099, 'Asia/Kuala_Lumpur', FALSE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('SFO', '샌프란시스코국제공항', 'San Francisco International Airport', '샌프란시스코', 'US', 37.6213, -122.379, 'America/Los_Angeles', FALSE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('YYZ', '토론토피어슨공항', 'Toronto Pearson International Airport', '토론토', 'CA', 43.6777, -79.6248, 'America/Toronto', FALSE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('MEX', '베니토후아레스공항', 'Mexico City International Airport', '멕시코시티', 'MX', 19.4363, -99.0721, 'America/Mexico_City', FALSE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('MEL', '멜버른공항', 'Melbourne Airport', '멜버른', 'AU', -37.669, 144.841, 'Australia/Melbourne', FALSE);
INSERT INTO airport (airport_code, name_ko, name_en, city_name_ko, country_code, latitude, longitude, timezone, is_hub) VALUES ('GUM', '괌국제공항', 'Antonio B. Won Pat International Airport', '괌', 'GU', 13.4834, 144.796, 'Pacific/Guam', FALSE);

-- [M] 여행지 27개 (destination_id 는 1부터 순서대로)
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('파리', 'Paris', 'FR', 'CDG', 48.8566, 2.3522, 'AVAILABLE', NULL, '낭만과 예술이 흐르는 도시, 에펠탑과 루브르', NULL, NULL, 1);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('런던', 'London', 'GB', 'LHR', 51.5074, -0.1278, 'AVAILABLE', NULL, '빅벤과 템스강, 클래식과 현대가 공존하는 도시', NULL, NULL, 2);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('베를린', 'Berlin', 'DE', 'BER', 52.52, 13.405, 'AVAILABLE', NULL, '역사와 예술, 자유로운 분위기의 독일 수도', NULL, NULL, 3);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('마드리드', 'Madrid', 'ES', 'MAD', 40.4168, -3.7038, 'AVAILABLE', NULL, '프라도 미술관과 열정적인 밤문화의 스페인 수도', NULL, NULL, 4);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('로마', 'Rome', 'IT', 'FCO', 41.9028, 12.4964, 'AVAILABLE', NULL, '콜로세움과 바티칸, 도시 전체가 박물관인 영원의 도시', '#b5382d', '#f2a65a', 5);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('바르셀로나', 'Barcelona', 'ES', 'BCN', 41.3874, 2.1686, 'AVAILABLE', NULL, '가우디의 건축과 지중해가 만나는 도시', NULL, NULL, 6);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('서울', 'Seoul', 'KR', 'ICN', 37.5665, 126.978, 'AVAILABLE', NULL, '전통과 K-컬처가 어우러진 대한민국의 수도', NULL, NULL, 7);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('부산', 'Busan', 'KR', 'PUS', 35.1796, 129.0756, 'AVAILABLE', NULL, '바다와 도시가 어우러진 대한민국 제2의 도시', NULL, NULL, 8);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('도쿄', 'Tokyo', 'JP', 'NRT', 35.6762, 139.6503, 'AVAILABLE', NULL, '쇼핑과 미식, 전통이 가득한 일본의 수도', '#be123c', '#fb7185', 9);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('오사카', 'Osaka', 'JP', 'KIX', 34.6937, 135.5023, 'AVAILABLE', NULL, '먹다 망한다는 미식의 도시, 도톤보리와 오사카성', NULL, NULL, 10);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('후쿠오카', 'Fukuoka', 'JP', 'FUK', 33.5904, 130.4017, 'AVAILABLE', NULL, '가깝고 먹거리 풍부한 규슈의 관문', NULL, NULL, 11);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('삿포로', 'Sapporo', 'JP', 'CTS', 43.0618, 141.3545, 'AVAILABLE', NULL, '겨울 눈 축제와 라멘, 맥주의 홋카이도', '#2f6fed', '#9fd6ff', 12);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('베이징', 'Beijing', 'CN', 'PEK', 39.9042, 116.4074, 'AVAILABLE', NULL, '자금성과 만리장성, 중국의 수도', NULL, NULL, 13);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('방콕', 'Bangkok', 'TH', 'BKK', 13.7563, 100.5018, 'AVAILABLE', NULL, '황금빛 사원과 길거리 음식의 도시', NULL, NULL, 14);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('블라디보스토크', 'Vladivostok', 'RU', 'VVO', 43.1155, 131.8855, 'UNAVAILABLE', '전쟁·제재로 한국발 직항 운항 중단', '러시아 극동의 항구 도시', NULL, NULL, 15);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('뉴욕', 'New York', 'US', 'JFK', 40.7128, -74.006, 'AVAILABLE', NULL, '타임스퀘어와 센트럴파크, 잠들지 않는 도시', NULL, NULL, 16);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('워싱턴D.C.', 'Washington D.C.', 'US', 'IAD', 38.9072, -77.0369, 'AVAILABLE', NULL, '백악관과 스미소니언 박물관의 미국 수도', NULL, NULL, 17);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('로스앤젤레스', 'Los Angeles', 'US', 'LAX', 34.0522, -118.2437, 'AVAILABLE', NULL, '할리우드와 해변, 캘리포니아의 햇살', '#7c3aed', '#f97316', 18);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('홍콩', 'Hong Kong', 'HK', 'HKG', 22.3193, 114.1694, 'AVAILABLE', NULL, '야경과 딤섬, 동서양이 섞인 도시', '#0e7490', '#db2777', 19);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('상하이', 'Shanghai', 'CN', 'PVG', 31.2304, 121.4737, 'AVAILABLE', NULL, '와이탄의 야경과 초고층 빌딩의 도시', NULL, NULL, 20);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('두바이', 'Dubai', 'AE', 'DXB', 25.2048, 55.2708, 'AVAILABLE', NULL, '부르즈 할리파와 사막, 쇼핑의 도시', NULL, NULL, 21);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('시카고', 'Chicago', 'US', 'ORD', 41.8781, -87.6298, 'AVAILABLE', NULL, '건축과 재즈, 딥디시 피자의 도시', NULL, NULL, 22);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('시드니', 'Sydney', 'AU', 'SYD', -33.8688, 151.2093, 'AVAILABLE', NULL, '오페라하우스와 하버브리지, 남반구의 항구', NULL, NULL, 23);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('밴쿠버', 'Vancouver', 'CA', 'YVR', 49.2827, -123.1207, 'AVAILABLE', NULL, '산과 바다가 맞닿은 캐나다 서부의 관문', NULL, NULL, 24);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('상파울루', 'Sao Paulo', 'BR', 'GRU', -23.5505, -46.6333, 'AVAILABLE', NULL, '남미 최대 도시, 다양한 문화와 미식', NULL, NULL, 25);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('카이로', 'Cairo', 'EG', 'CAI', 30.0444, 31.2357, 'AVAILABLE', NULL, '피라미드와 스핑크스, 고대 문명의 도시', NULL, NULL, 26);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('케이프타운', 'Cape Town', 'ZA', 'CPT', -33.9249, 18.4241, 'AVAILABLE', NULL, '테이블마운틴과 희망봉, 아프리카 남단의 보석', '#0f766e', '#f59e0b', 27);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('밀라노', 'Milan', 'IT', 'MXP', 45.4642, 9.19, 'AVAILABLE', NULL, '패션과 디자인, 두오모의 이탈리아 북부 중심지', NULL, NULL, 28);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('암스테르담', 'Amsterdam', 'NL', 'AMS', 52.3676, 4.9041, 'AVAILABLE', NULL, '운하와 자전거, 반 고흐의 도시', NULL, NULL, 29);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('이스탄불', 'Istanbul', 'TR', 'IST', 41.0082, 28.9784, 'AVAILABLE', NULL, '동양과 서양이 만나는 아야소피아의 도시', NULL, NULL, 30);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('프라하', 'Prague', 'CZ', 'PRG', 50.0755, 14.4378, 'AVAILABLE', NULL, '중세 건축이 그대로 남은 동유럽의 보석', NULL, NULL, 31);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('빈', 'Vienna', 'AT', 'VIE', 48.2082, 16.3738, 'AVAILABLE', NULL, '음악과 커피하우스, 합스부르크의 도시', NULL, NULL, 32);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('리스본', 'Lisbon', 'PT', 'LIS', 38.7223, -9.1393, 'AVAILABLE', NULL, '트램과 노을, 에그타르트의 포르투갈 수도', NULL, NULL, 33);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('에든버러', 'Edinburgh', 'GB', 'EDI', 55.9533, -3.1883, 'AVAILABLE', NULL, '언덕 위 성과 축제, 스코틀랜드의 수도', NULL, NULL, 34);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('싱가포르', 'Singapore', 'SG', 'SIN', 1.3521, 103.8198, 'AVAILABLE', NULL, '가든스 바이 더 베이와 미식의 도시국가', NULL, NULL, 35);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('마카오', 'Macau', 'MO', 'MFM', 22.1987, 113.5439, 'AVAILABLE', NULL, '포르투갈 거리와 화려한 야경의 특별행정구', NULL, NULL, 36);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('타이베이', 'Taipei', 'TW', 'TPE', 25.033, 121.5654, 'AVAILABLE', NULL, '야시장과 온천, 가까운 대만의 수도', NULL, NULL, 37);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('다낭', 'Da Nang', 'VN', 'DAD', 16.0544, 108.2022, 'AVAILABLE', NULL, '해변과 호이안 올드타운을 품은 휴양 도시', NULL, NULL, 38);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('나트랑', 'Nha Trang', 'VN', 'CXR', 12.2388, 109.1967, 'AVAILABLE', NULL, '맑은 바다와 리조트의 베트남 해변 도시', NULL, NULL, 39);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('푸꾸옥', 'Phu Quoc', 'VN', 'PQC', 10.2899, 103.984, 'AVAILABLE', NULL, '에메랄드빛 바다의 베트남 최대 섬', NULL, NULL, 40);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('발리', 'Bali', 'ID', 'DPS', -8.65, 115.2167, 'AVAILABLE', NULL, '신들의 섬, 서핑과 사원과 스파', NULL, NULL, 41);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('하노이', 'Hanoi', 'VN', 'HAN', 21.0278, 105.8342, 'AVAILABLE', NULL, '쌀국수와 구시가지, 베트남의 수도', NULL, NULL, 42);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('호치민', 'Ho Chi Minh City', 'VN', 'SGN', 10.8231, 106.6297, 'AVAILABLE', NULL, '활기찬 오토바이 물결의 베트남 남부 도시', NULL, NULL, 43);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('쿠알라룸푸르', 'Kuala Lumpur', 'MY', 'KUL', 3.139, 101.6869, 'AVAILABLE', NULL, '페트로나스 트윈타워가 솟은 말레이시아 수도', NULL, NULL, 44);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('샌프란시스코', 'San Francisco', 'US', 'SFO', 37.7749, -122.4194, 'AVAILABLE', NULL, '금문교와 언덕 길, 캘리포니아의 안개 도시', NULL, NULL, 45);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('토론토', 'Toronto', 'CA', 'YYZ', 43.6532, -79.3832, 'AVAILABLE', NULL, 'CN타워와 다문화, 캐나다 최대 도시', NULL, NULL, 46);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('호놀룰루', 'Honolulu', 'US', 'HNL', 21.3069, -157.8583, 'AVAILABLE', NULL, '와이키키 해변과 다이아몬드헤드의 하와이', NULL, NULL, 47);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('멕시코시티', 'Mexico City', 'MX', 'MEX', 19.4326, -99.1332, 'AVAILABLE', NULL, '고대 아즈텍 위에 세운 거대한 문화 도시', NULL, NULL, 48);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('멜버른', 'Melbourne', 'AU', 'MEL', -37.8136, 144.9631, 'AVAILABLE', NULL, '카페와 골목 예술, 타임아웃 2026 세계 1위 도시', NULL, NULL, 49);
INSERT INTO destination (name_ko, name_en, country_code, main_airport, latitude, longitude, status, unavailable_reason, summary, poster_color_from, poster_color_to, sort_order) VALUES ('괌', 'Guam', 'GU', 'GUM', 13.4443, 144.7937, 'AVAILABLE', NULL, '가깝고 한적한 태평양의 휴양 섬', NULL, NULL, 50);

-- [M] 항공사
INSERT INTO airline (airline_code, name_ko, name_en, carrier_type) VALUES ('MG', '민국항공', 'Minguk Air', 'FSC');
INSERT INTO airline (airline_code, name_ko, name_en, carrier_type) VALUES ('AQ', '아리아항공', 'Aria Airlines', 'FSC');
INSERT INTO airline (airline_code, name_ko, name_en, carrier_type) VALUES ('BD', '에어바다', 'Air Bada', 'LCC');
INSERT INTO airline (airline_code, name_ko, name_en, carrier_type) VALUES ('HR', '한라에어', 'Halla Air', 'LCC');
INSERT INTO airline (airline_code, name_ko, name_en, carrier_type) VALUES ('NU', '에어누리', 'Air Nuri', 'LCC');
INSERT INTO airline (airline_code, name_ko, name_en, carrier_type) VALUES ('BS', '푸른하늘항공', 'Blue Sky Airlines', 'LCC');
INSERT INTO airline (airline_code, name_ko, name_en, carrier_type) VALUES ('GL', '에어갈리아', 'Air Gallia', 'FSC');
INSERT INTO airline (airline_code, name_ko, name_en, carrier_type) VALUES ('RH', '라인에어', 'Rhein Air', 'FSC');
INSERT INTO airline (airline_code, name_ko, name_en, carrier_type) VALUES ('BP', '보스포루스항공', 'Bosphorus Airlines', 'FSC');
INSERT INTO airline (airline_code, name_ko, name_en, carrier_type) VALUES ('LP', '라플란드항공', 'Lapland Air', 'FSC');
INSERT INTO airline (airline_code, name_ko, name_en, carrier_type) VALUES ('OA', '오아시스항공', 'Oasis Airways', 'FSC');
INSERT INTO airline (airline_code, name_ko, name_en, carrier_type) VALUES ('GF', '걸프스타항공', 'Gulfstar Airways', 'FSC');
INSERT INTO airline (airline_code, name_ko, name_en, carrier_type) VALUES ('SM', '시암항공', 'Siam Airways', 'FSC');
INSERT INTO airline (airline_code, name_ko, name_en, carrier_type) VALUES ('EB', '에버블루항공', 'Everblue Air', 'FSC');
INSERT INTO airline (airline_code, name_ko, name_en, carrier_type) VALUES ('SK', '사쿠라항공', 'Sakura Airlines', 'FSC');
INSERT INTO airline (airline_code, name_ko, name_en, carrier_type) VALUES ('DS', '용성항공', 'Dragonstar Air', 'FSC');
INSERT INTO airline (airline_code, name_ko, name_en, carrier_type) VALUES ('AZ', '청룡항공', 'Azure Dragon Air', 'FSC');
INSERT INTO airline (airline_code, name_ko, name_en, carrier_type) VALUES ('PC', '태평양항공', 'Pacific Crest Airways', 'FSC');
INSERT INTO airline (airline_code, name_ko, name_en, carrier_type) VALUES ('AT', '아틀라스항공', 'Atlas Airlines', 'FSC');
INSERT INTO airline (airline_code, name_ko, name_en, carrier_type) VALUES ('UW', '유니온항공', 'Union Airways', 'FSC');
INSERT INTO airline (airline_code, name_ko, name_en, carrier_type) VALUES ('RI', '무지개섬항공', 'Rainbow Isles Air', 'FSC');
INSERT INTO airline (airline_code, name_ko, name_en, carrier_type) VALUES ('HX', '항구익스프레스', 'Harbor Express', 'LCC');
INSERT INTO airline (airline_code, name_ko, name_en, carrier_type) VALUES ('SB', '봄바람항공', 'Spring Breeze Air', 'LCC');
INSERT INTO airline (airline_code, name_ko, name_en, carrier_type) VALUES ('SX', '남십자성항공', 'Southern Cross Airways', 'FSC');
INSERT INTO airline (airline_code, name_ko, name_en, carrier_type) VALUES ('LC', '라이언시티항공', 'Lion City Airways', 'FSC');
INSERT INTO airline (airline_code, name_ko, name_en, carrier_type) VALUES ('ML', '메이플항공', 'Maple Leaf Air', 'FSC');
INSERT INTO airline (airline_code, name_ko, name_en, carrier_type) VALUES ('BN', '블루나일항공', 'Blue Nile Airlines', 'FSC');
INSERT INTO airline (airline_code, name_ko, name_en, carrier_type) VALUES ('TL', '튤립항공', 'Tulip Airways', 'FSC');
INSERT INTO airline (airline_code, name_ko, name_en, carrier_type) VALUES ('AP', '알프스항공', 'Alpine Airways', 'FSC');
INSERT INTO airline (airline_code, name_ko, name_en, carrier_type) VALUES ('TH', '템스항공', 'Thames Airways', 'FSC');
INSERT INTO airline (airline_code, name_ko, name_en, carrier_type) VALUES ('LT', '라이트제트', 'Lightjet', 'LCC');
INSERT INTO airline (airline_code, name_ko, name_en, carrier_type) VALUES ('PL', '주강항공', 'Pearl River Air', 'FSC');
INSERT INTO airline (airline_code, name_ko, name_en, carrier_type) VALUES ('FM', '포모사항공', 'Formosa Airlines', 'FSC');
INSERT INTO airline (airline_code, name_ko, name_en, carrier_type) VALUES ('RR', '홍강항공', 'Red River Airlines', 'FSC');
INSERT INTO airline (airline_code, name_ko, name_en, carrier_type) VALUES ('MJ', '메콩제트', 'Mekong Jet', 'LCC');
INSERT INTO airline (airline_code, name_ko, name_en, carrier_type) VALUES ('NS', '누사항공', 'Nusa Airways', 'FSC');
INSERT INTO airline (airline_code, name_ko, name_en, carrier_type) VALUES ('MA', '물라카항공', 'Malacca Airlines', 'FSC');
INSERT INTO airline (airline_code, name_ko, name_en, carrier_type) VALUES ('BO', '보르네오엑스', 'Borneo X', 'LCC');
INSERT INTO airline (airline_code, name_ko, name_en, carrier_type) VALUES ('ZT', '아즈텍항공', 'Aztec Airlines', 'FSC');

-- [M] 항공편 154편
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('MG901', 'MG', 1, 'ICN', 'CDG', 'DIRECT', 0, '11:00:00', '17:20:00', 0, 860, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('GL267', 'GL', 1, 'ICN', 'CDG', 'DIRECT', 0, '23:30:00', '05:50:00', 1, 860, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('RH713', 'RH', 1, 'ICN', 'CDG', 'CONNECTING', 1, '13:10:00', '22:50:00', 0, 1060, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('MG907', 'MG', 2, 'ICN', 'LHR', 'DIRECT', 0, '10:40:00', '16:10:00', 0, 870, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('AQ521', 'AQ', 2, 'ICN', 'LHR', 'DIRECT', 0, '18:30:00', '00:10:00', 1, 880, 'A350-900', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('BP091', 'BP', 2, 'ICN', 'LHR', 'CONNECTING', 1, '21:30:00', '06:25:00', 1, 1075, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('RH719', 'RH', 3, 'ICN', 'BER', 'CONNECTING', 1, '13:10:00', '21:00:00', 0, 950, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('LP042', 'LP', 3, 'ICN', 'BER', 'CONNECTING', 1, '09:50:00', '17:00:00', 0, 910, 'A350-900', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('BP093', 'BP', 3, 'ICN', 'BER', 'CONNECTING', 1, '21:30:00', '09:55:00', 1, 1225, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('MG927', 'MG', 4, 'ICN', 'MAD', 'DIRECT', 0, '10:30:00', '16:35:00', 0, 845, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('OA325', 'OA', 4, 'ICN', 'MAD', 'CONNECTING', 1, '22:00:00', '09:40:00', 1, 1180, 'A380-800', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('GL269', 'GL', 4, 'ICN', 'MAD', 'CONNECTING', 1, '11:00:00', '19:30:00', 0, 990, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('MG937', 'MG', 5, 'ICN', 'FCO', 'DIRECT', 0, '11:20:00', '18:00:00', 0, 880, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('BP095', 'BP', 5, 'ICN', 'FCO', 'CONNECTING', 1, '21:30:00', '06:50:00', 1, 1040, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('GF859', 'GF', 5, 'ICN', 'FCO', 'CONNECTING', 1, '22:40:00', '09:30:00', 1, 1130, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('MG929', 'MG', 6, 'ICN', 'BCN', 'DIRECT', 0, '12:10:00', '18:00:00', 0, 830, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('RH716', 'RH', 6, 'ICN', 'BCN', 'CONNECTING', 1, '13:10:00', '22:40:00', 0, 1050, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('GF861', 'GF', 6, 'ICN', 'BCN', 'CONNECTING', 1, '22:40:00', '10:00:00', 1, 1160, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('AQ1085', 'AQ', 7, 'HND', 'GMP', 'DIRECT', 0, '08:00:00', '10:20:00', 0, 140, 'A321neo', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('MG012', 'MG', 7, 'LAX', 'ICN', 'DIRECT', 0, '13:00:00', '19:40:00', 1, 820, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('SM659', 'SM', 7, 'BKK', 'ICN', 'DIRECT', 0, '23:00:00', '06:35:00', 1, 335, 'A330-300', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('BD112', 'BD', 8, 'KIX', 'PUS', 'DIRECT', 0, '09:30:00', '11:15:00', 0, 105, 'B737-800', 15, FALSE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('BD143', 'BD', 8, 'FUK', 'PUS', 'DIRECT', 0, '14:20:00', '15:30:00', 0, 70, 'B737-800', 15, FALSE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('HR1102', 'HR', 8, 'NRT', 'PUS', 'DIRECT', 0, '10:10:00', '12:35:00', 0, 145, 'B737-800', 15, FALSE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('HR1101', 'HR', 9, 'ICN', 'NRT', 'DIRECT', 0, '06:30:00', '08:55:00', 0, 145, 'B737-800', 15, FALSE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('MG2701', 'MG', 9, 'ICN', 'NRT', 'DIRECT', 0, '09:00:00', '11:30:00', 0, 150, 'A321neo', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('AQ1081', 'AQ', 9, 'ICN', 'HND', 'DIRECT', 0, '07:40:00', '10:00:00', 0, 140, 'A321neo', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('SK094', 'SK', 9, 'GMP', 'HND', 'DIRECT', 0, '12:00:00', '14:15:00', 0, 135, 'A321neo', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('EB163', 'EB', 9, 'ICN', 'NRT', 'CONNECTING', 1, '08:10:00', '15:50:00', 0, 460, 'A350-900', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('MG723', 'MG', 10, 'ICN', 'KIX', 'DIRECT', 0, '09:30:00', '11:25:00', 0, 115, 'A321neo', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('HR1301', 'HR', 10, 'ICN', 'KIX', 'DIRECT', 0, '07:10:00', '09:00:00', 0, 110, 'B737-800', 15, FALSE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('BD113', 'BD', 10, 'PUS', 'KIX', 'DIRECT', 0, '12:50:00', '14:15:00', 0, 85, 'B737-800', 15, FALSE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('AQ132', 'AQ', 11, 'ICN', 'FUK', 'DIRECT', 0, '08:50:00', '10:15:00', 0, 85, 'A321neo', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('NU261', 'NU', 11, 'ICN', 'FUK', 'DIRECT', 0, '15:00:00', '16:20:00', 0, 80, 'B737-800', 15, FALSE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('BD142', 'BD', 11, 'PUS', 'FUK', 'DIRECT', 0, '08:10:00', '09:20:00', 0, 70, 'B737-800', 15, FALSE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('MG767', 'MG', 12, 'ICN', 'CTS', 'DIRECT', 0, '10:00:00', '12:45:00', 0, 165, 'A321neo', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('HR1503', 'HR', 12, 'ICN', 'CTS', 'DIRECT', 0, '08:20:00', '11:00:00', 0, 160, 'B737-800', 15, FALSE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('AQ1087', 'AQ', 12, 'ICN', 'CTS', 'CONNECTING', 1, '07:00:00', '13:10:00', 0, 370, 'A350-900', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('MG851', 'MG', 13, 'ICN', 'PEK', 'DIRECT', 0, '09:10:00', '10:15:00', 0, 125, 'A321neo', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('DS124', 'DS', 13, 'ICN', 'PEK', 'DIRECT', 0, '13:30:00', '14:40:00', 0, 130, 'A321neo', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('AZ504', 'AZ', 13, 'ICN', 'PEK', 'CONNECTING', 1, '07:40:00', '13:00:00', 0, 380, 'A350-900', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('MG651', 'MG', 14, 'ICN', 'BKK', 'DIRECT', 0, '18:00:00', '21:45:00', 0, 345, 'A330-300', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('SM657', 'SM', 14, 'ICN', 'BKK', 'DIRECT', 0, '09:30:00', '13:10:00', 0, 340, 'A330-300', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('PC417', 'PC', 14, 'ICN', 'BKK', 'CONNECTING', 1, '10:20:00', '17:50:00', 0, 570, 'A350-900', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('MG081', 'MG', 16, 'ICN', 'JFK', 'DIRECT', 0, '10:30:00', '10:35:00', 0, 845, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('AQ221', 'AQ', 16, 'ICN', 'JFK', 'DIRECT', 0, '11:00:00', '11:20:00', 0, 860, 'A350-900', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('OA327', 'OA', 16, 'ICN', 'JFK', 'CONNECTING', 1, '22:00:00', '09:40:00', 1, 1540, 'A380-800', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('MG093', 'MG', 17, 'ICN', 'IAD', 'DIRECT', 0, '17:00:00', '16:40:00', 0, 820, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('AT180', 'AT', 17, 'ICN', 'IAD', 'CONNECTING', 1, '17:30:00', '20:50:00', 0, 1040, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('UW882', 'UW', 17, 'ICN', 'IAD', 'CONNECTING', 1, '18:00:00', '23:00:00', 0, 1140, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('MG017', 'MG', 18, 'ICN', 'LAX', 'DIRECT', 0, '17:00:00', '11:10:00', 0, 670, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('AQ202', 'AQ', 18, 'ICN', 'LAX', 'DIRECT', 0, '19:30:00', '13:50:00', 0, 680, 'A350-900', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('RI460', 'RI', 18, 'ICN', 'LAX', 'CONNECTING', 1, '20:00:00', '18:40:00', 0, 940, 'A350-900', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('PC411', 'PC', 19, 'ICN', 'HKG', 'DIRECT', 0, '08:30:00', '11:20:00', 0, 230, 'A330-300', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('MG603', 'MG', 19, 'ICN', 'HKG', 'DIRECT', 0, '14:00:00', '16:45:00', 0, 225, 'A330-300', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('HX612', 'HX', 19, 'ICN', 'HKG', 'DIRECT', 0, '06:20:00', '09:15:00', 0, 235, 'A321neo', 15, FALSE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('MG893', 'MG', 20, 'ICN', 'PVG', 'DIRECT', 0, '10:30:00', '11:25:00', 0, 115, 'A321neo', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('AZ552', 'AZ', 20, 'ICN', 'PVG', 'DIRECT', 0, '15:10:00', '16:10:00', 0, 120, 'A321neo', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('SB8532', 'SB', 20, 'ICN', 'PVG', 'DIRECT', 0, '07:00:00', '08:05:00', 0, 125, 'B737-800', 15, FALSE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('OA323', 'OA', 21, 'ICN', 'DXB', 'DIRECT', 0, '22:30:00', '03:50:00', 1, 620, 'A380-800', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('MG951', 'MG', 21, 'ICN', 'DXB', 'DIRECT', 0, '21:50:00', '03:00:00', 1, 610, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('GF857', 'GF', 21, 'ICN', 'DXB', 'CONNECTING', 1, '09:20:00', '18:00:00', 0, 820, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('MG037', 'MG', 22, 'ICN', 'ORD', 'DIRECT', 0, '17:10:00', '14:40:00', 0, 750, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('UW876', 'UW', 22, 'ICN', 'ORD', 'DIRECT', 0, '17:30:00', '15:10:00', 0, 760, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('AT182', 'AT', 22, 'ICN', 'ORD', 'CONNECTING', 1, '17:20:00', '19:30:00', 0, 1030, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('MG121', 'MG', 23, 'ICN', 'SYD', 'DIRECT', 0, '19:30:00', '07:50:00', 1, 620, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('SX402', 'SX', 23, 'ICN', 'SYD', 'DIRECT', 0, '21:15:00', '09:30:00', 1, 615, 'A350-900', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('LC603', 'LC', 23, 'ICN', 'SYD', 'CONNECTING', 1, '09:40:00', '01:50:00', 1, 850, 'A350-900', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('MG071', 'MG', 24, 'ICN', 'YVR', 'DIRECT', 0, '18:00:00', '10:15:00', 0, 555, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('ML064', 'ML', 24, 'ICN', 'YVR', 'DIRECT', 0, '17:00:00', '09:25:00', 0, 565, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('AT184', 'AT', 24, 'ICN', 'YVR', 'CONNECTING', 1, '18:30:00', '16:00:00', 0, 870, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('OA261', 'OA', 25, 'ICN', 'GRU', 'CONNECTING', 1, '22:00:00', '15:20:00', 1, 1760, 'A380-800', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('GF873', 'GF', 25, 'ICN', 'GRU', 'CONNECTING', 1, '23:10:00', '18:20:00', 1, 1870, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('RH721', 'RH', 25, 'ICN', 'GRU', 'CONNECTING', 1, '13:10:00', '05:00:00', 1, 1670, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('BP695', 'BP', 26, 'ICN', 'CAI', 'CONNECTING', 1, '21:30:00', '07:15:00', 1, 1005, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('OA927', 'OA', 26, 'ICN', 'CAI', 'CONNECTING', 1, '22:30:00', '07:20:00', 1, 950, 'A380-800', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('GF1301', 'GF', 26, 'ICN', 'CAI', 'CONNECTING', 1, '09:20:00', '20:00:00', 0, 1060, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('OA773', 'OA', 27, 'ICN', 'CPT', 'CONNECTING', 1, '22:00:00', '15:20:00', 1, 1460, 'A380-800', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('GF1367', 'GF', 27, 'ICN', 'CPT', 'CONNECTING', 1, '23:10:00', '18:40:00', 1, 1590, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('BN671', 'BN', 27, 'ICN', 'CPT', 'CONNECTING', 1, '22:50:00', '20:00:00', 1, 1690, 'A350-900', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('BD164', 'BD', 9, 'PUS', 'NRT', 'DIRECT', 0, '09:00:00', '11:15:00', 0, 135, 'B737-800', 15, FALSE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('AQ1103', 'AQ', 10, 'GMP', 'KIX', 'DIRECT', 0, '09:40:00', '11:30:00', 0, 110, 'A321neo', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('AQ1131', 'AQ', 11, 'GMP', 'FUK', 'DIRECT', 0, '11:00:00', '12:30:00', 0, 90, 'A321neo', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('AQ1089', 'AQ', 12, 'GMP', 'CTS', 'DIRECT', 0, '10:30:00', '13:20:00', 0, 170, 'A321neo', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('BD782', 'BD', 12, 'PUS', 'CTS', 'DIRECT', 0, '08:40:00', '11:25:00', 0, 165, 'B737-800', 15, FALSE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('MG931', 'MG', 28, 'ICN', 'MXP', 'DIRECT', 0, '11:30:00', '17:35:00', 0, 845, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('RH717', 'RH', 28, 'ICN', 'MXP', 'CONNECTING', 1, '13:10:00', '21:50:00', 0, 1000, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('BP097', 'BP', 28, 'ICN', 'MXP', 'CONNECTING', 1, '21:30:00', '07:00:00', 1, 1050, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('TL856', 'TL', 29, 'ICN', 'AMS', 'DIRECT', 0, '12:40:00', '18:10:00', 0, 810, 'A350-900', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('MG925', 'MG', 29, 'ICN', 'AMS', 'DIRECT', 0, '10:20:00', '16:00:00', 0, 820, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('LP044', 'LP', 29, 'ICN', 'AMS', 'CONNECTING', 1, '09:50:00', '16:40:00', 0, 890, 'A350-900', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('BP089', 'BP', 30, 'ICN', 'IST', 'DIRECT', 0, '22:00:00', '04:10:00', 1, 730, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('MG957', 'MG', 30, 'ICN', 'IST', 'DIRECT', 0, '12:00:00', '18:20:00', 0, 740, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('GF863', 'GF', 30, 'ICN', 'IST', 'CONNECTING', 1, '22:40:00', '09:10:00', 1, 990, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('MG935', 'MG', 31, 'ICN', 'PRG', 'DIRECT', 0, '10:50:00', '15:40:00', 0, 770, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('RH722', 'RH', 31, 'ICN', 'PRG', 'CONNECTING', 1, '13:10:00', '20:50:00', 0, 940, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('BP099', 'BP', 31, 'ICN', 'PRG', 'CONNECTING', 1, '21:30:00', '06:45:00', 1, 1035, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('AP072', 'AP', 32, 'ICN', 'VIE', 'DIRECT', 0, '11:50:00', '17:10:00', 0, 800, 'A350-900', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('RH724', 'RH', 32, 'ICN', 'VIE', 'CONNECTING', 1, '13:10:00', '21:20:00', 0, 970, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('LP046', 'LP', 32, 'ICN', 'VIE', 'CONNECTING', 1, '09:50:00', '17:10:00', 0, 920, 'A350-900', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('BP103', 'BP', 33, 'ICN', 'LIS', 'CONNECTING', 1, '21:30:00', '07:40:00', 1, 1150, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('GL271', 'GL', 33, 'ICN', 'LIS', 'CONNECTING', 1, '11:00:00', '20:30:00', 0, 1110, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('RH726', 'RH', 33, 'ICN', 'LIS', 'CONNECTING', 1, '13:10:00', '22:50:00', 0, 1120, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('TH024', 'TH', 34, 'ICN', 'EDI', 'CONNECTING', 1, '10:40:00', '19:10:00', 0, 1050, 'A350-900', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('GL273', 'GL', 34, 'ICN', 'EDI', 'CONNECTING', 1, '11:00:00', '20:40:00', 0, 1120, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('TL858', 'TL', 34, 'ICN', 'EDI', 'CONNECTING', 1, '12:40:00', '20:50:00', 0, 1030, 'A350-900', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('LC601', 'LC', 35, 'ICN', 'SIN', 'DIRECT', 0, '09:15:00', '15:00:00', 0, 405, 'A350-900', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('MG645', 'MG', 35, 'ICN', 'SIN', 'DIRECT', 0, '22:30:00', '04:10:00', 1, 400, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('LT899', 'LT', 35, 'ICN', 'SIN', 'DIRECT', 0, '23:30:00', '05:20:00', 1, 410, 'A321neo', 15, FALSE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('PL855', 'PL', 36, 'ICN', 'MFM', 'DIRECT', 0, '08:40:00', '11:25:00', 0, 225, 'A330-300', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('HR2501', 'HR', 36, 'ICN', 'MFM', 'DIRECT', 0, '09:30:00', '12:20:00', 0, 230, 'A321neo', 15, FALSE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('PC419', 'PC', 36, 'ICN', 'MFM', 'CONNECTING', 1, '10:20:00', '16:20:00', 0, 420, 'A350-900', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('MG693', 'MG', 37, 'ICN', 'TPE', 'DIRECT', 0, '09:20:00', '11:05:00', 0, 165, 'A321neo', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('FM161', 'FM', 37, 'ICN', 'TPE', 'DIRECT', 0, '11:40:00', '13:25:00', 0, 165, 'A321neo', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('HR2203', 'HR', 37, 'ICN', 'TPE', 'DIRECT', 0, '07:10:00', '09:00:00', 0, 170, 'B737-800', 15, FALSE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('RR415', 'RR', 38, 'ICN', 'DAD', 'DIRECT', 0, '20:20:00', '23:30:00', 0, 310, 'A330-300', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('MJ963', 'MJ', 38, 'ICN', 'DAD', 'DIRECT', 0, '23:00:00', '02:20:00', 1, 320, 'A321neo', 15, FALSE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('HR2603', 'HR', 38, 'ICN', 'DAD', 'DIRECT', 0, '21:30:00', '00:45:00', 1, 315, 'A321neo', 15, FALSE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('RR427', 'RR', 39, 'ICN', 'CXR', 'DIRECT', 0, '22:00:00', '01:40:00', 1, 340, 'A330-300', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('MJ977', 'MJ', 39, 'ICN', 'CXR', 'DIRECT', 0, '23:50:00', '03:35:00', 1, 345, 'A321neo', 15, FALSE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('HR2605', 'HR', 39, 'ICN', 'CXR', 'DIRECT', 0, '22:20:00', '02:10:00', 1, 350, 'A321neo', 15, FALSE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('MJ987', 'MJ', 40, 'ICN', 'PQC', 'DIRECT', 0, '22:30:00', '02:20:00', 1, 350, 'A321neo', 15, FALSE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('HR2701', 'HR', 40, 'ICN', 'PQC', 'DIRECT', 0, '23:10:00', '03:05:00', 1, 355, 'A321neo', 15, FALSE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('RR419', 'RR', 40, 'ICN', 'PQC', 'CONNECTING', 1, '20:20:00', '03:30:00', 1, 550, 'A350-900', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('NS871', 'NS', 41, 'ICN', 'DPS', 'DIRECT', 0, '20:50:00', '03:00:00', 1, 430, 'A350-900', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('MG629', 'MG', 41, 'ICN', 'DPS', 'DIRECT', 0, '20:30:00', '02:30:00', 1, 420, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('HR2901', 'HR', 41, 'ICN', 'DPS', 'DIRECT', 0, '22:00:00', '04:15:00', 1, 435, 'A321neo', 15, FALSE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('MG469', 'MG', 42, 'ICN', 'HAN', 'DIRECT', 0, '09:30:00', '12:15:00', 0, 285, 'A330-300', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('RR407', 'RR', 42, 'ICN', 'HAN', 'DIRECT', 0, '10:30:00', '13:20:00', 0, 290, 'A330-300', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('MJ961', 'MJ', 42, 'ICN', 'HAN', 'DIRECT', 0, '07:30:00', '10:30:00', 0, 300, 'A321neo', 15, FALSE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('MG683', 'MG', 43, 'ICN', 'SGN', 'DIRECT', 0, '18:00:00', '21:35:00', 0, 335, 'A330-300', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('RR413', 'RR', 43, 'ICN', 'SGN', 'DIRECT', 0, '09:10:00', '12:40:00', 0, 330, 'A330-300', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('MJ959', 'MJ', 43, 'ICN', 'SGN', 'DIRECT', 0, '23:30:00', '03:10:00', 1, 340, 'A321neo', 15, FALSE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('MA067', 'MA', 44, 'ICN', 'KUL', 'DIRECT', 0, '20:10:00', '01:45:00', 1, 395, 'A350-900', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('MG671', 'MG', 44, 'ICN', 'KUL', 'DIRECT', 0, '21:40:00', '03:20:00', 1, 400, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('BO505', 'BO', 44, 'ICN', 'KUL', 'DIRECT', 0, '22:30:00', '04:15:00', 1, 405, 'A321neo', 15, FALSE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('MG023', 'MG', 45, 'ICN', 'SFO', 'DIRECT', 0, '17:30:00', '10:55:00', 0, 625, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('AQ212', 'AQ', 45, 'ICN', 'SFO', 'DIRECT', 0, '18:30:00', '12:00:00', 0, 630, 'A350-900', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('UW893', 'UW', 45, 'ICN', 'SFO', 'DIRECT', 0, '17:40:00', '11:00:00', 0, 620, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('MG073', 'MG', 46, 'ICN', 'YYZ', 'DIRECT', 0, '10:00:00', '09:05:00', 0, 785, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('ML062', 'ML', 46, 'ICN', 'YYZ', 'DIRECT', 0, '17:00:00', '16:10:00', 0, 790, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('AT186', 'AT', 46, 'ICN', 'YYZ', 'CONNECTING', 1, '18:00:00', '21:30:00', 0, 1050, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('MG053', 'MG', 47, 'ICN', 'HNL', 'DIRECT', 0, '20:30:00', '10:00:00', 0, 510, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('AQ232', 'AQ', 47, 'ICN', 'HNL', 'DIRECT', 0, '20:00:00', '09:35:00', 0, 515, 'A350-900', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('RI462', 'RI', 47, 'ICN', 'HNL', 'DIRECT', 0, '22:00:00', '11:20:00', 0, 500, 'A350-900', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('ZT057', 'ZT', 48, 'ICN', 'MEX', 'DIRECT', 0, '21:00:00', '20:30:00', 0, 870, 'A350-900', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('UW895', 'UW', 48, 'ICN', 'MEX', 'CONNECTING', 1, '17:40:00', '20:30:00', 0, 1070, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('AT188', 'AT', 48, 'ICN', 'MEX', 'CONNECTING', 1, '17:30:00', '21:50:00', 0, 1160, 'B777-300ER', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('LC605', 'LC', 49, 'ICN', 'MEL', 'CONNECTING', 1, '09:40:00', '03:10:00', 1, 930, 'A350-900', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('SX404', 'SX', 49, 'ICN', 'MEL', 'CONNECTING', 1, '21:15:00', '13:45:00', 1, 870, 'A350-900', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('PC413', 'PC', 49, 'ICN', 'MEL', 'CONNECTING', 1, '08:30:00', '03:20:00', 1, 1010, 'A350-900', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('MG111', 'MG', 50, 'ICN', 'GUM', 'DIRECT', 0, '20:40:00', '02:15:00', 1, 275, 'A330-300', 23, TRUE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('HR3101', 'HR', 50, 'ICN', 'GUM', 'DIRECT', 0, '21:30:00', '03:10:00', 1, 280, 'A321neo', 15, FALSE, '1111111', 'ON_SALE');
INSERT INTO flight (flight_no, airline_code, destination_id, origin_airport, arrival_airport, flight_type, stops, departure_time, arrival_time, arrival_day_offset, duration_minutes, aircraft, baggage_kg, meal_included, operating_days, status) VALUES ('BS301', 'BS', 50, 'ICN', 'GUM', 'DIRECT', 0, '22:00:00', '03:40:00', 1, 280, 'A321neo', 15, FALSE, '1111111', 'ON_SALE');

-- [M] 항공편 구간 (직항 1구간, 경유 2구간)
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (1, 1, 'ICN', 'CDG', 860, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (2, 1, 'ICN', 'CDG', 860, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (3, 1, 'ICN', 'FRA', 655, 342);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (3, 2, 'FRA', 'CDG', 63, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (4, 1, 'ICN', 'LHR', 870, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (5, 1, 'ICN', 'LHR', 880, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (6, 1, 'ICN', 'IST', 610, 253);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (6, 2, 'IST', 'LHR', 212, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (7, 1, 'ICN', 'FRA', 655, 233);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (7, 2, 'FRA', 'BER', 62, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (8, 1, 'ICN', 'HEL', 545, 252);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (8, 2, 'HEL', 'BER', 113, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (9, 1, 'ICN', 'IST', 610, 462);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (9, 2, 'IST', 'BER', 153, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (10, 1, 'ICN', 'MAD', 845, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (11, 1, 'ICN', 'DXB', 522, 215);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (11, 2, 'DXB', 'MAD', 443, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (12, 1, 'ICN', 'CDG', 683, 199);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (12, 2, 'CDG', 'MAD', 108, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (13, 1, 'ICN', 'FCO', 880, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (14, 1, 'ICN', 'IST', 610, 299);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (14, 2, 'IST', 'FCO', 131, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (15, 1, 'ICN', 'DOH', 546, 258);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (15, 2, 'DOH', 'FCO', 326, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (16, 1, 'ICN', 'BCN', 830, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (17, 1, 'ICN', 'FRA', 655, 285);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (17, 2, 'FRA', 'BCN', 110, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (18, 1, 'ICN', 'DOH', 546, 228);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (18, 2, 'DOH', 'BCN', 386, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (19, 1, 'HND', 'GMP', 140, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (20, 1, 'LAX', 'ICN', 820, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (21, 1, 'BKK', 'ICN', 335, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (22, 1, 'KIX', 'PUS', 105, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (23, 1, 'FUK', 'PUS', 70, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (24, 1, 'NRT', 'PUS', 145, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (25, 1, 'ICN', 'NRT', 145, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (26, 1, 'ICN', 'NRT', 150, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (27, 1, 'ICN', 'HND', 140, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (28, 1, 'GMP', 'HND', 135, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (29, 1, 'ICN', 'TPE', 137, 133);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (29, 2, 'TPE', 'NRT', 190, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (30, 1, 'ICN', 'KIX', 115, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (31, 1, 'ICN', 'KIX', 110, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (32, 1, 'PUS', 'KIX', 85, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (33, 1, 'ICN', 'FUK', 85, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (34, 1, 'ICN', 'FUK', 80, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (35, 1, 'PUS', 'FUK', 70, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (36, 1, 'ICN', 'CTS', 165, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (37, 1, 'ICN', 'CTS', 160, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (38, 1, 'ICN', 'NRT', 122, 160);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (38, 2, 'NRT', 'CTS', 88, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (39, 1, 'ICN', 'PEK', 125, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (40, 1, 'ICN', 'PEK', 130, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (41, 1, 'ICN', 'PVG', 90, 180);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (41, 2, 'PVG', 'PEK', 110, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (42, 1, 'ICN', 'BKK', 345, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (43, 1, 'ICN', 'BKK', 340, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (44, 1, 'ICN', 'HKG', 181, 235);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (44, 2, 'HKG', 'BKK', 154, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (45, 1, 'ICN', 'JFK', 845, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (46, 1, 'ICN', 'JFK', 860, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (47, 1, 'ICN', 'DXB', 522, 183);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (47, 2, 'DXB', 'JFK', 835, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (48, 1, 'ICN', 'IAD', 820, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (49, 1, 'ICN', 'SEA', 643, 96);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (49, 2, 'SEA', 'IAD', 301, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (50, 1, 'ICN', 'ORD', 800, 241);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (50, 2, 'ORD', 'IAD', 99, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (51, 1, 'ICN', 'LAX', 670, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (52, 1, 'ICN', 'LAX', 680, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (53, 1, 'ICN', 'HNL', 537, 90);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (53, 2, 'HNL', 'LAX', 313, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (54, 1, 'ICN', 'HKG', 230, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (55, 1, 'ICN', 'HKG', 225, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (56, 1, 'ICN', 'HKG', 235, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (57, 1, 'ICN', 'PVG', 115, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (58, 1, 'ICN', 'PVG', 120, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (59, 1, 'ICN', 'PVG', 125, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (60, 1, 'ICN', 'DXB', 620, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (61, 1, 'ICN', 'DXB', 610, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (62, 1, 'ICN', 'DOH', 546, 216);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (62, 2, 'DOH', 'DXB', 58, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (63, 1, 'ICN', 'ORD', 750, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (64, 1, 'ICN', 'ORD', 760, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (65, 1, 'ICN', 'SEA', 643, 155);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (65, 2, 'SEA', 'ORD', 232, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (66, 1, 'ICN', 'SYD', 620, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (67, 1, 'ICN', 'SYD', 615, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (68, 1, 'ICN', 'SIN', 326, 90);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (68, 2, 'SIN', 'SYD', 434, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (69, 1, 'ICN', 'YVR', 555, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (70, 1, 'ICN', 'YVR', 565, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (71, 1, 'ICN', 'SEA', 643, 182);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (71, 2, 'SEA', 'YVR', 45, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (72, 1, 'ICN', 'DXB', 522, 314);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (72, 2, 'DXB', 'GRU', 924, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (73, 1, 'ICN', 'DOH', 546, 426);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (73, 2, 'DOH', 'GRU', 898, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (74, 1, 'ICN', 'FRA', 655, 268);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (74, 2, 'FRA', 'GRU', 747, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (75, 1, 'ICN', 'IST', 610, 273);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (75, 2, 'IST', 'CAI', 122, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (76, 1, 'ICN', 'DXB', 522, 221);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (76, 2, 'DXB', 'CAI', 207, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (77, 1, 'ICN', 'DOH', 546, 333);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (77, 2, 'DOH', 'CAI', 181, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (78, 1, 'ICN', 'DXB', 522, 349);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (78, 2, 'DXB', 'CPT', 589, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (79, 1, 'ICN', 'DOH', 546, 469);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (79, 2, 'DOH', 'CPT', 575, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (80, 1, 'ICN', 'ADD', 703, 574);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (80, 2, 'ADD', 'CPT', 413, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (81, 1, 'PUS', 'NRT', 135, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (82, 1, 'GMP', 'KIX', 110, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (83, 1, 'GMP', 'FUK', 90, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (84, 1, 'GMP', 'CTS', 170, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (85, 1, 'PUS', 'CTS', 165, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (86, 1, 'ICN', 'MXP', 845, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (87, 1, 'ICN', 'FRA', 655, 279);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (87, 2, 'FRA', 'MXP', 66, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (88, 1, 'ICN', 'IST', 610, 287);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (88, 2, 'IST', 'MXP', 153, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (89, 1, 'ICN', 'AMS', 810, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (90, 1, 'ICN', 'AMS', 820, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (91, 1, 'ICN', 'HEL', 545, 204);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (91, 2, 'HEL', 'AMS', 141, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (92, 1, 'ICN', 'IST', 730, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (93, 1, 'ICN', 'IST', 740, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (94, 1, 'ICN', 'DOH', 546, 212);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (94, 2, 'DOH', 'IST', 232, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (95, 1, 'ICN', 'PRG', 770, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (96, 1, 'ICN', 'FRA', 655, 225);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (96, 2, 'FRA', 'PRG', 60, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (97, 1, 'ICN', 'IST', 610, 286);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (97, 2, 'IST', 'PRG', 139, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (98, 1, 'ICN', 'VIE', 800, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (99, 1, 'ICN', 'FRA', 655, 240);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (99, 2, 'FRA', 'VIE', 75, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (100, 1, 'ICN', 'HEL', 545, 238);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (100, 2, 'HEL', 'VIE', 137, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (101, 1, 'ICN', 'IST', 610, 275);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (101, 2, 'IST', 'LIS', 265, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (102, 1, 'ICN', 'CDG', 683, 289);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (102, 2, 'CDG', 'LIS', 138, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (103, 1, 'ICN', 'FRA', 655, 298);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (103, 2, 'FRA', 'LIS', 167, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (104, 1, 'ICN', 'LHR', 678, 303);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (104, 2, 'LHR', 'EDI', 69, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (105, 1, 'ICN', 'CDG', 683, 343);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (105, 2, 'CDG', 'EDI', 94, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (106, 1, 'ICN', 'AMS', 656, 295);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (106, 2, 'AMS', 'EDI', 79, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (107, 1, 'ICN', 'SIN', 405, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (108, 1, 'ICN', 'SIN', 400, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (109, 1, 'ICN', 'SIN', 410, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (110, 1, 'ICN', 'MFM', 225, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (111, 1, 'ICN', 'MFM', 230, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (112, 1, 'ICN', 'HKG', 181, 206);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (112, 2, 'HKG', 'MFM', 33, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (113, 1, 'ICN', 'TPE', 165, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (114, 1, 'ICN', 'TPE', 165, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (115, 1, 'ICN', 'TPE', 170, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (116, 1, 'ICN', 'DAD', 310, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (117, 1, 'ICN', 'DAD', 320, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (118, 1, 'ICN', 'DAD', 315, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (119, 1, 'ICN', 'CXR', 340, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (120, 1, 'ICN', 'CXR', 345, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (121, 1, 'ICN', 'CXR', 350, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (122, 1, 'ICN', 'PQC', 350, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (123, 1, 'ICN', 'PQC', 355, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (124, 1, 'ICN', 'SGN', 291, 207);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (124, 2, 'SGN', 'PQC', 52, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (125, 1, 'ICN', 'DPS', 430, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (126, 1, 'ICN', 'DPS', 420, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (127, 1, 'ICN', 'DPS', 435, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (128, 1, 'ICN', 'HAN', 285, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (129, 1, 'ICN', 'HAN', 290, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (130, 1, 'ICN', 'HAN', 300, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (131, 1, 'ICN', 'SGN', 335, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (132, 1, 'ICN', 'SGN', 330, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (133, 1, 'ICN', 'SGN', 340, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (134, 1, 'ICN', 'KUL', 395, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (135, 1, 'ICN', 'KUL', 400, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (136, 1, 'ICN', 'KUL', 405, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (137, 1, 'ICN', 'SFO', 625, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (138, 1, 'ICN', 'SFO', 630, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (139, 1, 'ICN', 'SFO', 620, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (140, 1, 'ICN', 'YYZ', 785, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (141, 1, 'ICN', 'YYZ', 790, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (142, 1, 'ICN', 'SEA', 643, 135);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (142, 2, 'SEA', 'YYZ', 272, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (143, 1, 'ICN', 'HNL', 510, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (144, 1, 'ICN', 'HNL', 515, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (145, 1, 'ICN', 'HNL', 500, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (146, 1, 'ICN', 'MEX', 870, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (147, 1, 'ICN', 'SFO', 695, 123);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (147, 2, 'SFO', 'MEX', 252, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (148, 1, 'ICN', 'SEA', 643, 212);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (148, 2, 'SEA', 'MEX', 305, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (149, 1, 'ICN', 'SIN', 368, 90);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (149, 2, 'SIN', 'MEL', 472, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (150, 1, 'ICN', 'SYD', 640, 148);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (150, 2, 'SYD', 'MEL', 82, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (151, 1, 'ICN', 'HKG', 181, 257);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (151, 2, 'HKG', 'MEL', 572, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (152, 1, 'ICN', 'GUM', 275, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (153, 1, 'ICN', 'GUM', 280, NULL);
INSERT INTO flight_segment (flight_id, seq, from_airport, to_airport, duration_minutes, layover_minutes) VALUES (154, 1, 'ICN', 'GUM', 280, NULL);

-- [M] 좌석등급별 요금 (표시 가격 = base_price + tax_fuel)
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (1, 'ECONOMY', 770000, 120000, 180, 58, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (1, 'PREMIUM', 1300000, 120000, 30, 6, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (1, 'BUSINESS', 2730000, 120000, 24, 10, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (2, 'ECONOMY', 800000, 120000, 180, 39, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (2, 'PREMIUM', 1350000, 120000, 30, 4, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (2, 'BUSINESS', 2820000, 120000, 24, 13, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (3, 'ECONOMY', 570000, 120000, 180, 135, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (3, 'PREMIUM', 980000, 120000, 30, 21, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (3, 'BUSINESS', 2090000, 120000, 24, 7, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (4, 'ECONOMY', 800000, 120000, 180, 75, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (4, 'PREMIUM', 1350000, 120000, 30, 22, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (4, 'BUSINESS', 2820000, 120000, 24, 18, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (5, 'ECONOMY', 760000, 120000, 180, 55, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (5, 'PREMIUM', 1290000, 120000, 30, 25, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (5, 'BUSINESS', 2700000, 120000, 24, 18, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (6, 'ECONOMY', 520000, 120000, 180, 62, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (6, 'PREMIUM', 900000, 120000, 30, 10, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (6, 'BUSINESS', 1930000, 120000, 24, 6, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (7, 'ECONOMY', 640000, 120000, 180, 111, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (7, 'PREMIUM', 1100000, 120000, 30, 20, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (7, 'BUSINESS', 2310000, 120000, 24, 18, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (8, 'ECONOMY', 600000, 120000, 180, 77, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (8, 'PREMIUM', 1030000, 120000, 30, 23, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (8, 'BUSINESS', 2180000, 120000, 24, 9, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (9, 'ECONOMY', 530000, 150000, 180, 95, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (9, 'PREMIUM', 940000, 150000, 30, 8, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (9, 'BUSINESS', 2030000, 150000, 24, 12, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (10, 'ECONOMY', 810000, 120000, 180, 154, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (10, 'PREMIUM', 1370000, 120000, 30, 22, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (10, 'BUSINESS', 2860000, 120000, 24, 20, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (11, 'ECONOMY', 600000, 120000, 180, 67, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (11, 'PREMIUM', 1030000, 120000, 30, 24, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (11, 'BUSINESS', 2190000, 120000, 24, 13, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (12, 'ECONOMY', 660000, 120000, 180, 69, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (12, 'PREMIUM', 1130000, 120000, 30, 21, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (12, 'BUSINESS', 2380000, 120000, 24, 7, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (13, 'ECONOMY', 860000, 120000, 180, 107, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (13, 'PREMIUM', 1450000, 120000, 30, 14, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (13, 'BUSINESS', 3020000, 120000, 24, 6, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (14, 'ECONOMY', 600000, 120000, 180, 62, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (14, 'PREMIUM', 1030000, 120000, 30, 22, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (14, 'BUSINESS', 2180000, 120000, 24, 5, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (15, 'ECONOMY', 640000, 120000, 180, 111, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (15, 'PREMIUM', 1100000, 120000, 30, 10, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (15, 'BUSINESS', 2310000, 120000, 24, 13, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (16, 'ECONOMY', 820000, 120000, 180, 121, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (16, 'PREMIUM', 1380000, 120000, 30, 7, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (16, 'BUSINESS', 2890000, 120000, 24, 15, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (17, 'ECONOMY', 590000, 120000, 180, 82, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (17, 'PREMIUM', 1020000, 120000, 30, 9, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (17, 'BUSINESS', 2150000, 120000, 24, 14, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (18, 'ECONOMY', 570000, 120000, 180, 51, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (18, 'PREMIUM', 980000, 120000, 30, 14, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (18, 'BUSINESS', 2090000, 120000, 24, 14, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (19, 'ECONOMY', 180000, 30000, 180, 102, TRUE, 50000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (19, 'BUSINESS', 490000, 30000, 24, 19, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (20, 'ECONOMY', 1030000, 120000, 180, 140, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (20, 'PREMIUM', 1720000, 120000, 30, 20, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (20, 'BUSINESS', 3560000, 120000, 24, 8, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (21, 'ECONOMY', 280000, 60000, 180, 110, TRUE, 100000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (21, 'BUSINESS', 930000, 60000, 24, 7, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (22, 'ECONOMY', 130000, 30000, 180, 153, FALSE, 60000, 0.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (23, 'ECONOMY', 100000, 30000, 180, 88, FALSE, 60000, 0.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (24, 'ECONOMY', 160000, 30000, 180, 75, FALSE, 60000, 0.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (25, 'ECONOMY', 120000, 30000, 180, 147, FALSE, 60000, 0.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (26, 'ECONOMY', 220000, 30000, 180, 155, TRUE, 50000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (26, 'BUSINESS', 750000, 30000, 24, 16, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (27, 'ECONOMY', 210000, 30000, 180, 156, TRUE, 50000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (27, 'BUSINESS', 710000, 30000, 24, 3, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (28, 'ECONOMY', 250000, 30000, 180, 66, TRUE, 50000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (28, 'BUSINESS', 800000, 30000, 24, 20, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (29, 'ECONOMY', 130000, 60000, 180, 131, TRUE, 100000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (29, 'BUSINESS', 560000, 60000, 24, 10, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (30, 'ECONOMY', 200000, 30000, 180, 154, TRUE, 50000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (30, 'BUSINESS', 670000, 30000, 24, 14, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (31, 'ECONOMY', 100000, 30000, 180, 37, FALSE, 60000, 0.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (32, 'ECONOMY', 90000, 30000, 180, 52, FALSE, 60000, 0.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (33, 'ECONOMY', 160000, 30000, 180, 66, TRUE, 50000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (33, 'BUSINESS', 530000, 30000, 24, 8, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (34, 'ECONOMY', 90000, 30000, 180, 156, FALSE, 60000, 0.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (35, 'ECONOMY', 80000, 30000, 180, 104, FALSE, 60000, 0.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (36, 'ECONOMY', 330000, 30000, 180, 33, TRUE, 50000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (36, 'BUSINESS', 1020000, 30000, 24, 6, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (37, 'ECONOMY', 180000, 30000, 180, 135, FALSE, 60000, 0.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (38, 'ECONOMY', 220000, 60000, 180, 104, TRUE, 100000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (38, 'BUSINESS', 760000, 60000, 24, 11, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (39, 'ECONOMY', 260000, 30000, 180, 84, TRUE, 50000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (39, 'BUSINESS', 850000, 30000, 24, 7, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (40, 'ECONOMY', 240000, 30000, 180, 35, TRUE, 50000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (40, 'BUSINESS', 790000, 30000, 24, 16, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (41, 'ECONOMY', 140000, 60000, 180, 118, TRUE, 100000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (41, 'BUSINESS', 540000, 60000, 24, 6, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (42, 'ECONOMY', 460000, 60000, 180, 100, TRUE, 100000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (42, 'BUSINESS', 1490000, 60000, 24, 14, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (43, 'ECONOMY', 420000, 60000, 180, 161, TRUE, 100000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (43, 'BUSINESS', 1390000, 60000, 24, 5, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (44, 'ECONOMY', 330000, 60000, 180, 66, TRUE, 100000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (44, 'BUSINESS', 1090000, 60000, 24, 21, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (45, 'ECONOMY', 1030000, 120000, 180, 160, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (45, 'PREMIUM', 1720000, 120000, 30, 15, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (45, 'BUSINESS', 3560000, 120000, 24, 7, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (46, 'ECONOMY', 980000, 120000, 180, 93, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (46, 'PREMIUM', 1640000, 120000, 30, 9, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (46, 'BUSINESS', 3400000, 120000, 24, 11, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (47, 'ECONOMY', 730000, 150000, 180, 147, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (47, 'PREMIUM', 1260000, 150000, 30, 23, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (47, 'BUSINESS', 2670000, 150000, 24, 12, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (48, 'ECONOMY', 1080000, 120000, 180, 31, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (48, 'PREMIUM', 1800000, 120000, 30, 10, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (48, 'BUSINESS', 3720000, 120000, 24, 13, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (49, 'ECONOMY', 860000, 120000, 180, 58, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (49, 'PREMIUM', 1450000, 120000, 30, 24, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (49, 'BUSINESS', 3020000, 120000, 24, 6, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (50, 'ECONOMY', 840000, 120000, 180, 147, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (50, 'PREMIUM', 1420000, 120000, 30, 11, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (50, 'BUSINESS', 2950000, 120000, 24, 5, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (51, 'ECONOMY', 930000, 120000, 180, 81, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (51, 'PREMIUM', 1560000, 120000, 30, 24, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (51, 'BUSINESS', 3240000, 120000, 24, 15, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (52, 'ECONOMY', 880000, 120000, 180, 133, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (52, 'PREMIUM', 1480000, 120000, 30, 21, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (52, 'BUSINESS', 3080000, 120000, 24, 12, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (53, 'ECONOMY', 700000, 120000, 180, 39, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (53, 'PREMIUM', 1190000, 120000, 30, 9, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (53, 'BUSINESS', 2500000, 120000, 24, 19, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (54, 'ECONOMY', 390000, 30000, 180, 148, TRUE, 50000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (54, 'BUSINESS', 1230000, 30000, 24, 20, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (55, 'ECONOMY', 410000, 30000, 180, 72, TRUE, 50000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (55, 'BUSINESS', 1290000, 30000, 24, 15, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (56, 'ECONOMY', 260000, 30000, 180, 134, FALSE, 60000, 0.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (57, 'ECONOMY', 250000, 30000, 180, 113, TRUE, 50000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (57, 'BUSINESS', 810000, 30000, 24, 18, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (58, 'ECONOMY', 210000, 30000, 180, 56, TRUE, 50000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (58, 'BUSINESS', 690000, 30000, 24, 18, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (59, 'ECONOMY', 140000, 30000, 180, 63, FALSE, 60000, 0.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (60, 'ECONOMY', 800000, 120000, 180, 79, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (60, 'PREMIUM', 1350000, 120000, 30, 15, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (60, 'BUSINESS', 3560000, 120000, 24, 19, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (60, 'FIRST', 6780000, 120000, 8, 2, TRUE, 0, 2.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (61, 'ECONOMY', 820000, 120000, 180, 117, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (61, 'PREMIUM', 1380000, 120000, 30, 5, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (61, 'BUSINESS', 2880000, 120000, 24, 19, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (62, 'ECONOMY', 640000, 120000, 180, 130, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (62, 'PREMIUM', 1100000, 120000, 30, 10, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (62, 'BUSINESS', 2310000, 120000, 24, 19, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (63, 'ECONOMY', 980000, 120000, 180, 49, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (63, 'PREMIUM', 1640000, 120000, 30, 18, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (63, 'BUSINESS', 3400000, 120000, 24, 13, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (64, 'ECONOMY', 940000, 120000, 180, 81, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (64, 'PREMIUM', 1580000, 120000, 30, 13, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (64, 'BUSINESS', 3270000, 120000, 24, 17, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (65, 'ECONOMY', 770000, 120000, 180, 151, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (65, 'PREMIUM', 1300000, 120000, 30, 4, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (65, 'BUSINESS', 2730000, 120000, 24, 19, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (66, 'ECONOMY', 860000, 120000, 180, 80, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (66, 'PREMIUM', 1450000, 120000, 30, 21, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (66, 'BUSINESS', 3020000, 120000, 24, 10, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (67, 'ECONOMY', 820000, 120000, 180, 101, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (67, 'PREMIUM', 1380000, 120000, 30, 24, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (67, 'BUSINESS', 2890000, 120000, 24, 7, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (68, 'ECONOMY', 640000, 120000, 180, 109, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (68, 'PREMIUM', 1100000, 120000, 30, 22, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (68, 'BUSINESS', 2310000, 120000, 24, 13, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (69, 'ECONOMY', 990000, 60000, 180, 90, TRUE, 100000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (69, 'PREMIUM', 1620000, 60000, 30, 16, TRUE, 50000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (69, 'BUSINESS', 3300000, 60000, 24, 4, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (70, 'ECONOMY', 940000, 60000, 180, 120, TRUE, 100000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (70, 'PREMIUM', 1540000, 60000, 30, 7, TRUE, 50000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (70, 'BUSINESS', 3140000, 60000, 24, 13, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (71, 'ECONOMY', 710000, 120000, 180, 109, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (71, 'PREMIUM', 1210000, 120000, 30, 7, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (71, 'BUSINESS', 2540000, 120000, 24, 10, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (72, 'ECONOMY', 1600000, 150000, 180, 145, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (72, 'PREMIUM', 2650000, 150000, 30, 24, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (72, 'BUSINESS', 5450000, 150000, 24, 8, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (72, 'FIRST', 9650000, 150000, 8, 3, TRUE, 0, 2.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (73, 'ECONOMY', 1470000, 150000, 180, 38, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (73, 'PREMIUM', 2440000, 150000, 30, 16, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (73, 'BUSINESS', 5030000, 150000, 24, 10, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (74, 'ECONOMY', 1430000, 150000, 180, 158, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (74, 'PREMIUM', 2380000, 150000, 30, 13, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (74, 'BUSINESS', 4910000, 150000, 24, 17, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (75, 'ECONOMY', 800000, 120000, 180, 157, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (75, 'PREMIUM', 1350000, 120000, 30, 6, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (75, 'BUSINESS', 2820000, 120000, 24, 5, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (76, 'ECONOMY', 840000, 120000, 180, 134, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (76, 'PREMIUM', 1420000, 120000, 30, 12, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (76, 'BUSINESS', 2950000, 120000, 24, 21, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (77, 'ECONOMY', 770000, 120000, 180, 142, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (77, 'PREMIUM', 1300000, 120000, 30, 21, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (77, 'BUSINESS', 2730000, 120000, 24, 4, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (78, 'ECONOMY', 1330000, 150000, 180, 153, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (78, 'PREMIUM', 2220000, 150000, 30, 18, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (78, 'BUSINESS', 4590000, 150000, 24, 20, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (79, 'ECONOMY', 1230000, 150000, 180, 84, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (79, 'PREMIUM', 2060000, 150000, 30, 22, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (79, 'BUSINESS', 4270000, 150000, 24, 6, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (80, 'ECONOMY', 1100000, 150000, 180, 48, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (80, 'BUSINESS', 2850000, 150000, 24, 16, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (81, 'ECONOMY', 140000, 30000, 180, 93, FALSE, 60000, 0.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (82, 'ECONOMY', 190000, 30000, 180, 61, TRUE, 50000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (82, 'BUSINESS', 650000, 30000, 24, 21, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (83, 'ECONOMY', 170000, 30000, 180, 122, TRUE, 50000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (83, 'BUSINESS', 560000, 30000, 24, 3, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (84, 'ECONOMY', 340000, 30000, 180, 43, TRUE, 50000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (84, 'BUSINESS', 1050000, 30000, 24, 5, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (85, 'ECONOMY', 220000, 30000, 180, 123, FALSE, 60000, 0.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (86, 'ECONOMY', 840000, 120000, 180, 98, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (86, 'PREMIUM', 1420000, 120000, 30, 16, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (86, 'BUSINESS', 2950000, 120000, 24, 11, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (87, 'ECONOMY', 600000, 120000, 180, 75, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (87, 'PREMIUM', 1030000, 120000, 30, 21, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (87, 'BUSINESS', 2180000, 120000, 24, 21, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (88, 'ECONOMY', 540000, 120000, 180, 27, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (88, 'PREMIUM', 940000, 120000, 30, 5, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (88, 'BUSINESS', 1990000, 120000, 24, 19, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (89, 'ECONOMY', 820000, 120000, 180, 150, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (89, 'PREMIUM', 1380000, 120000, 30, 15, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (89, 'BUSINESS', 2890000, 120000, 24, 20, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (90, 'ECONOMY', 810000, 120000, 180, 153, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (90, 'PREMIUM', 1370000, 120000, 30, 15, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (90, 'BUSINESS', 2860000, 120000, 24, 11, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (91, 'ECONOMY', 580000, 120000, 180, 86, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (91, 'PREMIUM', 1000000, 120000, 30, 7, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (91, 'BUSINESS', 2120000, 120000, 24, 17, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (92, 'ECONOMY', 700000, 120000, 180, 160, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (92, 'PREMIUM', 1190000, 120000, 30, 12, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (92, 'BUSINESS', 2500000, 120000, 24, 11, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (93, 'ECONOMY', 720000, 120000, 180, 46, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (93, 'PREMIUM', 1220000, 120000, 30, 22, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (93, 'BUSINESS', 2570000, 120000, 24, 6, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (94, 'ECONOMY', 520000, 120000, 180, 153, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (94, 'PREMIUM', 900000, 120000, 30, 8, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (94, 'BUSINESS', 1930000, 120000, 24, 17, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (95, 'ECONOMY', 780000, 120000, 180, 110, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (95, 'PREMIUM', 1320000, 120000, 30, 6, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (95, 'BUSINESS', 2760000, 120000, 24, 10, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (96, 'ECONOMY', 600000, 120000, 180, 51, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (96, 'PREMIUM', 1030000, 120000, 30, 19, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (96, 'BUSINESS', 2180000, 120000, 24, 9, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (97, 'ECONOMY', 530000, 120000, 180, 146, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (97, 'PREMIUM', 920000, 120000, 30, 18, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (97, 'BUSINESS', 1960000, 120000, 24, 13, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (98, 'ECONOMY', 790000, 120000, 180, 139, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (98, 'PREMIUM', 1340000, 120000, 30, 22, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (98, 'BUSINESS', 2790000, 120000, 24, 18, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (99, 'ECONOMY', 610000, 120000, 180, 48, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (99, 'PREMIUM', 1050000, 120000, 30, 17, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (99, 'BUSINESS', 2220000, 120000, 24, 12, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (100, 'ECONOMY', 570000, 120000, 180, 160, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (100, 'PREMIUM', 980000, 120000, 30, 6, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (100, 'BUSINESS', 2090000, 120000, 24, 20, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (101, 'ECONOMY', 570000, 120000, 180, 50, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (101, 'PREMIUM', 980000, 120000, 30, 15, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (101, 'BUSINESS', 2090000, 120000, 24, 19, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (102, 'ECONOMY', 640000, 120000, 180, 110, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (102, 'PREMIUM', 1100000, 120000, 30, 23, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (102, 'BUSINESS', 2310000, 120000, 24, 9, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (103, 'ECONOMY', 620000, 120000, 180, 119, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (103, 'PREMIUM', 1060000, 120000, 30, 24, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (103, 'BUSINESS', 2250000, 120000, 24, 7, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (104, 'ECONOMY', 780000, 120000, 180, 121, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (104, 'PREMIUM', 1320000, 120000, 30, 11, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (104, 'BUSINESS', 2760000, 120000, 24, 7, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (105, 'ECONOMY', 680000, 120000, 180, 99, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (105, 'PREMIUM', 1160000, 120000, 30, 16, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (105, 'BUSINESS', 2440000, 120000, 24, 11, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (106, 'ECONOMY', 670000, 120000, 180, 81, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (106, 'PREMIUM', 1140000, 120000, 30, 13, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (106, 'BUSINESS', 2410000, 120000, 24, 18, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (107, 'ECONOMY', 540000, 60000, 180, 86, TRUE, 100000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (107, 'PREMIUM', 900000, 60000, 30, 17, TRUE, 50000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (107, 'BUSINESS', 1860000, 60000, 24, 8, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (108, 'ECONOMY', 520000, 60000, 180, 99, TRUE, 100000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (108, 'PREMIUM', 870000, 60000, 30, 20, TRUE, 50000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (108, 'BUSINESS', 1800000, 60000, 24, 14, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (109, 'ECONOMY', 270000, 60000, 180, 81, FALSE, 60000, 0.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (110, 'ECONOMY', 300000, 30000, 180, 111, TRUE, 50000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (110, 'BUSINESS', 890000, 30000, 24, 6, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (111, 'ECONOMY', 180000, 30000, 180, 88, FALSE, 60000, 0.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (112, 'ECONOMY', 300000, 60000, 180, 151, TRUE, 100000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (112, 'PREMIUM', 520000, 60000, 30, 18, TRUE, 50000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (112, 'BUSINESS', 1090000, 60000, 24, 9, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (113, 'ECONOMY', 330000, 30000, 180, 129, TRUE, 50000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (113, 'BUSINESS', 980000, 30000, 24, 12, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (114, 'ECONOMY', 310000, 30000, 180, 152, TRUE, 50000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (114, 'BUSINESS', 920000, 30000, 24, 19, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (115, 'ECONOMY', 160000, 30000, 180, 35, FALSE, 60000, 0.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (116, 'ECONOMY', 360000, 60000, 180, 59, TRUE, 100000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (116, 'BUSINESS', 1120000, 60000, 24, 8, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (117, 'ECONOMY', 200000, 60000, 180, 49, FALSE, 60000, 0.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (118, 'ECONOMY', 220000, 60000, 180, 105, FALSE, 60000, 0.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (119, 'ECONOMY', 370000, 60000, 180, 100, TRUE, 100000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (119, 'BUSINESS', 1140000, 60000, 24, 20, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (120, 'ECONOMY', 210000, 60000, 180, 29, FALSE, 60000, 0.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (121, 'ECONOMY', 230000, 60000, 180, 48, FALSE, 60000, 0.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (122, 'ECONOMY', 240000, 60000, 180, 54, FALSE, 60000, 0.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (123, 'ECONOMY', 260000, 60000, 180, 38, FALSE, 60000, 0.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (124, 'ECONOMY', 320000, 60000, 180, 35, TRUE, 100000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (124, 'PREMIUM', 550000, 60000, 30, 26, TRUE, 50000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (124, 'BUSINESS', 1160000, 60000, 24, 8, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (125, 'ECONOMY', 580000, 60000, 180, 112, TRUE, 100000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (125, 'PREMIUM', 960000, 60000, 30, 8, TRUE, 50000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (125, 'BUSINESS', 1990000, 60000, 24, 6, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (126, 'ECONOMY', 600000, 60000, 180, 155, TRUE, 100000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (126, 'PREMIUM', 1000000, 60000, 30, 24, TRUE, 50000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (126, 'BUSINESS', 2050000, 60000, 24, 16, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (127, 'ECONOMY', 360000, 60000, 180, 76, FALSE, 60000, 0.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (128, 'ECONOMY', 390000, 60000, 180, 124, TRUE, 100000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (128, 'BUSINESS', 1200000, 60000, 24, 13, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (129, 'ECONOMY', 360000, 60000, 180, 82, TRUE, 100000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (129, 'BUSINESS', 1120000, 60000, 24, 7, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (130, 'ECONOMY', 200000, 60000, 180, 92, FALSE, 60000, 0.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (131, 'ECONOMY', 410000, 60000, 180, 77, TRUE, 100000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (131, 'BUSINESS', 1260000, 60000, 24, 6, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (132, 'ECONOMY', 380000, 60000, 180, 61, TRUE, 100000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (132, 'BUSINESS', 1170000, 60000, 24, 10, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (133, 'ECONOMY', 220000, 60000, 180, 67, FALSE, 60000, 0.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (134, 'ECONOMY', 480000, 60000, 180, 71, TRUE, 100000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (134, 'PREMIUM', 800000, 60000, 30, 13, TRUE, 50000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (134, 'BUSINESS', 1670000, 60000, 24, 11, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (135, 'ECONOMY', 500000, 60000, 180, 64, TRUE, 100000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (135, 'PREMIUM', 840000, 60000, 30, 19, TRUE, 50000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (135, 'BUSINESS', 1730000, 60000, 24, 9, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (136, 'ECONOMY', 270000, 60000, 180, 47, FALSE, 60000, 0.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (137, 'ECONOMY', 930000, 120000, 180, 42, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (137, 'PREMIUM', 1560000, 120000, 30, 18, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (137, 'BUSINESS', 3240000, 120000, 24, 3, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (138, 'ECONOMY', 880000, 120000, 180, 101, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (138, 'PREMIUM', 1480000, 120000, 30, 15, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (138, 'BUSINESS', 3080000, 120000, 24, 16, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (139, 'ECONOMY', 870000, 120000, 180, 146, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (139, 'PREMIUM', 1460000, 120000, 30, 14, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (139, 'BUSINESS', 3050000, 120000, 24, 16, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (140, 'ECONOMY', 1030000, 120000, 180, 151, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (140, 'PREMIUM', 1720000, 120000, 30, 25, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (140, 'BUSINESS', 3560000, 120000, 24, 10, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (141, 'ECONOMY', 980000, 120000, 180, 50, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (141, 'PREMIUM', 1640000, 120000, 30, 16, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (141, 'BUSINESS', 3400000, 120000, 24, 6, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (142, 'ECONOMY', 780000, 120000, 180, 110, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (142, 'PREMIUM', 1320000, 120000, 30, 25, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (142, 'BUSINESS', 2760000, 120000, 24, 9, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (143, 'ECONOMY', 740000, 60000, 180, 139, TRUE, 100000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (143, 'PREMIUM', 1220000, 60000, 30, 13, TRUE, 50000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (143, 'BUSINESS', 2500000, 60000, 24, 16, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (144, 'ECONOMY', 720000, 60000, 180, 112, TRUE, 100000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (144, 'PREMIUM', 1190000, 60000, 30, 10, TRUE, 50000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (144, 'BUSINESS', 2440000, 60000, 24, 19, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (145, 'ECONOMY', 710000, 60000, 180, 106, TRUE, 100000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (145, 'PREMIUM', 1170000, 60000, 30, 22, TRUE, 50000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (145, 'BUSINESS', 2400000, 60000, 24, 12, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (146, 'ECONOMY', 1180000, 120000, 180, 72, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (146, 'PREMIUM', 1960000, 120000, 30, 23, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (146, 'BUSINESS', 4040000, 120000, 24, 19, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (147, 'ECONOMY', 1030000, 120000, 180, 69, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (147, 'PREMIUM', 1720000, 120000, 30, 6, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (147, 'BUSINESS', 3560000, 120000, 24, 21, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (148, 'ECONOMY', 980000, 120000, 180, 108, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (148, 'PREMIUM', 1640000, 120000, 30, 16, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (148, 'BUSINESS', 3400000, 120000, 24, 21, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (149, 'ECONOMY', 700000, 120000, 180, 152, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (149, 'PREMIUM', 1190000, 120000, 30, 8, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (149, 'BUSINESS', 2500000, 120000, 24, 4, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (150, 'ECONOMY', 780000, 120000, 180, 100, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (150, 'PREMIUM', 1320000, 120000, 30, 17, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (150, 'BUSINESS', 2760000, 120000, 24, 8, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (151, 'ECONOMY', 670000, 120000, 180, 118, TRUE, 150000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (151, 'PREMIUM', 1140000, 120000, 30, 12, TRUE, 75000, 1.25);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (151, 'BUSINESS', 2410000, 120000, 24, 14, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (152, 'ECONOMY', 420000, 60000, 180, 121, TRUE, 100000, 1.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (152, 'BUSINESS', 1280000, 60000, 24, 5, TRUE, 0, 1.50);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (153, 'ECONOMY', 270000, 60000, 180, 138, FALSE, 60000, 0.00);
INSERT INTO flight_fare (flight_id, cabin_class, base_price, tax_fuel, seats_total, seats_left, refundable, change_fee, mileage_rate) VALUES (154, 'ECONOMY', 260000, 60000, 180, 140, FALSE, 60000, 0.00);

-- [M] 판매 집계 (베스트셀러 3개 여행지 도쿄 5편·로스앤젤레스 3편·홍콩 3편만 여행지 내 순위 부여)
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (1, 42, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (2, 77, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (3, 140, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (4, 70, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (5, 209, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (6, 77, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (7, 228, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (8, 102, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (9, 25, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (10, 218, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (11, 228, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (12, 111, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (13, 81, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (14, 121, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (15, 123, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (16, 20, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (17, 73, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (18, 165, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (19, 28, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (20, 152, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (21, 87, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (22, 77, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (23, 13, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (24, 24, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (25, 1284, 1);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (26, 1102, 2);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (27, 986, 3);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (28, 541, 4);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (29, 327, 5);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (30, 212, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (31, 161, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (32, 116, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (33, 156, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (34, 87, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (35, 96, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (36, 203, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (37, 77, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (38, 56, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (39, 18, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (40, 155, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (41, 13, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (42, 85, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (43, 138, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (44, 169, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (45, 108, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (46, 168, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (47, 11, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (48, 200, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (49, 16, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (50, 148, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (51, 1050, 1);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (52, 880, 2);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (53, 520, 3);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (54, 760, 2);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (55, 520, 3);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (56, 980, 1);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (57, 138, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (58, 208, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (59, 239, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (60, 163, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (61, 35, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (62, 225, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (63, 194, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (64, 57, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (65, 32, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (66, 59, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (67, 174, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (68, 203, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (69, 11, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (70, 68, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (71, 199, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (72, 22, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (73, 204, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (74, 222, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (75, 161, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (76, 109, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (77, 228, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (78, 125, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (79, 226, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (80, 86, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (81, 89, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (82, 4, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (83, 82, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (84, 204, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (85, 126, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (86, 78, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (87, 163, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (88, 142, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (89, 81, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (90, 161, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (91, 95, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (92, 158, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (93, 233, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (94, 175, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (95, 234, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (96, 79, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (97, 196, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (98, 28, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (99, 149, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (100, 32, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (101, 59, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (102, 240, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (103, 128, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (104, 86, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (105, 208, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (106, 75, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (107, 232, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (108, 96, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (109, 102, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (110, 20, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (111, 164, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (112, 26, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (113, 166, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (114, 202, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (115, 239, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (116, 15, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (117, 205, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (118, 161, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (119, 70, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (120, 65, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (121, 27, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (122, 84, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (123, 72, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (124, 230, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (125, 109, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (126, 146, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (127, 3, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (128, 131, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (129, 79, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (130, 20, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (131, 230, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (132, 177, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (133, 105, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (134, 10, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (135, 205, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (136, 43, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (137, 62, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (138, 50, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (139, 225, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (140, 219, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (141, 124, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (142, 168, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (143, 213, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (144, 172, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (145, 216, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (146, 231, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (147, 12, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (148, 93, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (149, 135, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (150, 54, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (151, 38, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (152, 230, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (153, 133, NULL);
INSERT INTO flight_sales_stat (flight_id, sales_count, rank_no) VALUES (154, 21, NULL);

-- [M] 이달의 특별기획 3곳: 로마, 삿포로, 케이프타운 (2026-11-01 ~ 2026-12-31)
INSERT INTO monthly_plan (plan_month, destination_id, title, subtitle, badge_text, highlights, start_at, end_at, is_active) VALUES ('2026-11', 5, '로마의 휴일, 지금 떠나요', '인천→로마 항공권 최대 33% 겨울 특가', '최대 33% OFF', '콜로세움·바티칸을 하루에
젤라토와 파스타의 본고장
유럽 겨울 비수기, 한적한 시즌', '2026-11-01 00:00:00', '2026-12-31 23:59:59', TRUE);
INSERT INTO monthly_plan (plan_month, destination_id, title, subtitle, badge_text, highlights, start_at, end_at, is_active) VALUES ('2026-11', 12, '설국 삿포로, 눈부신 겨울 특가', '홋카이도 직항·경유 최대 25% 특가', '최대 25% OFF', '인천→삿포로 직항 2시간 40분
눈 축제와 온천, 라멘과 징기스칸
가까운 겨울 여행지 1순위', '2026-11-01 00:00:00', '2026-12-31 23:59:59', TRUE);
INSERT INTO monthly_plan (plan_month, destination_id, title, subtitle, badge_text, highlights, start_at, end_at, is_active) VALUES ('2026-11', 27, '아프리카 남단, 케이프타운으로', '희망봉을 향한 경유 항공권 최대 26% 특가', '최대 26% OFF', '테이블마운틴과 희망봉
펭귄이 사는 볼더스 비치
와이너리 투어까지 한 번에', '2026-11-01 00:00:00', '2026-12-31 23:59:59', TRUE);
INSERT INTO monthly_plan_flight (plan_id, flight_id, cabin_class, sale_price, original_price, limited_seats, display_order) VALUES (1, 13, 'ECONOMY', 690000, 980000, 20, 1);
INSERT INTO monthly_plan_flight (plan_id, flight_id, cabin_class, sale_price, original_price, limited_seats, display_order) VALUES (1, 13, 'PREMIUM', 1099000, 1570000, 6, 1);
INSERT INTO monthly_plan_flight (plan_id, flight_id, cabin_class, sale_price, original_price, limited_seats, display_order) VALUES (1, 13, 'BUSINESS', 2198000, 3140000, 4, 1);
INSERT INTO monthly_plan_flight (plan_id, flight_id, cabin_class, sale_price, original_price, limited_seats, display_order) VALUES (1, 14, 'ECONOMY', 490000, 720000, 30, 2);
INSERT INTO monthly_plan_flight (plan_id, flight_id, cabin_class, sale_price, original_price, limited_seats, display_order) VALUES (1, 14, 'PREMIUM', 780000, 1150000, 8, 2);
INSERT INTO monthly_plan_flight (plan_id, flight_id, cabin_class, sale_price, original_price, limited_seats, display_order) VALUES (1, 14, 'BUSINESS', 1550000, 2300000, 4, 2);
INSERT INTO monthly_plan_flight (plan_id, flight_id, cabin_class, sale_price, original_price, limited_seats, display_order) VALUES (1, 15, 'ECONOMY', 520000, 760000, 30, 3);
INSERT INTO monthly_plan_flight (plan_id, flight_id, cabin_class, sale_price, original_price, limited_seats, display_order) VALUES (1, 15, 'PREMIUM', 830000, 1220000, 8, 3);
INSERT INTO monthly_plan_flight (plan_id, flight_id, cabin_class, sale_price, original_price, limited_seats, display_order) VALUES (1, 15, 'BUSINESS', 1660000, 2430000, 4, 3);
INSERT INTO monthly_plan_flight (plan_id, flight_id, cabin_class, sale_price, original_price, limited_seats, display_order) VALUES (2, 36, 'ECONOMY', 290000, 360000, 20, 1);
INSERT INTO monthly_plan_flight (plan_id, flight_id, cabin_class, sale_price, original_price, limited_seats, display_order) VALUES (2, 36, 'BUSINESS', 840000, 1050000, 4, 1);
INSERT INTO monthly_plan_flight (plan_id, flight_id, cabin_class, sale_price, original_price, limited_seats, display_order) VALUES (2, 37, 'ECONOMY', 159000, 210000, 30, 2);
INSERT INTO monthly_plan_flight (plan_id, flight_id, cabin_class, sale_price, original_price, limited_seats, display_order) VALUES (2, 38, 'ECONOMY', 210000, 280000, 20, 3);
INSERT INTO monthly_plan_flight (plan_id, flight_id, cabin_class, sale_price, original_price, limited_seats, display_order) VALUES (2, 38, 'BUSINESS', 640000, 820000, 4, 3);
INSERT INTO monthly_plan_flight (plan_id, flight_id, cabin_class, sale_price, original_price, limited_seats, display_order) VALUES (3, 78, 'ECONOMY', 1180000, 1480000, 15, 1);
INSERT INTO monthly_plan_flight (plan_id, flight_id, cabin_class, sale_price, original_price, limited_seats, display_order) VALUES (3, 78, 'PREMIUM', 1890000, 2370000, 6, 1);
INSERT INTO monthly_plan_flight (plan_id, flight_id, cabin_class, sale_price, original_price, limited_seats, display_order) VALUES (3, 78, 'BUSINESS', 3790000, 4740000, 3, 1);
INSERT INTO monthly_plan_flight (plan_id, flight_id, cabin_class, sale_price, original_price, limited_seats, display_order) VALUES (3, 79, 'ECONOMY', 1050000, 1380000, 15, 2);
INSERT INTO monthly_plan_flight (plan_id, flight_id, cabin_class, sale_price, original_price, limited_seats, display_order) VALUES (3, 79, 'PREMIUM', 1690000, 2210000, 6, 2);
INSERT INTO monthly_plan_flight (plan_id, flight_id, cabin_class, sale_price, original_price, limited_seats, display_order) VALUES (3, 79, 'BUSINESS', 3360000, 4420000, 3, 2);
INSERT INTO monthly_plan_flight (plan_id, flight_id, cabin_class, sale_price, original_price, limited_seats, display_order) VALUES (3, 80, 'ECONOMY', 920000, 1250000, 15, 3);
INSERT INTO monthly_plan_flight (plan_id, flight_id, cabin_class, sale_price, original_price, limited_seats, display_order) VALUES (3, 80, 'BUSINESS', 2300000, 3000000, 3, 3);

-- [A] 이벤트 팝업 3개: 노출 중 1, 예정 1, 기간 지남 1 (메인은 노출 중이고 기간 안인 팝업 1개만 보여 준다)
INSERT INTO popup_event (title, body, qr_target_url, start_at, end_at, is_active, created_by) VALUES ('나도 감 오픈 기념, 거코와 삐삐가 쏜다!', '11월 한 달, 이달의 특별기획 3곳을 특가로 만나 보세요. 삐삐가 뿜는 불꽃 같은 할인을 놓치지 마세요.', '/special', '2026-11-01 00:00:00', '2026-12-31 23:59:59', TRUE, 1);
INSERT INTO popup_event (title, body, qr_target_url, start_at, end_at, is_active, created_by) VALUES ('겨울 방학 얼리버드 이벤트', '내년 1월 한 달간 해외 여행 예약 고객께 거코 굿즈를 드려요. (이벤트 예정)', '/travel', '2027-01-01 00:00:00', '2027-01-31 23:59:59', TRUE, 1);
INSERT INTO popup_event (title, body, qr_target_url, start_at, end_at, is_active, created_by) VALUES ('가을 단풍 여행 특가 (종료)', '10월 한 달 진행했던 가을 여행 이벤트입니다.', '/bestseller', '2026-10-01 00:00:00', '2026-10-31 23:59:59', TRUE, 1);

-- [U] 고객문의 4개: 사용자 user 의 문의. 답변 완료 2개, 접수 2개 (관리자 admin 이 답변)
INSERT INTO support_inquiry (member_id, category, title, content, status, answer_content, answered_by, created_at, answered_at) VALUES (1, 'FLIGHT', '위탁 수하물 규정이 궁금해요', '민국항공 MG901 일반석에서 위탁 수하물을 몇 kg까지 부칠 수 있나요? 추가 요금이 있는지도 알려 주세요.', 'ANSWERED', '안녕하세요, 나도 감입니다. MG901 일반석은 위탁 수하물 23kg 1개까지 무료입니다. 초과분은 kg당 공항 요금표 기준으로 부과돼요. 항공편 상세의 ''수하물'' 항목에서도 확인하실 수 있습니다.', 1, '2026-11-18 10:20:00', '2026-11-18 15:40:00');
INSERT INTO support_inquiry (member_id, category, title, content, status, answer_content, answered_by, created_at, answered_at) VALUES (1, 'TOUR', '투어 일정을 바꿀 수 있나요?', '예약 후에 투어 출발일을 하루 늦추고 싶어요. 변경 수수료가 있을까요?', 'RECEIVED', NULL, NULL, '2026-11-19 09:05:00', NULL);
INSERT INTO support_inquiry (member_id, category, title, content, status, answer_content, answered_by, created_at, answered_at) VALUES (1, 'PAYMENT', '결제 영수증은 어디서 받나요?', '결제를 마쳤는데 영수증 발급 메뉴를 못 찾겠어요.', 'ANSWERED', '결제 내역은 ''내 예약''의 예약 상세에서 확인하실 수 있어요. 별도의 영수증이 필요하시면 예약 번호와 함께 다시 문의해 주세요.', 1, '2026-11-19 13:30:00', '2026-11-19 17:10:00');
INSERT INTO support_inquiry (member_id, category, title, content, status, answer_content, answered_by, created_at, answered_at) VALUES (1, 'HOTEL', '호텔 체크인 시간이 궁금해요', '도쿄 호텔에 밤 11시쯤 도착할 것 같은데 늦은 체크인도 가능한가요?', 'RECEIVED', NULL, NULL, '2026-11-20 08:45:00', NULL);

-- [M] 국내 여행지 10곳 (경주·강릉·속초·부산·제주·전주·여수·순천·통영·단양)
INSERT INTO domestic_city (name_ko, province, latitude, longitude, summary, poster_color_from, poster_color_to, status, sort_order) VALUES ('경주', '경북', 35.8562, 129.2247, '천년 신라의 수도, 도시 전체가 야외 박물관', '#c0842b', '#7a3b12', 'AVAILABLE', 1);
INSERT INTO domestic_city (name_ko, province, latitude, longitude, summary, poster_color_from, poster_color_to, status, sort_order) VALUES ('강릉', '강원', 37.7519, 128.8761, '동해 바다와 커피 거리, 초당 두부의 도시', '#1c7ed6', '#0b3d66', 'AVAILABLE', 2);
INSERT INTO domestic_city (name_ko, province, latitude, longitude, summary, poster_color_from, poster_color_to, status, sort_order) VALUES ('속초', '강원', 38.207, 128.5918, '설악산과 동해가 만나는 항구 도시', '#2f9e44', '#0b5a3a', 'AVAILABLE', 3);
INSERT INTO domestic_city (name_ko, province, latitude, longitude, summary, poster_color_from, poster_color_to, status, sort_order) VALUES ('부산', '경남', 35.1796, 129.0756, '해운대와 광안대교, 자갈치 시장의 바다 도시', '#ff6b6b', '#7d2a4d', 'AVAILABLE', 4);
INSERT INTO domestic_city (name_ko, province, latitude, longitude, summary, poster_color_from, poster_color_to, status, sort_order) VALUES ('제주', '제주', 33.4996, 126.5312, '한라산과 바다, 돌담과 귤밭의 섬', '#20c997', '#0b6e4f', 'AVAILABLE', 5);
INSERT INTO domestic_city (name_ko, province, latitude, longitude, summary, poster_color_from, poster_color_to, status, sort_order) VALUES ('전주', '전북', 35.8242, 127.148, '한옥마을과 비빔밥, 막걸리 골목의 맛의 도시', '#e67700', '#8a3b00', 'AVAILABLE', 6);
INSERT INTO domestic_city (name_ko, province, latitude, longitude, summary, poster_color_from, poster_color_to, status, sort_order) VALUES ('여수', '전남', 34.7604, 127.6622, '밤바다와 케이블카, 돌산 갓김치의 남해 항구', '#4c6ef5', '#1b2a6b', 'AVAILABLE', 7);
INSERT INTO domestic_city (name_ko, province, latitude, longitude, summary, poster_color_from, poster_color_to, status, sort_order) VALUES ('순천', '전남', 34.9506, 127.4872, '순천만 습지와 국가정원이 있는 생태 도시', '#82c91e', '#2b6a1c', 'AVAILABLE', 8);
INSERT INTO domestic_city (name_ko, province, latitude, longitude, summary, poster_color_from, poster_color_to, status, sort_order) VALUES ('통영', '경남', 34.8544, 128.4331, '한려수도와 충무김밥, 예술가의 항구', '#15aabf', '#0b4f6c', 'AVAILABLE', 9);
INSERT INTO domestic_city (name_ko, province, latitude, longitude, summary, poster_color_from, poster_color_to, status, sort_order) VALUES ('단양', '충북', 36.9845, 128.3655, '남한강과 도담삼봉, 패러글라이딩의 고장', '#7950f2', '#3b2a8a', 'AVAILABLE', 10);

-- [M] 국내 이동편 50개 (도시마다 5개: 서울 출발 3 + 대전 출발 2, 요금은 성인 편도 1인)
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (1, 'SEOUL', 'TRAIN', 'KTX 서울→신경주', '07:30:00', 130, 59800, '신경주역에서 시내버스·택시로 20분', 1);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (1, 'SEOUL', 'TRAIN', 'SRT 수서→신경주', '09:10:00', 125, 52400, '수서역 출발, 신경주역 도착', 2);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (1, 'SEOUL', 'EXPRESS_BUS', '고속버스 서울→경주', '08:00:00', 230, 24000, '경주 시외버스터미널 도착', 3);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (1, 'DAEJEON', 'INTERCITY_BUS', '시외버스 대전→경주', '09:00:00', 170, 17000, '대전복합터미널 출발', 4);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (1, 'DAEJEON', 'TRAIN', 'KTX 대전→신경주(동대구 환승)', '08:20:00', 135, 31000, '동대구역에서 환승 1회', 5);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (2, 'SEOUL', 'TRAIN', 'KTX-이음 서울→강릉', '07:40:00', 115, 27600, '청량리역 출발, 강릉역 도착', 1);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (2, 'SEOUL', 'TRAIN', 'KTX-이음 청량리→강릉(오후)', '14:10:00', 120, 27600, '경강선, 평창·진부 경유', 2);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (2, 'SEOUL', 'EXPRESS_BUS', '고속버스 동서울→강릉', '08:30:00', 160, 17000, '주말 정체 시 30분 이상 지연', 3);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (2, 'DAEJEON', 'INTERCITY_BUS', '시외버스 대전→강릉', '08:10:00', 220, 24000, '하루 4회 운행', 4);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (2, 'DAEJEON', 'TRAIN', 'KTX 대전→서울(청량리 환승) 강릉', '07:50:00', 220, 41000, '서울에서 KTX-이음 환승', 5);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (3, 'SEOUL', 'EXPRESS_BUS', '고속버스 서울→속초', '07:30:00', 160, 20000, '서울고속버스터미널 출발', 1);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (3, 'SEOUL', 'EXPRESS_BUS', '우등 고속버스 동서울→속초', '10:00:00', 155, 28500, '우등 좌석(2열)', 2);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (3, 'SEOUL', 'INTERCITY_BUS', '시외버스 상봉→속초', '09:00:00', 170, 19000, '상봉터미널 출발', 3);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (3, 'DAEJEON', 'INTERCITY_BUS', '시외버스 대전→속초', '08:00:00', 270, 28000, '하루 2회 운행', 4);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (3, 'DAEJEON', 'TRAIN', 'KTX 대전→서울 후 버스 속초', '07:20:00', 290, 46000, '서울에서 속초행 버스 환승', 5);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (4, 'SEOUL', 'TRAIN', 'KTX 서울→부산', '07:00:00', 155, 59800, '부산역 도착, 지하철 연결', 1);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (4, 'SEOUL', 'TRAIN', 'SRT 수서→부산', '09:00:00', 150, 52600, '수서역 출발', 2);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (4, 'SEOUL', 'EXPRESS_BUS', '고속버스 서울→부산', '08:00:00', 260, 25000, '부산종합버스터미널(노포) 도착', 3);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (4, 'DAEJEON', 'TRAIN', 'KTX 대전→부산', '08:30:00', 90, 35000, '경부선 직행', 4);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (4, 'DAEJEON', 'EXPRESS_BUS', '고속버스 대전→부산', '09:30:00', 170, 17500, '대전복합터미널 출발', 5);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (5, 'SEOUL', 'FLIGHT', '국내선 김포→제주 (오전)', '07:30:00', 70, 62000, '김포공항 출발, 제주공항 도착', 1);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (5, 'SEOUL', 'FLIGHT', '국내선 김포→제주 (낮)', '13:00:00', 70, 55000, '김포공항 출발, 제주공항 도착', 2);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (5, 'SEOUL', 'FLIGHT', '국내선 김포→제주 (저녁)', '19:00:00', 70, 68000, '김포공항 출발, 제주공항 도착', 3);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (5, 'DAEJEON', 'FLIGHT', '대전→청주공항 연계 제주행', '09:00:00', 170, 58000, '대전에서 청주공항까지 버스 이동 후 항공', 4);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (5, 'DAEJEON', 'FLIGHT', '대전→김포공항 연계 제주행', '08:00:00', 220, 79000, '대전에서 KTX로 서울 이동 후 공항철도·항공', 5);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (6, 'SEOUL', 'EXPRESS_BUS', '고속버스 서울→전주', '08:00:00', 170, 15000, '전주고속버스터미널 도착', 1);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (6, 'SEOUL', 'TRAIN', 'KTX 용산→전주', '07:50:00', 125, 38000, 'KTX 호남선, 전주역 도착', 2);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (6, 'SEOUL', 'INTERCITY_BUS', '시외버스 동서울→전주', '10:00:00', 180, 14000, '하루 3회 운행', 3);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (6, 'DAEJEON', 'INTERCITY_BUS', '시외버스 대전→전주', '09:00:00', 80, 8800, '30분 간격 운행', 4);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (6, 'DAEJEON', 'TRAIN', '무궁화호 대전→익산 환승 전주', '10:30:00', 110, 9500, '익산역에서 환승 1회', 5);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (7, 'SEOUL', 'TRAIN', 'KTX 용산→여수엑스포', '07:10:00', 180, 51000, '여수엑스포역 도착', 1);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (7, 'SEOUL', 'TRAIN', 'SRT 수서→여수엑스포', '08:40:00', 175, 47000, '수서역 출발', 2);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (7, 'SEOUL', 'EXPRESS_BUS', '고속버스 서울→여수', '08:00:00', 270, 28000, '여수종합버스터미널 도착', 3);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (7, 'DAEJEON', 'TRAIN', 'KTX 대전→여수엑스포(익산 환승)', '08:00:00', 160, 35000, '익산역에서 환승 1회', 4);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (7, 'DAEJEON', 'EXPRESS_BUS', '고속버스 대전→여수', '10:00:00', 180, 20000, '하루 6회 운행', 5);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (8, 'SEOUL', 'TRAIN', 'KTX 용산→순천', '07:10:00', 170, 46000, '순천역 도착, 국가정원행 버스 연결', 1);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (8, 'SEOUL', 'TRAIN', 'SRT 수서→순천', '09:30:00', 165, 43000, '수서역 출발', 2);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (8, 'SEOUL', 'EXPRESS_BUS', '고속버스 서울→순천', '08:30:00', 240, 24000, '순천종합버스터미널 도착', 3);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (8, 'DAEJEON', 'TRAIN', 'KTX 대전→순천(익산 환승)', '08:10:00', 120, 30000, '익산역에서 환승 1회', 4);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (8, 'DAEJEON', 'INTERCITY_BUS', '시외버스 대전→순천', '09:20:00', 170, 16000, '하루 5회 운행', 5);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (9, 'SEOUL', 'EXPRESS_BUS', '고속버스 서울→통영', '08:00:00', 240, 26000, '통영종합버스터미널 도착', 1);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (9, 'SEOUL', 'EXPRESS_BUS', '우등 고속버스 서울→통영', '10:30:00', 235, 36500, '우등 좌석(2열)', 2);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (9, 'SEOUL', 'TRAIN', 'KTX 서울→진주 후 버스 통영', '07:20:00', 260, 58000, '진주역에서 시외버스 환승', 3);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (9, 'DAEJEON', 'EXPRESS_BUS', '고속버스 대전→통영', '09:00:00', 150, 14000, '대전복합터미널 출발', 4);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (9, 'DAEJEON', 'INTERCITY_BUS', '시외버스 대전→통영', '11:00:00', 160, 13500, '하루 8회 운행', 5);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (10, 'SEOUL', 'INTERCITY_BUS', '시외버스 동서울→단양', '08:20:00', 160, 15000, '단양버스터미널 도착', 1);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (10, 'SEOUL', 'TRAIN', 'ITX-마음 청량리→단양', '07:30:00', 130, 17000, '단양역에서 시내 이동 10분', 2);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (10, 'SEOUL', 'EXPRESS_BUS', '우등 버스 서울→단양', '09:30:00', 150, 22000, '우등 좌석(2열)', 3);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (10, 'DAEJEON', 'INTERCITY_BUS', '시외버스 대전→단양', '09:00:00', 180, 14000, '청주 경유 하루 3회', 4);
INSERT INTO domestic_transport (city_id, origin, mode, name, depart_time, duration_minutes, fare, note, sort_order) VALUES (10, 'DAEJEON', 'TRAIN', 'KTX 대전→오송 환승 단양', '08:00:00', 140, 25000, '오송역에서 시외버스 환승', 5);

-- [M] 해외 투어: 이달의 기획 3곳·베스트셀러 3곳은 3테마 전부, 나머지는 도시를 대표하는 1테마 (블라디보스토크 제외)
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 1, NULL, 'ART_REST', '파리 예술·휴식 투어: 루브르 박물관 · 오르세 박물관', '세계 최대 규모의 미술관, 모나리자 소장. 인상주의 회화 전문 미술관.', '달무리 공연장', '루브르 박물관 — 세계 최대 규모의 미술관, 모나리자 소장
오르세 박물관 — 인상주의 회화 전문 미술관
몽마르트르 갤러리 — 예술가 거리와 소호미술관들', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
미술관·공연 입장권 또는 스파 이용권', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 루브르 박물관, 오르세 박물관, 몽마르트르 갤러리 (상품·브랜드는 가상)', 'ON_SALE', 1);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (1, 6, 7, 790000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (1, 1, '파리 도착', '인천에서 출발해 파리에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (1, 2, '루브르 박물관', '세계 최대 규모의 미술관, 모나리자 소장. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (1, 3, '오르세 박물관', '인상주의 회화 전문 미술관. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (1, 4, '몽마르트르 갤러리', '예술가 거리와 소호미술관들. 공연이나 전시 일정에 맞춰 관람 시간을 조정합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (1, 5, '공연·전시 관람', '파리에서 열리는 공연 또는 전시 중 일정에 맞는 한 편을 관람합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (1, 6, '스파·휴식의 날', '스파나 온천, 마사지 등 느린 휴식으로 여행의 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (1, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (1, 9, 10, 1100000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (2, 1, '파리 도착', '인천에서 출발해 파리에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (2, 2, '루브르 박물관', '세계 최대 규모의 미술관, 모나리자 소장. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (2, 3, '오르세 박물관', '인상주의 회화 전문 미술관. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (2, 4, '몽마르트르 갤러리', '예술가 거리와 소호미술관들. 공연이나 전시 일정에 맞춰 관람 시간을 조정합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (2, 5, '공연·전시 관람', '파리에서 열리는 공연 또는 전시 중 일정에 맞는 한 편을 관람합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (2, 6, '스파·휴식의 날', '스파나 온천, 마사지 등 느린 휴식으로 여행의 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (2, 7, '근교 소도시 산책', '파리 근교의 작은 마을을 산책하며 갤러리와 공방을 둘러봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (2, 8, '전통 체험 클래스', '현지 공예 또는 전통 문화 체험 수업에 참여해 작품을 만듭니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (2, 9, '자유 일정', '하루는 자유롭게 보냅니다. 가이드가 추천 산책로와 전시 정보를 드립니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (2, 10, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (1, 13, 14, 1520000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (3, 1, '파리 도착', '인천에서 출발해 파리에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (3, 2, '루브르 박물관', '세계 최대 규모의 미술관, 모나리자 소장. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (3, 3, '오르세 박물관', '인상주의 회화 전문 미술관. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (3, 4, '몽마르트르 갤러리', '예술가 거리와 소호미술관들. 공연이나 전시 일정에 맞춰 관람 시간을 조정합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (3, 5, '공연·전시 관람', '파리에서 열리는 공연 또는 전시 중 일정에 맞는 한 편을 관람합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (3, 6, '스파·휴식의 날', '스파나 온천, 마사지 등 느린 휴식으로 여행의 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (3, 7, '근교 소도시 산책', '파리 근교의 작은 마을을 산책하며 갤러리와 공방을 둘러봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (3, 8, '전통 체험 클래스', '현지 공예 또는 전통 문화 체험 수업에 참여해 작품을 만듭니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (3, 9, '자유 일정', '하루는 자유롭게 보냅니다. 가이드가 추천 산책로와 전시 정보를 드립니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (3, 10, '정원·공원 힐링 산책', '도심 공원과 정원을 걸으며 사색하는 시간을 가집니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (3, 11, '야경과 재즈·클래식의 밤', '저녁에는 야경 명소를 보고 가벼운 공연을 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (3, 12, '미술관 한 곳 더', '루브르 박물관 외에 가이드가 고른 작은 미술관을 한 곳 더 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (3, 13, '티타임과 독서의 오후', '현지 찻집에서 천천히 차를 마시며 하루를 정리합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (3, 14, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 2, NULL, 'SPORTS_ACTIVITY', '런던 스포츠·액티비티 투어: 첼시 FC 경기장 투어 · 윔블던 테니스', '프리미어리그 명문 축구팀 스탬포드 브릿지. 런던의 그랜드 슬램 테니스 대회.', NULL, '첼시 FC 경기장 투어 — 프리미어리그 명문 축구팀 스탬포드 브릿지
윔블던 테니스 — 런던의 그랜드 슬램 테니스 대회
런던 크리켓 — 로즈 볼과 같은 영국식 크리켓 경기', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
경기 관람 티켓 또는 액티비티 이용권·장비 대여', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 첼시 FC 경기장 투어, 윔블던 테니스, 런던 크리켓 (상품·브랜드는 가상)', 'ON_SALE', 2);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (2, 6, 7, 890000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (4, 1, '런던 도착', '인천에서 출발해 런던에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (4, 2, '첼시 FC 경기장 투어', '프리미어리그 명문 축구팀 스탬포드 브릿지. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (4, 3, '윔블던 테니스 체험', '런던의 그랜드 슬램 테니스 대회. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (4, 4, '런던 크리켓', '로즈 볼과 같은 영국식 크리켓 경기. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (4, 5, '근교 트레킹·야외 활동', '런던 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (4, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (4, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (2, 9, 10, 1240000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (5, 1, '런던 도착', '인천에서 출발해 런던에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (5, 2, '첼시 FC 경기장 투어', '프리미어리그 명문 축구팀 스탬포드 브릿지. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (5, 3, '윔블던 테니스 체험', '런던의 그랜드 슬램 테니스 대회. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (5, 4, '런던 크리켓', '로즈 볼과 같은 영국식 크리켓 경기. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (5, 5, '근교 트레킹·야외 활동', '런던 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (5, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (5, 7, '체험 레슨', '현지 코치에게 짧은 레슨을 받고 미니 게임으로 마무리합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (5, 8, '자유 일정과 휴식', '활동 사이 하루는 자유롭게 쉬며 근육을 풀 시간을 가집니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (5, 9, '첼시 FC 경기장 투어 심화 코스', '가이드와 함께 한 단계 높은 코스에 도전합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (5, 10, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (2, 13, 14, 1720000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (6, 1, '런던 도착', '인천에서 출발해 런던에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (6, 2, '첼시 FC 경기장 투어', '프리미어리그 명문 축구팀 스탬포드 브릿지. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (6, 3, '윔블던 테니스 체험', '런던의 그랜드 슬램 테니스 대회. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (6, 4, '런던 크리켓', '로즈 볼과 같은 영국식 크리켓 경기. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (6, 5, '근교 트레킹·야외 활동', '런던 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (6, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (6, 7, '체험 레슨', '현지 코치에게 짧은 레슨을 받고 미니 게임으로 마무리합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (6, 8, '자유 일정과 휴식', '활동 사이 하루는 자유롭게 쉬며 근육을 풀 시간을 가집니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (6, 9, '첼시 FC 경기장 투어 심화 코스', '가이드와 함께 한 단계 높은 코스에 도전합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (6, 10, '강변·해변 러닝과 요가', '아침 러닝이나 요가로 몸을 깨운 뒤 도시를 가볍게 둘러봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (6, 11, '현지 팀 팬 모임', '현지 팬들과 함께 응원 문화를 체험하고 기념품을 고릅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (6, 12, '물가 액티비티', '수상·해안 액티비티를 즐기고 온천이나 스파로 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (6, 13, '로컬 스포츠 클래스', '현지에서 사랑받는 전통 스포츠를 배우는 체험 수업입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (6, 14, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 3, NULL, 'FOOD_DRINK', '베를린 미식·주류 투어: 독일 맥주 투어 · 슈니첼과 슈파겟', '독일 맥주 전통 품종과 비어홀 경험. 베를린 대표 전통 음식.', '푸른보리 양조장', '독일 맥주 투어 — 독일 맥주 전통 품종과 비어홀 경험
슈니첼과 슈파겟 — 베를린 대표 전통 음식
멀티컬처 거리음식 — 쿠리부르스트 등 다문화 음식 거리', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
일정에 표시된 식사와 시음', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 독일 맥주 투어, 슈니첼과 슈파겟, 멀티컬처 거리음식 (상품·브랜드는 가상)', 'ON_SALE', 3);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (3, 6, 7, 730000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (7, 1, '베를린 도착', '인천에서 출발해 베를린에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (7, 2, '독일 맥주 투어 탐방', '독일 맥주 전통 품종과 비어홀 경험. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (7, 3, '푸른보리 양조장 견학과 시음', '푸른보리 양조장(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 슈니첼과 슈파겟과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (7, 4, '멀티컬처 거리음식 체험', '쿠리부르스트 등 다문화 음식 거리. 직접 맛보고 고르는 시간을 가진 뒤 저녁은 현지 식당에서 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (7, 5, '쿠킹 클래스', '현지 셰프에게 베를린의 대표 요리를 배우고 직접 만든 요리로 저녁을 먹습니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (7, 6, '근교 산지 미식 여행', '베를린 근교의 산지로 이동해 제철 재료와 지역 음식을 맛보고 농장·공방을 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (7, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (3, 9, 10, 1020000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (8, 1, '베를린 도착', '인천에서 출발해 베를린에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (8, 2, '독일 맥주 투어 탐방', '독일 맥주 전통 품종과 비어홀 경험. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (8, 3, '푸른보리 양조장 견학과 시음', '푸른보리 양조장(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 슈니첼과 슈파겟과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (8, 4, '멀티컬처 거리음식 체험', '쿠리부르스트 등 다문화 음식 거리. 직접 맛보고 고르는 시간을 가진 뒤 저녁은 현지 식당에서 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (8, 5, '쿠킹 클래스', '현지 셰프에게 베를린의 대표 요리를 배우고 직접 만든 요리로 저녁을 먹습니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (8, 6, '근교 산지 미식 여행', '베를린 근교의 산지로 이동해 제철 재료와 지역 음식을 맛보고 농장·공방을 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (8, 7, '슈니첼과 슈파겟 깊이 보기', '베를린 대표 전통 음식. 전문 가이드의 설명과 함께 두 번째 코스를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (8, 8, '시장 쇼핑과 자유 시간', '현지 시장과 상점가에서 기념품과 식재료를 둘러보고 자유 시간을 보냅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (8, 9, '로컬 맛집 릴레이', '가이드가 고른 현지 단골 식당 세 곳을 이어서 맛보는 미식 산책입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (8, 10, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (3, 13, 14, 1410000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (9, 1, '베를린 도착', '인천에서 출발해 베를린에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (9, 2, '독일 맥주 투어 탐방', '독일 맥주 전통 품종과 비어홀 경험. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (9, 3, '푸른보리 양조장 견학과 시음', '푸른보리 양조장(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 슈니첼과 슈파겟과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (9, 4, '멀티컬처 거리음식 체험', '쿠리부르스트 등 다문화 음식 거리. 직접 맛보고 고르는 시간을 가진 뒤 저녁은 현지 식당에서 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (9, 5, '쿠킹 클래스', '현지 셰프에게 베를린의 대표 요리를 배우고 직접 만든 요리로 저녁을 먹습니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (9, 6, '근교 산지 미식 여행', '베를린 근교의 산지로 이동해 제철 재료와 지역 음식을 맛보고 농장·공방을 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (9, 7, '슈니첼과 슈파겟 깊이 보기', '베를린 대표 전통 음식. 전문 가이드의 설명과 함께 두 번째 코스를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (9, 8, '시장 쇼핑과 자유 시간', '현지 시장과 상점가에서 기념품과 식재료를 둘러보고 자유 시간을 보냅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (9, 9, '로컬 맛집 릴레이', '가이드가 고른 현지 단골 식당 세 곳을 이어서 맛보는 미식 산책입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (9, 10, '디저트·카페 투어', '베를린의 유명 디저트와 카페를 돌며 여유로운 오후를 보냅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (9, 11, '현지 가정식 초대', '현지 가정집 식탁에서 가정식을 함께 먹으며 이야기를 나눕니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (9, 12, '자유 일정', '하루는 자유롭게 보냅니다. 가이드가 추천 맛집 지도를 드립니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (9, 13, '야시장·야경 산책', '저녁 시장과 야경 명소를 걸으며 길거리 음식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (9, 14, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 4, NULL, 'SPORTS_ACTIVITY', '마드리드 스포츠·액티비티 투어: 레알 마드리드 축구 · 아틀레티코 마드리드', '라 리가 최강 축구팀 베르나베우 경기장. 마드리드의 또 다른 명문 축구팀.', NULL, '레알 마드리드 축구 — 라 리가 최강 축구팀 베르나베우 경기장
아틀레티코 마드리드 — 마드리드의 또 다른 명문 축구팀
스페인 투우 — 전통 투우 경험', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
경기 관람 티켓 또는 액티비티 이용권·장비 대여', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 레알 마드리드 축구, 아틀레티코 마드리드, 스페인 투우 (상품·브랜드는 가상)', 'ON_SALE', 4);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (4, 6, 7, 910000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (10, 1, '마드리드 도착', '인천에서 출발해 마드리드에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (10, 2, '레알 마드리드 축구', '라 리가 최강 축구팀 베르나베우 경기장. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (10, 3, '아틀레티코 마드리드 체험', '마드리드의 또 다른 명문 축구팀. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (10, 4, '스페인 투우', '전통 투우 경험. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (10, 5, '근교 트레킹·야외 활동', '마드리드 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (10, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (10, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (4, 9, 10, 1280000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (11, 1, '마드리드 도착', '인천에서 출발해 마드리드에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (11, 2, '레알 마드리드 축구', '라 리가 최강 축구팀 베르나베우 경기장. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (11, 3, '아틀레티코 마드리드 체험', '마드리드의 또 다른 명문 축구팀. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (11, 4, '스페인 투우', '전통 투우 경험. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (11, 5, '근교 트레킹·야외 활동', '마드리드 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (11, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (11, 7, '체험 레슨', '현지 코치에게 짧은 레슨을 받고 미니 게임으로 마무리합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (11, 8, '자유 일정과 휴식', '활동 사이 하루는 자유롭게 쉬며 근육을 풀 시간을 가집니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (11, 9, '레알 마드리드 축구 심화 코스', '가이드와 함께 한 단계 높은 코스에 도전합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (11, 10, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (4, 13, 14, 1770000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (12, 1, '마드리드 도착', '인천에서 출발해 마드리드에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (12, 2, '레알 마드리드 축구', '라 리가 최강 축구팀 베르나베우 경기장. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (12, 3, '아틀레티코 마드리드 체험', '마드리드의 또 다른 명문 축구팀. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (12, 4, '스페인 투우', '전통 투우 경험. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (12, 5, '근교 트레킹·야외 활동', '마드리드 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (12, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (12, 7, '체험 레슨', '현지 코치에게 짧은 레슨을 받고 미니 게임으로 마무리합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (12, 8, '자유 일정과 휴식', '활동 사이 하루는 자유롭게 쉬며 근육을 풀 시간을 가집니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (12, 9, '레알 마드리드 축구 심화 코스', '가이드와 함께 한 단계 높은 코스에 도전합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (12, 10, '강변·해변 러닝과 요가', '아침 러닝이나 요가로 몸을 깨운 뒤 도시를 가볍게 둘러봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (12, 11, '현지 팀 팬 모임', '현지 팬들과 함께 응원 문화를 체험하고 기념품을 고릅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (12, 12, '물가 액티비티', '수상·해안 액티비티를 즐기고 온천이나 스파로 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (12, 13, '로컬 스포츠 클래스', '현지에서 사랑받는 전통 스포츠를 배우는 체험 수업입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (12, 14, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 5, NULL, 'FOOD_DRINK', '로마 미식·주류 투어: 테스타치오 마켓 · 캄포 데 피오리', '로마 전통 음식 발상지. 오픈 마켓과 고급 레스토랑.', '바람결 증류소', '테스타치오 마켓 — 로마 전통 음식 발상지
캄포 데 피오리 — 오픈 마켓과 고급 레스토랑
아라치니 & 수플리 — 로마 전통 간식', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
일정에 표시된 식사와 시음', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 테스타치오 마켓, 캄포 데 피오리, 아라치니 & 수플리 (상품·브랜드는 가상)', 'ON_SALE', 5);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (5, 6, 7, 780000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (13, 1, '로마 도착', '인천에서 출발해 로마에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (13, 2, '테스타치오 마켓 탐방', '로마 전통 음식 발상지. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (13, 3, '바람결 증류소 견학과 시음', '바람결 증류소(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 캄포 데 피오리과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (13, 4, '아라치니 & 수플리 체험', '로마 전통 간식. 직접 맛보고 고르는 시간을 가진 뒤 저녁은 현지 식당에서 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (13, 5, '쿠킹 클래스', '현지 셰프에게 로마의 대표 요리를 배우고 직접 만든 요리로 저녁을 먹습니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (13, 6, '근교 산지 미식 여행', '로마 근교의 산지로 이동해 제철 재료와 지역 음식을 맛보고 농장·공방을 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (13, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (5, 9, 10, 1090000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (14, 1, '로마 도착', '인천에서 출발해 로마에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (14, 2, '테스타치오 마켓 탐방', '로마 전통 음식 발상지. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (14, 3, '바람결 증류소 견학과 시음', '바람결 증류소(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 캄포 데 피오리과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (14, 4, '아라치니 & 수플리 체험', '로마 전통 간식. 직접 맛보고 고르는 시간을 가진 뒤 저녁은 현지 식당에서 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (14, 5, '쿠킹 클래스', '현지 셰프에게 로마의 대표 요리를 배우고 직접 만든 요리로 저녁을 먹습니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (14, 6, '근교 산지 미식 여행', '로마 근교의 산지로 이동해 제철 재료와 지역 음식을 맛보고 농장·공방을 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (14, 7, '캄포 데 피오리 깊이 보기', '오픈 마켓과 고급 레스토랑. 전문 가이드의 설명과 함께 두 번째 코스를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (14, 8, '시장 쇼핑과 자유 시간', '현지 시장과 상점가에서 기념품과 식재료를 둘러보고 자유 시간을 보냅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (14, 9, '로컬 맛집 릴레이', '가이드가 고른 현지 단골 식당 세 곳을 이어서 맛보는 미식 산책입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (14, 10, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (5, 13, 14, 1510000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (15, 1, '로마 도착', '인천에서 출발해 로마에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (15, 2, '테스타치오 마켓 탐방', '로마 전통 음식 발상지. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (15, 3, '바람결 증류소 견학과 시음', '바람결 증류소(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 캄포 데 피오리과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (15, 4, '아라치니 & 수플리 체험', '로마 전통 간식. 직접 맛보고 고르는 시간을 가진 뒤 저녁은 현지 식당에서 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (15, 5, '쿠킹 클래스', '현지 셰프에게 로마의 대표 요리를 배우고 직접 만든 요리로 저녁을 먹습니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (15, 6, '근교 산지 미식 여행', '로마 근교의 산지로 이동해 제철 재료와 지역 음식을 맛보고 농장·공방을 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (15, 7, '캄포 데 피오리 깊이 보기', '오픈 마켓과 고급 레스토랑. 전문 가이드의 설명과 함께 두 번째 코스를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (15, 8, '시장 쇼핑과 자유 시간', '현지 시장과 상점가에서 기념품과 식재료를 둘러보고 자유 시간을 보냅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (15, 9, '로컬 맛집 릴레이', '가이드가 고른 현지 단골 식당 세 곳을 이어서 맛보는 미식 산책입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (15, 10, '디저트·카페 투어', '로마의 유명 디저트와 카페를 돌며 여유로운 오후를 보냅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (15, 11, '현지 가정식 초대', '현지 가정집 식탁에서 가정식을 함께 먹으며 이야기를 나눕니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (15, 12, '자유 일정', '하루는 자유롭게 보냅니다. 가이드가 추천 맛집 지도를 드립니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (15, 13, '야시장·야경 산책', '저녁 시장과 야경 명소를 걸으며 길거리 음식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (15, 14, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 5, NULL, 'SPORTS_ACTIVITY', '로마 스포츠·액티비티 투어: 사이클링 · 조깅', '로마 공원 사이클링. 빌라 보르게세 공원.', NULL, '사이클링 — 로마 공원 사이클링
조깅 — 빌라 보르게세 공원
로잉 — 티베르 강 라이딩', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
경기 관람 티켓 또는 액티비티 이용권·장비 대여', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 사이클링, 조깅, 로잉 (상품·브랜드는 가상)', 'ON_SALE', 6);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (6, 6, 7, 900000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (16, 1, '로마 도착', '인천에서 출발해 로마에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (16, 2, '사이클링', '로마 공원 사이클링. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (16, 3, '조깅 체험', '빌라 보르게세 공원. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (16, 4, '로잉', '티베르 강 라이딩. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (16, 5, '근교 트레킹·야외 활동', '로마 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (16, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (16, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (6, 9, 10, 1260000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (17, 1, '로마 도착', '인천에서 출발해 로마에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (17, 2, '사이클링', '로마 공원 사이클링. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (17, 3, '조깅 체험', '빌라 보르게세 공원. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (17, 4, '로잉', '티베르 강 라이딩. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (17, 5, '근교 트레킹·야외 활동', '로마 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (17, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (17, 7, '체험 레슨', '현지 코치에게 짧은 레슨을 받고 미니 게임으로 마무리합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (17, 8, '자유 일정과 휴식', '활동 사이 하루는 자유롭게 쉬며 근육을 풀 시간을 가집니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (17, 9, '사이클링 심화 코스', '가이드와 함께 한 단계 높은 코스에 도전합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (17, 10, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (6, 13, 14, 1730000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (18, 1, '로마 도착', '인천에서 출발해 로마에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (18, 2, '사이클링', '로마 공원 사이클링. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (18, 3, '조깅 체험', '빌라 보르게세 공원. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (18, 4, '로잉', '티베르 강 라이딩. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (18, 5, '근교 트레킹·야외 활동', '로마 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (18, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (18, 7, '체험 레슨', '현지 코치에게 짧은 레슨을 받고 미니 게임으로 마무리합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (18, 8, '자유 일정과 휴식', '활동 사이 하루는 자유롭게 쉬며 근육을 풀 시간을 가집니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (18, 9, '사이클링 심화 코스', '가이드와 함께 한 단계 높은 코스에 도전합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (18, 10, '강변·해변 러닝과 요가', '아침 러닝이나 요가로 몸을 깨운 뒤 도시를 가볍게 둘러봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (18, 11, '현지 팀 팬 모임', '현지 팬들과 함께 응원 문화를 체험하고 기념품을 고릅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (18, 12, '물가 액티비티', '수상·해안 액티비티를 즐기고 온천이나 스파로 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (18, 13, '로컬 스포츠 클래스', '현지에서 사랑받는 전통 스포츠를 배우는 체험 수업입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (18, 14, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 5, NULL, 'ART_REST', '로마 예술·휴식 투어: 바티칸 박물관 · 콜로세움', '세계 최대 박물관. 고대 로마 유산.', NULL, '바티칸 박물관 — 세계 최대 박물관
콜로세움 — 고대 로마 유산
갈레리아 보르게세 — 로마 최고 미술 컬렉션', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
미술관·공연 입장권 또는 스파 이용권', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 바티칸 박물관, 콜로세움, 갈레리아 보르게세 (상품·브랜드는 가상)', 'ON_SALE', 7);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (7, 6, 7, 820000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (19, 1, '로마 도착', '인천에서 출발해 로마에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (19, 2, '바티칸 박물관', '세계 최대 박물관. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (19, 3, '콜로세움', '고대 로마 유산. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (19, 4, '갈레리아 보르게세', '로마 최고 미술 컬렉션. 공연이나 전시 일정에 맞춰 관람 시간을 조정합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (19, 5, '공연·전시 관람', '로마에서 열리는 공연 또는 전시 중 일정에 맞는 한 편을 관람합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (19, 6, '스파·휴식의 날', '스파나 온천, 마사지 등 느린 휴식으로 여행의 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (19, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (7, 9, 10, 1150000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (20, 1, '로마 도착', '인천에서 출발해 로마에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (20, 2, '바티칸 박물관', '세계 최대 박물관. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (20, 3, '콜로세움', '고대 로마 유산. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (20, 4, '갈레리아 보르게세', '로마 최고 미술 컬렉션. 공연이나 전시 일정에 맞춰 관람 시간을 조정합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (20, 5, '공연·전시 관람', '로마에서 열리는 공연 또는 전시 중 일정에 맞는 한 편을 관람합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (20, 6, '스파·휴식의 날', '스파나 온천, 마사지 등 느린 휴식으로 여행의 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (20, 7, '근교 소도시 산책', '로마 근교의 작은 마을을 산책하며 갤러리와 공방을 둘러봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (20, 8, '전통 체험 클래스', '현지 공예 또는 전통 문화 체험 수업에 참여해 작품을 만듭니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (20, 9, '자유 일정', '하루는 자유롭게 보냅니다. 가이드가 추천 산책로와 전시 정보를 드립니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (20, 10, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (7, 13, 14, 1580000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (21, 1, '로마 도착', '인천에서 출발해 로마에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (21, 2, '바티칸 박물관', '세계 최대 박물관. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (21, 3, '콜로세움', '고대 로마 유산. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (21, 4, '갈레리아 보르게세', '로마 최고 미술 컬렉션. 공연이나 전시 일정에 맞춰 관람 시간을 조정합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (21, 5, '공연·전시 관람', '로마에서 열리는 공연 또는 전시 중 일정에 맞는 한 편을 관람합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (21, 6, '스파·휴식의 날', '스파나 온천, 마사지 등 느린 휴식으로 여행의 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (21, 7, '근교 소도시 산책', '로마 근교의 작은 마을을 산책하며 갤러리와 공방을 둘러봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (21, 8, '전통 체험 클래스', '현지 공예 또는 전통 문화 체험 수업에 참여해 작품을 만듭니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (21, 9, '자유 일정', '하루는 자유롭게 보냅니다. 가이드가 추천 산책로와 전시 정보를 드립니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (21, 10, '정원·공원 힐링 산책', '도심 공원과 정원을 걸으며 사색하는 시간을 가집니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (21, 11, '야경과 재즈·클래식의 밤', '저녁에는 야경 명소를 보고 가벼운 공연을 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (21, 12, '미술관 한 곳 더', '바티칸 박물관 외에 가이드가 고른 작은 미술관을 한 곳 더 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (21, 13, '티타임과 독서의 오후', '현지 찻집에서 천천히 차를 마시며 하루를 정리합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (21, 14, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 6, NULL, 'SPORTS_ACTIVITY', '바르셀로나 스포츠·액티비티 투어: FC 바르셀로나 축구 · 지중해 해변 스포츠', '라 리가 최강 팀 캄프노우 경기장 경기. 수상스키, 스쿠버, 카약 등.', '거코 스포츠', 'FC 바르셀로나 축구 — 라 리가 최강 팀 캄프노우 경기장 경기
지중해 해변 스포츠 — 수상스키, 스쿠버, 카약 등', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
경기 관람 티켓 또는 액티비티 이용권·장비 대여', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: FC 바르셀로나 축구, 지중해 해변 스포츠 (상품·브랜드는 가상)', 'ON_SALE', 8);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (8, 6, 7, 830000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (22, 1, '바르셀로나 도착', '인천에서 출발해 바르셀로나에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (22, 2, 'FC 바르셀로나 축구', '라 리가 최강 팀 캄프노우 경기장 경기. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (22, 3, '지중해 해변 스포츠 체험', '수상스키, 스쿠버, 카약 등. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (22, 4, 'FC 바르셀로나 축구', '라 리가 최강 팀 캄프노우 경기장 경기. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (22, 5, '근교 트레킹·야외 활동', '바르셀로나 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (22, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (22, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (8, 9, 10, 1160000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (23, 1, '바르셀로나 도착', '인천에서 출발해 바르셀로나에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (23, 2, 'FC 바르셀로나 축구', '라 리가 최강 팀 캄프노우 경기장 경기. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (23, 3, '지중해 해변 스포츠 체험', '수상스키, 스쿠버, 카약 등. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (23, 4, 'FC 바르셀로나 축구', '라 리가 최강 팀 캄프노우 경기장 경기. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (23, 5, '근교 트레킹·야외 활동', '바르셀로나 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (23, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (23, 7, '체험 레슨', '현지 코치에게 짧은 레슨을 받고 미니 게임으로 마무리합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (23, 8, '자유 일정과 휴식', '활동 사이 하루는 자유롭게 쉬며 근육을 풀 시간을 가집니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (23, 9, 'FC 바르셀로나 축구 심화 코스', '가이드와 함께 한 단계 높은 코스에 도전합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (23, 10, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (8, 13, 14, 1600000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (24, 1, '바르셀로나 도착', '인천에서 출발해 바르셀로나에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (24, 2, 'FC 바르셀로나 축구', '라 리가 최강 팀 캄프노우 경기장 경기. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (24, 3, '지중해 해변 스포츠 체험', '수상스키, 스쿠버, 카약 등. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (24, 4, 'FC 바르셀로나 축구', '라 리가 최강 팀 캄프노우 경기장 경기. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (24, 5, '근교 트레킹·야외 활동', '바르셀로나 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (24, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (24, 7, '체험 레슨', '현지 코치에게 짧은 레슨을 받고 미니 게임으로 마무리합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (24, 8, '자유 일정과 휴식', '활동 사이 하루는 자유롭게 쉬며 근육을 풀 시간을 가집니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (24, 9, 'FC 바르셀로나 축구 심화 코스', '가이드와 함께 한 단계 높은 코스에 도전합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (24, 10, '강변·해변 러닝과 요가', '아침 러닝이나 요가로 몸을 깨운 뒤 도시를 가볍게 둘러봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (24, 11, '현지 팀 팬 모임', '현지 팬들과 함께 응원 문화를 체험하고 기념품을 고릅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (24, 12, '물가 액티비티', '수상·해안 액티비티를 즐기고 온천이나 스파로 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (24, 13, '로컬 스포츠 클래스', '현지에서 사랑받는 전통 스포츠를 배우는 체험 수업입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (24, 14, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 7, NULL, 'FOOD_DRINK', '서울 미식·주류 투어: 한식 비스트로 투어 · 명동 거리음식', '종로·인사동 역사 한식당에서의 한식 체험. 떡볶이, 순대, 호떡 등 한국 길거리 음식.', '별빛 초콜릿공방', '한식 비스트로 투어 — 종로·인사동 역사 한식당에서의 한식 체험
명동 거리음식 — 떡볶이, 순대, 호떡 등 한국 길거리 음식
남대문 시장 — 전통 시장에서의 현지 음식 맛보기', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
일정에 표시된 식사와 시음', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 한식 비스트로 투어, 명동 거리음식, 남대문 시장 (상품·브랜드는 가상)', 'ON_SALE', 9);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (9, 2, 3, 270000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (25, 1, '서울 도착', '인천에서 출발해 서울에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (25, 2, '한식 비스트로 투어 탐방', '종로·인사동 역사 한식당에서의 한식 체험. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (25, 3, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (9, 3, 4, 330000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (26, 1, '서울 도착', '인천에서 출발해 서울에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (26, 2, '한식 비스트로 투어 탐방', '종로·인사동 역사 한식당에서의 한식 체험. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (26, 3, '별빛 초콜릿공방 견학과 시음', '별빛 초콜릿공방(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 명동 거리음식과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (26, 4, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (9, 6, 7, 520000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (27, 1, '서울 도착', '인천에서 출발해 서울에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (27, 2, '한식 비스트로 투어 탐방', '종로·인사동 역사 한식당에서의 한식 체험. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (27, 3, '별빛 초콜릿공방 견학과 시음', '별빛 초콜릿공방(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 명동 거리음식과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (27, 4, '남대문 시장 체험', '전통 시장에서의 현지 음식 맛보기. 직접 맛보고 고르는 시간을 가진 뒤 저녁은 현지 식당에서 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (27, 5, '쿠킹 클래스', '현지 셰프에게 서울의 대표 요리를 배우고 직접 만든 요리로 저녁을 먹습니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (27, 6, '근교 산지 미식 여행', '서울 근교의 산지로 이동해 제철 재료와 지역 음식을 맛보고 농장·공방을 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (27, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 8, NULL, 'FOOD_DRINK', '부산 미식·주류 투어: 자갈치 시장 활어회 · 해산물 요리', '신선한 활어회와 회 덮밥 전문점. 꼬막 한상, 조개구이 등 신선한 해산물.', '바람결 증류소', '자갈치 시장 활어회 — 신선한 활어회와 회 덮밥 전문점
해산물 요리 — 꼬막 한상, 조개구이 등 신선한 해산물
부산 국밥 — 부산 돼지국밥과 소머리국밥', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
일정에 표시된 식사와 시음', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 자갈치 시장 활어회, 해산물 요리, 부산 국밥 (상품·브랜드는 가상)', 'ON_SALE', 10);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (10, 2, 3, 280000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (28, 1, '부산 도착', '인천에서 출발해 부산에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (28, 2, '자갈치 시장 활어회 탐방', '신선한 활어회와 회 덮밥 전문점. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (28, 3, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (10, 3, 4, 350000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (29, 1, '부산 도착', '인천에서 출발해 부산에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (29, 2, '자갈치 시장 활어회 탐방', '신선한 활어회와 회 덮밥 전문점. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (29, 3, '바람결 증류소 견학과 시음', '바람결 증류소(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 해산물 요리과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (29, 4, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (10, 6, 7, 550000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (30, 1, '부산 도착', '인천에서 출발해 부산에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (30, 2, '자갈치 시장 활어회 탐방', '신선한 활어회와 회 덮밥 전문점. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (30, 3, '바람결 증류소 견학과 시음', '바람결 증류소(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 해산물 요리과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (30, 4, '부산 국밥 체험', '부산 돼지국밥과 소머리국밥. 직접 맛보고 고르는 시간을 가진 뒤 저녁은 현지 식당에서 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (30, 5, '쿠킹 클래스', '현지 셰프에게 부산의 대표 요리를 배우고 직접 만든 요리로 저녁을 먹습니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (30, 6, '근교 산지 미식 여행', '부산 근교의 산지로 이동해 제철 재료와 지역 음식을 맛보고 농장·공방을 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (30, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 9, NULL, 'FOOD_DRINK', '도쿄 미식·주류 투어: 츠키지 마켓 · 도쿄 라면 투어', '신선한 해산물 & 스시. 라면 명점 투어.', '새벽 커피로스터스', '츠키지 마켓 — 신선한 해산물 & 스시
도쿄 라면 투어 — 라면 명점 투어
아메요코 거리 — 다양한 일식 음식', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
일정에 표시된 식사와 시음', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 츠키지 마켓, 도쿄 라면 투어, 아메요코 거리 (상품·브랜드는 가상)', 'ON_SALE', 11);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (11, 2, 3, 290000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (31, 1, '도쿄 도착', '인천에서 출발해 도쿄에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (31, 2, '츠키지 마켓 탐방', '신선한 해산물 & 스시. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (31, 3, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (11, 3, 4, 360000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (32, 1, '도쿄 도착', '인천에서 출발해 도쿄에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (32, 2, '츠키지 마켓 탐방', '신선한 해산물 & 스시. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (32, 3, '새벽 커피로스터스 견학과 시음', '새벽 커피로스터스(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 도쿄 라면 투어과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (32, 4, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (11, 6, 7, 570000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (33, 1, '도쿄 도착', '인천에서 출발해 도쿄에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (33, 2, '츠키지 마켓 탐방', '신선한 해산물 & 스시. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (33, 3, '새벽 커피로스터스 견학과 시음', '새벽 커피로스터스(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 도쿄 라면 투어과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (33, 4, '아메요코 거리 체험', '다양한 일식 음식. 직접 맛보고 고르는 시간을 가진 뒤 저녁은 현지 식당에서 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (33, 5, '쿠킹 클래스', '현지 셰프에게 도쿄의 대표 요리를 배우고 직접 만든 요리로 저녁을 먹습니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (33, 6, '근교 산지 미식 여행', '도쿄 근교의 산지로 이동해 제철 재료와 지역 음식을 맛보고 농장·공방을 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (33, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 9, NULL, 'SPORTS_ACTIVITY', '도쿄 스포츠·액티비티 투어: 요미우리 자이언츠 · 스모 레슬링', '도쿄 돔 야구 경기. 코쿠기칸 아레나.', '바람개비 아웃도어', '요미우리 자이언츠 — 도쿄 돔 야구 경기
스모 레슬링 — 코쿠기칸 아레나
로잉 — 운하 카약', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
경기 관람 티켓 또는 액티비티 이용권·장비 대여', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 요미우리 자이언츠, 스모 레슬링, 로잉 (상품·브랜드는 가상)', 'ON_SALE', 12);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (12, 2, 3, 330000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (34, 1, '도쿄 도착', '인천에서 출발해 도쿄에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (34, 2, '요미우리 자이언츠', '도쿄 돔 야구 경기. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (34, 3, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (12, 3, 4, 410000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (35, 1, '도쿄 도착', '인천에서 출발해 도쿄에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (35, 2, '요미우리 자이언츠', '도쿄 돔 야구 경기. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (35, 3, '스모 레슬링 체험', '코쿠기칸 아레나. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (35, 4, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (12, 6, 7, 660000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (36, 1, '도쿄 도착', '인천에서 출발해 도쿄에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (36, 2, '요미우리 자이언츠', '도쿄 돔 야구 경기. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (36, 3, '스모 레슬링 체험', '코쿠기칸 아레나. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (36, 4, '로잉', '운하 카약. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (36, 5, '근교 트레킹·야외 활동', '도쿄 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (36, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (36, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 9, NULL, 'ART_REST', '도쿄 예술·휴식 투어: 도쿄 국립박물관 · 모리 미술관', '불교 조각품 & 검. 현대 미술 전시.', '유리잔 공방', '도쿄 국립박물관 — 불교 조각품 & 검
모리 미술관 — 현대 미술 전시
센소지 사찰 — 도쿄 최고 사찰', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
미술관·공연 입장권 또는 스파 이용권', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 도쿄 국립박물관, 모리 미술관, 센소지 사찰 (상품·브랜드는 가상)', 'ON_SALE', 13);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (13, 2, 3, 300000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (37, 1, '도쿄 도착', '인천에서 출발해 도쿄에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (37, 2, '도쿄 국립박물관', '불교 조각품 & 검. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (37, 3, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (13, 3, 4, 380000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (38, 1, '도쿄 도착', '인천에서 출발해 도쿄에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (38, 2, '도쿄 국립박물관', '불교 조각품 & 검. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (38, 3, '모리 미술관', '현대 미술 전시. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (38, 4, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (13, 6, 7, 600000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (39, 1, '도쿄 도착', '인천에서 출발해 도쿄에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (39, 2, '도쿄 국립박물관', '불교 조각품 & 검. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (39, 3, '모리 미술관', '현대 미술 전시. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (39, 4, '센소지 사찰', '도쿄 최고 사찰. 공연이나 전시 일정에 맞춰 관람 시간을 조정합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (39, 5, '공연·전시 관람', '도쿄에서 열리는 공연 또는 전시 중 일정에 맞는 한 편을 관람합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (39, 6, '스파·휴식의 날', '스파나 온천, 마사지 등 느린 휴식으로 여행의 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (39, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 10, NULL, 'FOOD_DRINK', '오사카 미식·주류 투어: 타코야키 · 오코노미야키', '오사카 대표 거리음식, 문어 튀김공. 철판에 구우 양배추 팬케이크.', '금빛밀 베이커리', '타코야키 — 오사카 대표 거리음식, 문어 튀김공
오코노미야키 — 철판에 구우 양배추 팬케이크
쿠시카츠 — 튀김 꼬치 오사카 전통 음식', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
일정에 표시된 식사와 시음', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 타코야키, 오코노미야키, 쿠시카츠 (상품·브랜드는 가상)', 'ON_SALE', 14);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (14, 2, 3, 300000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (40, 1, '오사카 도착', '인천에서 출발해 오사카에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (40, 2, '타코야키 탐방', '오사카 대표 거리음식, 문어 튀김공. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (40, 3, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (14, 3, 4, 370000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (41, 1, '오사카 도착', '인천에서 출발해 오사카에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (41, 2, '타코야키 탐방', '오사카 대표 거리음식, 문어 튀김공. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (41, 3, '금빛밀 베이커리 견학과 시음', '금빛밀 베이커리(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 오코노미야키과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (41, 4, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (14, 6, 7, 590000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (42, 1, '오사카 도착', '인천에서 출발해 오사카에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (42, 2, '타코야키 탐방', '오사카 대표 거리음식, 문어 튀김공. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (42, 3, '금빛밀 베이커리 견학과 시음', '금빛밀 베이커리(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 오코노미야키과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (42, 4, '쿠시카츠 체험', '튀김 꼬치 오사카 전통 음식. 직접 맛보고 고르는 시간을 가진 뒤 저녁은 현지 식당에서 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (42, 5, '쿠킹 클래스', '현지 셰프에게 오사카의 대표 요리를 배우고 직접 만든 요리로 저녁을 먹습니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (42, 6, '근교 산지 미식 여행', '오사카 근교의 산지로 이동해 제철 재료와 지역 음식을 맛보고 농장·공방을 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (42, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 11, NULL, 'FOOD_DRINK', '후쿠오카 미식·주류 투어: 하카타 라면 야타이 · 야키토리와 오뎅', '후쿠오카 야타이 거리의 돈코츠 라면. 야타이에서 즐기는 구이 음식들.', '구름 치즈공방', '하카타 라면 야타이 — 후쿠오카 야타이 거리의 돈코츠 라면
야키토리와 오뎅 — 야타이에서 즐기는 구이 음식들
명태알 계란말이 — 후쿠오카 특산 계란요리', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
일정에 표시된 식사와 시음', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 하카타 라면 야타이, 야키토리와 오뎅, 명태알 계란말이 (상품·브랜드는 가상)', 'ON_SALE', 15);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (15, 2, 3, 280000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (43, 1, '후쿠오카 도착', '인천에서 출발해 후쿠오카에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (43, 2, '하카타 라면 야타이 탐방', '후쿠오카 야타이 거리의 돈코츠 라면. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (43, 3, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (15, 3, 4, 350000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (44, 1, '후쿠오카 도착', '인천에서 출발해 후쿠오카에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (44, 2, '하카타 라면 야타이 탐방', '후쿠오카 야타이 거리의 돈코츠 라면. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (44, 3, '구름 치즈공방 견학과 시음', '구름 치즈공방(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 야키토리와 오뎅과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (44, 4, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (15, 6, 7, 550000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (45, 1, '후쿠오카 도착', '인천에서 출발해 후쿠오카에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (45, 2, '하카타 라면 야타이 탐방', '후쿠오카 야타이 거리의 돈코츠 라면. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (45, 3, '구름 치즈공방 견학과 시음', '구름 치즈공방(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 야키토리와 오뎅과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (45, 4, '명태알 계란말이 체험', '후쿠오카 특산 계란요리. 직접 맛보고 고르는 시간을 가진 뒤 저녁은 현지 식당에서 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (45, 5, '쿠킹 클래스', '현지 셰프에게 후쿠오카의 대표 요리를 배우고 직접 만든 요리로 저녁을 먹습니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (45, 6, '근교 산지 미식 여행', '후쿠오카 근교의 산지로 이동해 제철 재료와 지역 음식을 맛보고 농장·공방을 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (45, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 12, NULL, 'FOOD_DRINK', '삿포로 미식·주류 투어: 삿포로 미소 라면 · 스프 카레', '라면 발상지. 삿포로 대표 음식.', '구름 치즈공방', '삿포로 미소 라면 — 라면 발상지
스프 카레 — 삿포로 대표 음식
니조 마켓 — 신선한 해산물', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
일정에 표시된 식사와 시음', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 삿포로 미소 라면, 스프 카레, 니조 마켓 (상품·브랜드는 가상)', 'ON_SALE', 16);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (16, 2, 3, 290000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (46, 1, '삿포로 도착', '인천에서 출발해 삿포로에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (46, 2, '삿포로 미소 라면 탐방', '라면 발상지. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (46, 3, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (16, 3, 4, 360000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (47, 1, '삿포로 도착', '인천에서 출발해 삿포로에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (47, 2, '삿포로 미소 라면 탐방', '라면 발상지. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (47, 3, '구름 치즈공방 견학과 시음', '구름 치즈공방(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 스프 카레과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (47, 4, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (16, 6, 7, 580000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (48, 1, '삿포로 도착', '인천에서 출발해 삿포로에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (48, 2, '삿포로 미소 라면 탐방', '라면 발상지. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (48, 3, '구름 치즈공방 견학과 시음', '구름 치즈공방(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 스프 카레과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (48, 4, '니조 마켓 체험', '신선한 해산물. 직접 맛보고 고르는 시간을 가진 뒤 저녁은 현지 식당에서 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (48, 5, '쿠킹 클래스', '현지 셰프에게 삿포로의 대표 요리를 배우고 직접 만든 요리로 저녁을 먹습니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (48, 6, '근교 산지 미식 여행', '삿포로 근교의 산지로 이동해 제철 재료와 지역 음식을 맛보고 농장·공방을 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (48, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 12, NULL, 'SPORTS_ACTIVITY', '삿포로 스포츠·액티비티 투어: 스키 · 하이킹', '니세코 스키장. 여름 산악 활동.', '산들 트레킹', '스키 — 니세코 스키장
하이킹 — 여름 산악 활동
크로스컨트리 스키 — 겨울 스포츠', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
경기 관람 티켓 또는 액티비티 이용권·장비 대여', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 스키, 하이킹, 크로스컨트리 스키 (상품·브랜드는 가상)', 'ON_SALE', 17);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (17, 2, 3, 340000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (49, 1, '삿포로 도착', '인천에서 출발해 삿포로에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (49, 2, '스키', '니세코 스키장. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (49, 3, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (17, 3, 4, 420000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (50, 1, '삿포로 도착', '인천에서 출발해 삿포로에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (50, 2, '스키', '니세코 스키장. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (50, 3, '하이킹 체험', '여름 산악 활동. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (50, 4, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (17, 6, 7, 660000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (51, 1, '삿포로 도착', '인천에서 출발해 삿포로에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (51, 2, '스키', '니세코 스키장. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (51, 3, '하이킹 체험', '여름 산악 활동. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (51, 4, '크로스컨트리 스키', '겨울 스포츠. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (51, 5, '근교 트레킹·야외 활동', '삿포로 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (51, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (51, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 12, NULL, 'ART_REST', '삿포로 예술·휴식 투어: 삿포로 미술관 · 삿포로 아트파크', '현대 미술. 야외 미술 복합시설.', NULL, '삿포로 미술관 — 현대 미술
삿포로 아트파크 — 야외 미술 복합시설
삿포로 맥주 박물관 — 문화 체험', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
미술관·공연 입장권 또는 스파 이용권', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 삿포로 미술관, 삿포로 아트파크, 삿포로 맥주 박물관 (상품·브랜드는 가상)', 'ON_SALE', 18);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (18, 2, 3, 310000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (52, 1, '삿포로 도착', '인천에서 출발해 삿포로에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (52, 2, '삿포로 미술관', '현대 미술. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (52, 3, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (18, 3, 4, 380000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (53, 1, '삿포로 도착', '인천에서 출발해 삿포로에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (53, 2, '삿포로 미술관', '현대 미술. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (53, 3, '삿포로 아트파크', '야외 미술 복합시설. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (53, 4, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (18, 6, 7, 600000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (54, 1, '삿포로 도착', '인천에서 출발해 삿포로에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (54, 2, '삿포로 미술관', '현대 미술. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (54, 3, '삿포로 아트파크', '야외 미술 복합시설. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (54, 4, '삿포로 맥주 박물관', '문화 체험. 공연이나 전시 일정에 맞춰 관람 시간을 조정합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (54, 5, '공연·전시 관람', '삿포로에서 열리는 공연 또는 전시 중 일정에 맞는 한 편을 관람합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (54, 6, '스파·휴식의 날', '스파나 온천, 마사지 등 느린 휴식으로 여행의 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (54, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 13, NULL, 'ART_REST', '베이징 예술·휴식 투어: 자금성 · 만리장성 트레킹', '명·청 황제 거주 궁전, 세계유산. 중국 위대한 방어벽 트레킹.', '달무리 공연장', '자금성 — 명·청 황제 거주 궁전, 세계유산
만리장성 트레킹 — 중국 위대한 방어벽 트레킹
중국국가박물관 — 중국 역사와 문화 종합 박물관', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
미술관·공연 입장권 또는 스파 이용권', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 자금성, 만리장성 트레킹, 중국국가박물관 (상품·브랜드는 가상)', 'ON_SALE', 19);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (19, 2, 3, 280000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (55, 1, '베이징 도착', '인천에서 출발해 베이징에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (55, 2, '자금성', '명·청 황제 거주 궁전, 세계유산. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (55, 3, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (19, 3, 4, 350000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (56, 1, '베이징 도착', '인천에서 출발해 베이징에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (56, 2, '자금성', '명·청 황제 거주 궁전, 세계유산. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (56, 3, '만리장성 트레킹', '중국 위대한 방어벽 트레킹. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (56, 4, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (19, 6, 7, 560000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (57, 1, '베이징 도착', '인천에서 출발해 베이징에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (57, 2, '자금성', '명·청 황제 거주 궁전, 세계유산. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (57, 3, '만리장성 트레킹', '중국 위대한 방어벽 트레킹. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (57, 4, '중국국가박물관', '중국 역사와 문화 종합 박물관. 공연이나 전시 일정에 맞춰 관람 시간을 조정합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (57, 5, '공연·전시 관람', '베이징에서 열리는 공연 또는 전시 중 일정에 맞는 한 편을 관람합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (57, 6, '스파·휴식의 날', '스파나 온천, 마사지 등 느린 휴식으로 여행의 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (57, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 14, NULL, 'ART_REST', '방콕 예술·휴식 투어: 왕궁과 에메랄드 부처 · 왓 포 사원', '태국 왕실 거주지와 성스러운 불상. 대형 금불상과 태국 마사지 센터.', NULL, '왕궁과 에메랄드 부처 — 태국 왕실 거주지와 성스러운 불상
왓 포 사원 — 대형 금불상과 태국 마사지 센터
고대 도시 무앙 보란 — 태국 전통 건축과 문화유산', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
미술관·공연 입장권 또는 스파 이용권', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 왕궁과 에메랄드 부처, 왓 포 사원, 고대 도시 무앙 보란 (상품·브랜드는 가상)', 'ON_SALE', 20);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (20, 2, 3, 300000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (58, 1, '방콕 도착', '인천에서 출발해 방콕에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (58, 2, '왕궁과 에메랄드 부처', '태국 왕실 거주지와 성스러운 불상. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (58, 3, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (20, 3, 4, 370000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (59, 1, '방콕 도착', '인천에서 출발해 방콕에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (59, 2, '왕궁과 에메랄드 부처', '태국 왕실 거주지와 성스러운 불상. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (59, 3, '왓 포 사원', '대형 금불상과 태국 마사지 센터. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (59, 4, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (20, 6, 7, 580000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (60, 1, '방콕 도착', '인천에서 출발해 방콕에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (60, 2, '왕궁과 에메랄드 부처', '태국 왕실 거주지와 성스러운 불상. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (60, 3, '왓 포 사원', '대형 금불상과 태국 마사지 센터. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (60, 4, '고대 도시 무앙 보란', '태국 전통 건축과 문화유산. 공연이나 전시 일정에 맞춰 관람 시간을 조정합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (60, 5, '공연·전시 관람', '방콕에서 열리는 공연 또는 전시 중 일정에 맞는 한 편을 관람합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (60, 6, '스파·휴식의 날', '스파나 온천, 마사지 등 느린 휴식으로 여행의 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (60, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 16, NULL, 'SPORTS_ACTIVITY', '뉴욕 스포츠·액티비티 투어: 뉴욕 양키스 야구 · 뉴욕 닉스 농구', '미국 프로야구 명문팀 경기 관람. NBA 경기 매디슨 스퀘어 가든.', '산들 트레킹', '뉴욕 양키스 야구 — 미국 프로야구 명문팀 경기 관람
뉴욕 닉스 농구 — NBA 경기 매디슨 스퀘어 가든
미식축구 경기 — NFL 슈퍼볼 등 미식축구 관람', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
경기 관람 티켓 또는 액티비티 이용권·장비 대여', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 뉴욕 양키스 야구, 뉴욕 닉스 농구, 미식축구 경기 (상품·브랜드는 가상)', 'ON_SALE', 21);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (21, 6, 7, 890000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (61, 1, '뉴욕 도착', '인천에서 출발해 뉴욕에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (61, 2, '뉴욕 양키스 야구', '미국 프로야구 명문팀 경기 관람. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (61, 3, '뉴욕 닉스 농구 체험', 'NBA 경기 매디슨 스퀘어 가든. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (61, 4, '미식축구 경기', 'NFL 슈퍼볼 등 미식축구 관람. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (61, 5, '근교 트레킹·야외 활동', '뉴욕 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (61, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (61, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (21, 9, 10, 1260000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (62, 1, '뉴욕 도착', '인천에서 출발해 뉴욕에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (62, 2, '뉴욕 양키스 야구', '미국 프로야구 명문팀 경기 관람. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (62, 3, '뉴욕 닉스 농구 체험', 'NBA 경기 매디슨 스퀘어 가든. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (62, 4, '미식축구 경기', 'NFL 슈퍼볼 등 미식축구 관람. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (62, 5, '근교 트레킹·야외 활동', '뉴욕 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (62, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (62, 7, '체험 레슨', '현지 코치에게 짧은 레슨을 받고 미니 게임으로 마무리합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (62, 8, '자유 일정과 휴식', '활동 사이 하루는 자유롭게 쉬며 근육을 풀 시간을 가집니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (62, 9, '뉴욕 양키스 야구 심화 코스', '가이드와 함께 한 단계 높은 코스에 도전합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (62, 10, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (21, 13, 14, 1740000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (63, 1, '뉴욕 도착', '인천에서 출발해 뉴욕에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (63, 2, '뉴욕 양키스 야구', '미국 프로야구 명문팀 경기 관람. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (63, 3, '뉴욕 닉스 농구 체험', 'NBA 경기 매디슨 스퀘어 가든. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (63, 4, '미식축구 경기', 'NFL 슈퍼볼 등 미식축구 관람. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (63, 5, '근교 트레킹·야외 활동', '뉴욕 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (63, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (63, 7, '체험 레슨', '현지 코치에게 짧은 레슨을 받고 미니 게임으로 마무리합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (63, 8, '자유 일정과 휴식', '활동 사이 하루는 자유롭게 쉬며 근육을 풀 시간을 가집니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (63, 9, '뉴욕 양키스 야구 심화 코스', '가이드와 함께 한 단계 높은 코스에 도전합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (63, 10, '강변·해변 러닝과 요가', '아침 러닝이나 요가로 몸을 깨운 뒤 도시를 가볍게 둘러봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (63, 11, '현지 팀 팬 모임', '현지 팬들과 함께 응원 문화를 체험하고 기념품을 고릅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (63, 12, '물가 액티비티', '수상·해안 액티비티를 즐기고 온천이나 스파로 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (63, 13, '로컬 스포츠 클래스', '현지에서 사랑받는 전통 스포츠를 배우는 체험 수업입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (63, 14, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 17, NULL, 'ART_REST', '워싱턴D.C. 예술·휴식 투어: 스미소니언 박물관 단지 · 국립 항공우주 박물관', '세계 유명 박물관, 대다수 무료. 세계 최고 항공우주 박물관.', NULL, '스미소니언 박물관 단지 — 세계 유명 박물관, 대다수 무료
국립 항공우주 박물관 — 세계 최고 항공우주 박물관
국제 스파이 박물관 — 제임스본드 차량 전시 포함', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
미술관·공연 입장권 또는 스파 이용권', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 스미소니언 박물관 단지, 국립 항공우주 박물관, 국제 스파이 박물관 (상품·브랜드는 가상)', 'ON_SALE', 22);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (22, 6, 7, 800000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (64, 1, '워싱턴D.C. 도착', '인천에서 출발해 워싱턴D.C.에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (64, 2, '스미소니언 박물관 단지', '세계 유명 박물관, 대다수 무료. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (64, 3, '국립 항공우주 박물관', '세계 최고 항공우주 박물관. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (64, 4, '국제 스파이 박물관', '제임스본드 차량 전시 포함. 공연이나 전시 일정에 맞춰 관람 시간을 조정합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (64, 5, '공연·전시 관람', '워싱턴D.C.에서 열리는 공연 또는 전시 중 일정에 맞는 한 편을 관람합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (64, 6, '스파·휴식의 날', '스파나 온천, 마사지 등 느린 휴식으로 여행의 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (64, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (22, 9, 10, 1130000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (65, 1, '워싱턴D.C. 도착', '인천에서 출발해 워싱턴D.C.에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (65, 2, '스미소니언 박물관 단지', '세계 유명 박물관, 대다수 무료. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (65, 3, '국립 항공우주 박물관', '세계 최고 항공우주 박물관. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (65, 4, '국제 스파이 박물관', '제임스본드 차량 전시 포함. 공연이나 전시 일정에 맞춰 관람 시간을 조정합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (65, 5, '공연·전시 관람', '워싱턴D.C.에서 열리는 공연 또는 전시 중 일정에 맞는 한 편을 관람합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (65, 6, '스파·휴식의 날', '스파나 온천, 마사지 등 느린 휴식으로 여행의 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (65, 7, '근교 소도시 산책', '워싱턴D.C. 근교의 작은 마을을 산책하며 갤러리와 공방을 둘러봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (65, 8, '전통 체험 클래스', '현지 공예 또는 전통 문화 체험 수업에 참여해 작품을 만듭니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (65, 9, '자유 일정', '하루는 자유롭게 보냅니다. 가이드가 추천 산책로와 전시 정보를 드립니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (65, 10, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (22, 13, 14, 1560000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (66, 1, '워싱턴D.C. 도착', '인천에서 출발해 워싱턴D.C.에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (66, 2, '스미소니언 박물관 단지', '세계 유명 박물관, 대다수 무료. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (66, 3, '국립 항공우주 박물관', '세계 최고 항공우주 박물관. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (66, 4, '국제 스파이 박물관', '제임스본드 차량 전시 포함. 공연이나 전시 일정에 맞춰 관람 시간을 조정합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (66, 5, '공연·전시 관람', '워싱턴D.C.에서 열리는 공연 또는 전시 중 일정에 맞는 한 편을 관람합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (66, 6, '스파·휴식의 날', '스파나 온천, 마사지 등 느린 휴식으로 여행의 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (66, 7, '근교 소도시 산책', '워싱턴D.C. 근교의 작은 마을을 산책하며 갤러리와 공방을 둘러봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (66, 8, '전통 체험 클래스', '현지 공예 또는 전통 문화 체험 수업에 참여해 작품을 만듭니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (66, 9, '자유 일정', '하루는 자유롭게 보냅니다. 가이드가 추천 산책로와 전시 정보를 드립니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (66, 10, '정원·공원 힐링 산책', '도심 공원과 정원을 걸으며 사색하는 시간을 가집니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (66, 11, '야경과 재즈·클래식의 밤', '저녁에는 야경 명소를 보고 가벼운 공연을 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (66, 12, '미술관 한 곳 더', '스미소니언 박물관 단지 외에 가이드가 고른 작은 미술관을 한 곳 더 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (66, 13, '티타임과 독서의 오후', '현지 찻집에서 천천히 차를 마시며 하루를 정리합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (66, 14, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 18, NULL, 'FOOD_DRINK', '로스앤젤레스 미식·주류 투어: 차이나타운 & 리틀 도쿄 · 멕시칸 푸드 투어', '아시아 음식. 가장 인기 있는 현지 음식.', '별빛 초콜릿공방', '차이나타운 & 리틀 도쿄 — 아시아 음식
멕시칸 푸드 투어 — 가장 인기 있는 현지 음식
비건 푸드 — 로스앤젤레스 비건 문화', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
일정에 표시된 식사와 시음', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 차이나타운 & 리틀 도쿄, 멕시칸 푸드 투어, 비건 푸드 (상품·브랜드는 가상)', 'ON_SALE', 23);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (23, 6, 7, 830000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (67, 1, '로스앤젤레스 도착', '인천에서 출발해 로스앤젤레스에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (67, 2, '차이나타운 & 리틀 도쿄 탐방', '아시아 음식. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (67, 3, '별빛 초콜릿공방 견학과 시음', '별빛 초콜릿공방(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 멕시칸 푸드 투어과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (67, 4, '비건 푸드 체험', '로스앤젤레스 비건 문화. 직접 맛보고 고르는 시간을 가진 뒤 저녁은 현지 식당에서 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (67, 5, '쿠킹 클래스', '현지 셰프에게 로스앤젤레스의 대표 요리를 배우고 직접 만든 요리로 저녁을 먹습니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (67, 6, '근교 산지 미식 여행', '로스앤젤레스 근교의 산지로 이동해 제철 재료와 지역 음식을 맛보고 농장·공방을 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (67, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (23, 9, 10, 1160000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (68, 1, '로스앤젤레스 도착', '인천에서 출발해 로스앤젤레스에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (68, 2, '차이나타운 & 리틀 도쿄 탐방', '아시아 음식. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (68, 3, '별빛 초콜릿공방 견학과 시음', '별빛 초콜릿공방(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 멕시칸 푸드 투어과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (68, 4, '비건 푸드 체험', '로스앤젤레스 비건 문화. 직접 맛보고 고르는 시간을 가진 뒤 저녁은 현지 식당에서 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (68, 5, '쿠킹 클래스', '현지 셰프에게 로스앤젤레스의 대표 요리를 배우고 직접 만든 요리로 저녁을 먹습니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (68, 6, '근교 산지 미식 여행', '로스앤젤레스 근교의 산지로 이동해 제철 재료와 지역 음식을 맛보고 농장·공방을 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (68, 7, '멕시칸 푸드 투어 깊이 보기', '가장 인기 있는 현지 음식. 전문 가이드의 설명과 함께 두 번째 코스를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (68, 8, '시장 쇼핑과 자유 시간', '현지 시장과 상점가에서 기념품과 식재료를 둘러보고 자유 시간을 보냅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (68, 9, '로컬 맛집 릴레이', '가이드가 고른 현지 단골 식당 세 곳을 이어서 맛보는 미식 산책입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (68, 10, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (23, 13, 14, 1610000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (69, 1, '로스앤젤레스 도착', '인천에서 출발해 로스앤젤레스에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (69, 2, '차이나타운 & 리틀 도쿄 탐방', '아시아 음식. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (69, 3, '별빛 초콜릿공방 견학과 시음', '별빛 초콜릿공방(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 멕시칸 푸드 투어과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (69, 4, '비건 푸드 체험', '로스앤젤레스 비건 문화. 직접 맛보고 고르는 시간을 가진 뒤 저녁은 현지 식당에서 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (69, 5, '쿠킹 클래스', '현지 셰프에게 로스앤젤레스의 대표 요리를 배우고 직접 만든 요리로 저녁을 먹습니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (69, 6, '근교 산지 미식 여행', '로스앤젤레스 근교의 산지로 이동해 제철 재료와 지역 음식을 맛보고 농장·공방을 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (69, 7, '멕시칸 푸드 투어 깊이 보기', '가장 인기 있는 현지 음식. 전문 가이드의 설명과 함께 두 번째 코스를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (69, 8, '시장 쇼핑과 자유 시간', '현지 시장과 상점가에서 기념품과 식재료를 둘러보고 자유 시간을 보냅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (69, 9, '로컬 맛집 릴레이', '가이드가 고른 현지 단골 식당 세 곳을 이어서 맛보는 미식 산책입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (69, 10, '디저트·카페 투어', '로스앤젤레스의 유명 디저트와 카페를 돌며 여유로운 오후를 보냅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (69, 11, '현지 가정식 초대', '현지 가정집 식탁에서 가정식을 함께 먹으며 이야기를 나눕니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (69, 12, '자유 일정', '하루는 자유롭게 보냅니다. 가이드가 추천 맛집 지도를 드립니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (69, 13, '야시장·야경 산책', '저녁 시장과 야경 명소를 걸으며 길거리 음식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (69, 14, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 18, NULL, 'SPORTS_ACTIVITY', '로스앤젤레스 스포츠·액티비티 투어: 라스 에인절스 다저스 · 라스 에인절스 레이커스', '아이콘 야구 경기장. 농구 경기 관람.', '산들 트레킹', '라스 에인절스 다저스 — 아이콘 야구 경기장
라스 에인절스 레이커스 — 농구 경기 관람
비치 스포츠 — 해변 서핑 & 배구', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
경기 관람 티켓 또는 액티비티 이용권·장비 대여', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 라스 에인절스 다저스, 라스 에인절스 레이커스, 비치 스포츠 (상품·브랜드는 가상)', 'ON_SALE', 24);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (24, 6, 7, 950000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (70, 1, '로스앤젤레스 도착', '인천에서 출발해 로스앤젤레스에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (70, 2, '라스 에인절스 다저스', '아이콘 야구 경기장. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (70, 3, '라스 에인절스 레이커스 체험', '농구 경기 관람. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (70, 4, '비치 스포츠', '해변 서핑 & 배구. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (70, 5, '근교 트레킹·야외 활동', '로스앤젤레스 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (70, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (70, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (24, 9, 10, 1340000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (71, 1, '로스앤젤레스 도착', '인천에서 출발해 로스앤젤레스에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (71, 2, '라스 에인절스 다저스', '아이콘 야구 경기장. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (71, 3, '라스 에인절스 레이커스 체험', '농구 경기 관람. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (71, 4, '비치 스포츠', '해변 서핑 & 배구. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (71, 5, '근교 트레킹·야외 활동', '로스앤젤레스 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (71, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (71, 7, '체험 레슨', '현지 코치에게 짧은 레슨을 받고 미니 게임으로 마무리합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (71, 8, '자유 일정과 휴식', '활동 사이 하루는 자유롭게 쉬며 근육을 풀 시간을 가집니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (71, 9, '라스 에인절스 다저스 심화 코스', '가이드와 함께 한 단계 높은 코스에 도전합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (71, 10, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (24, 13, 14, 1850000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (72, 1, '로스앤젤레스 도착', '인천에서 출발해 로스앤젤레스에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (72, 2, '라스 에인절스 다저스', '아이콘 야구 경기장. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (72, 3, '라스 에인절스 레이커스 체험', '농구 경기 관람. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (72, 4, '비치 스포츠', '해변 서핑 & 배구. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (72, 5, '근교 트레킹·야외 활동', '로스앤젤레스 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (72, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (72, 7, '체험 레슨', '현지 코치에게 짧은 레슨을 받고 미니 게임으로 마무리합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (72, 8, '자유 일정과 휴식', '활동 사이 하루는 자유롭게 쉬며 근육을 풀 시간을 가집니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (72, 9, '라스 에인절스 다저스 심화 코스', '가이드와 함께 한 단계 높은 코스에 도전합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (72, 10, '강변·해변 러닝과 요가', '아침 러닝이나 요가로 몸을 깨운 뒤 도시를 가볍게 둘러봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (72, 11, '현지 팀 팬 모임', '현지 팬들과 함께 응원 문화를 체험하고 기념품을 고릅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (72, 12, '물가 액티비티', '수상·해안 액티비티를 즐기고 온천이나 스파로 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (72, 13, '로컬 스포츠 클래스', '현지에서 사랑받는 전통 스포츠를 배우는 체험 수업입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (72, 14, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 18, NULL, 'ART_REST', '로스앤젤레스 예술·휴식 투어: 라카마 · 게티 센터', '미국 서부 최대 박물관. 중세부터 현대 미술.', NULL, '라카마 — 미국 서부 최대 박물관
게티 센터 — 중세부터 현대 미술
더 브로드 — 현대 미술관 (쿠사마)', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
미술관·공연 입장권 또는 스파 이용권', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 라카마, 게티 센터, 더 브로드 (상품·브랜드는 가상)', 'ON_SALE', 25);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (25, 6, 7, 870000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (73, 1, '로스앤젤레스 도착', '인천에서 출발해 로스앤젤레스에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (73, 2, '라카마', '미국 서부 최대 박물관. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (73, 3, '게티 센터', '중세부터 현대 미술. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (73, 4, '더 브로드', '현대 미술관 (쿠사마). 공연이나 전시 일정에 맞춰 관람 시간을 조정합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (73, 5, '공연·전시 관람', '로스앤젤레스에서 열리는 공연 또는 전시 중 일정에 맞는 한 편을 관람합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (73, 6, '스파·휴식의 날', '스파나 온천, 마사지 등 느린 휴식으로 여행의 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (73, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (25, 9, 10, 1220000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (74, 1, '로스앤젤레스 도착', '인천에서 출발해 로스앤젤레스에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (74, 2, '라카마', '미국 서부 최대 박물관. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (74, 3, '게티 센터', '중세부터 현대 미술. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (74, 4, '더 브로드', '현대 미술관 (쿠사마). 공연이나 전시 일정에 맞춰 관람 시간을 조정합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (74, 5, '공연·전시 관람', '로스앤젤레스에서 열리는 공연 또는 전시 중 일정에 맞는 한 편을 관람합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (74, 6, '스파·휴식의 날', '스파나 온천, 마사지 등 느린 휴식으로 여행의 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (74, 7, '근교 소도시 산책', '로스앤젤레스 근교의 작은 마을을 산책하며 갤러리와 공방을 둘러봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (74, 8, '전통 체험 클래스', '현지 공예 또는 전통 문화 체험 수업에 참여해 작품을 만듭니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (74, 9, '자유 일정', '하루는 자유롭게 보냅니다. 가이드가 추천 산책로와 전시 정보를 드립니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (74, 10, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (25, 13, 14, 1690000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (75, 1, '로스앤젤레스 도착', '인천에서 출발해 로스앤젤레스에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (75, 2, '라카마', '미국 서부 최대 박물관. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (75, 3, '게티 센터', '중세부터 현대 미술. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (75, 4, '더 브로드', '현대 미술관 (쿠사마). 공연이나 전시 일정에 맞춰 관람 시간을 조정합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (75, 5, '공연·전시 관람', '로스앤젤레스에서 열리는 공연 또는 전시 중 일정에 맞는 한 편을 관람합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (75, 6, '스파·휴식의 날', '스파나 온천, 마사지 등 느린 휴식으로 여행의 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (75, 7, '근교 소도시 산책', '로스앤젤레스 근교의 작은 마을을 산책하며 갤러리와 공방을 둘러봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (75, 8, '전통 체험 클래스', '현지 공예 또는 전통 문화 체험 수업에 참여해 작품을 만듭니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (75, 9, '자유 일정', '하루는 자유롭게 보냅니다. 가이드가 추천 산책로와 전시 정보를 드립니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (75, 10, '정원·공원 힐링 산책', '도심 공원과 정원을 걸으며 사색하는 시간을 가집니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (75, 11, '야경과 재즈·클래식의 밤', '저녁에는 야경 명소를 보고 가벼운 공연을 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (75, 12, '미술관 한 곳 더', '라카마 외에 가이드가 고른 작은 미술관을 한 곳 더 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (75, 13, '티타임과 독서의 오후', '현지 찻집에서 천천히 차를 마시며 하루를 정리합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (75, 14, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 19, NULL, 'FOOD_DRINK', '홍콩 미식·주류 투어: 딤섬 · 쌀국수', '하가우, 시우마이 등 다양한 만두류와 차슈바오. 돼지고기와 함께 끓인 담백한 육수 국수.', '소금꽃 식초공방', '딤섬 — 하가우, 시우마이 등 다양한 만두류와 차슈바오
쌀국수 — 돼지고기와 함께 끓인 담백한 육수 국수
템플스트리트 야시장 — 카레 생선공, 계란와플 등 길거리 음식', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
일정에 표시된 식사와 시음', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 딤섬, 쌀국수, 템플스트리트 야시장 (상품·브랜드는 가상)', 'ON_SALE', 26);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (26, 2, 3, 310000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (76, 1, '홍콩 도착', '인천에서 출발해 홍콩에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (76, 2, '딤섬 탐방', '하가우, 시우마이 등 다양한 만두류와 차슈바오. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (76, 3, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (26, 3, 4, 390000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (77, 1, '홍콩 도착', '인천에서 출발해 홍콩에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (77, 2, '딤섬 탐방', '하가우, 시우마이 등 다양한 만두류와 차슈바오. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (77, 3, '소금꽃 식초공방 견학과 시음', '소금꽃 식초공방(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 쌀국수과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (77, 4, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (26, 6, 7, 620000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (78, 1, '홍콩 도착', '인천에서 출발해 홍콩에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (78, 2, '딤섬 탐방', '하가우, 시우마이 등 다양한 만두류와 차슈바오. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (78, 3, '소금꽃 식초공방 견학과 시음', '소금꽃 식초공방(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 쌀국수과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (78, 4, '템플스트리트 야시장 체험', '카레 생선공, 계란와플 등 길거리 음식. 직접 맛보고 고르는 시간을 가진 뒤 저녁은 현지 식당에서 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (78, 5, '쿠킹 클래스', '현지 셰프에게 홍콩의 대표 요리를 배우고 직접 만든 요리로 저녁을 먹습니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (78, 6, '근교 산지 미식 여행', '홍콩 근교의 산지로 이동해 제철 재료와 지역 음식을 맛보고 농장·공방을 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (78, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 19, NULL, 'SPORTS_ACTIVITY', '홍콩 스포츠·액티비티 투어: 스타페리 · 오션파크 & 워터월드', '1888년부터 운영한 빅토리아 하버 여객선 체험. 대형 테마파크에서 해양생물 관찰 및 놀이기구.', NULL, '스타페리 — 1888년부터 운영한 빅토리아 하버 여객선 체험
오션파크 & 워터월드 — 대형 테마파크에서 해양생물 관찰 및 놀이기구
빅토리아 피크 트램 — 산 정상까지 올라가는 전통 케이블카 체험', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
경기 관람 티켓 또는 액티비티 이용권·장비 대여', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 스타페리, 오션파크 & 워터월드, 빅토리아 피크 트램 (상품·브랜드는 가상)', 'ON_SALE', 27);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (27, 2, 3, 360000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (79, 1, '홍콩 도착', '인천에서 출발해 홍콩에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (79, 2, '스타페리', '1888년부터 운영한 빅토리아 하버 여객선 체험. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (79, 3, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (27, 3, 4, 450000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (80, 1, '홍콩 도착', '인천에서 출발해 홍콩에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (80, 2, '스타페리', '1888년부터 운영한 빅토리아 하버 여객선 체험. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (80, 3, '오션파크 & 워터월드 체험', '대형 테마파크에서 해양생물 관찰 및 놀이기구. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (80, 4, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (27, 6, 7, 710000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (81, 1, '홍콩 도착', '인천에서 출발해 홍콩에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (81, 2, '스타페리', '1888년부터 운영한 빅토리아 하버 여객선 체험. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (81, 3, '오션파크 & 워터월드 체험', '대형 테마파크에서 해양생물 관찰 및 놀이기구. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (81, 4, '빅토리아 피크 트램', '산 정상까지 올라가는 전통 케이블카 체험. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (81, 5, '근교 트레킹·야외 활동', '홍콩 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (81, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (81, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 19, NULL, 'ART_REST', '홍콩 예술·휴식 투어: Tsz Shan Monastery · M+ 뮤지움', '현대식 불교사찰 건축미와 영적 체험. 서쪽항 현대미술관, 아시아 현대미술 중심.', NULL, 'Tsz Shan Monastery — 현대식 불교사찰 건축미와 영적 체험
M+ 뮤지움 — 서쪽항 현대미술관, 아시아 현대미술 중심
스타페리 야경 감상 — 고급 라운지에서 보는 야경과 해상 뷰', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
미술관·공연 입장권 또는 스파 이용권', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: Tsz Shan Monastery, M+ 뮤지움, 스타페리 야경 감상 (상품·브랜드는 가상)', 'ON_SALE', 28);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (28, 2, 3, 330000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (82, 1, '홍콩 도착', '인천에서 출발해 홍콩에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (82, 2, 'Tsz Shan Monastery', '현대식 불교사찰 건축미와 영적 체험. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (82, 3, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (28, 3, 4, 410000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (83, 1, '홍콩 도착', '인천에서 출발해 홍콩에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (83, 2, 'Tsz Shan Monastery', '현대식 불교사찰 건축미와 영적 체험. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (83, 3, 'M+ 뮤지움', '서쪽항 현대미술관, 아시아 현대미술 중심. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (83, 4, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (28, 6, 7, 650000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (84, 1, '홍콩 도착', '인천에서 출발해 홍콩에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (84, 2, 'Tsz Shan Monastery', '현대식 불교사찰 건축미와 영적 체험. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (84, 3, 'M+ 뮤지움', '서쪽항 현대미술관, 아시아 현대미술 중심. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (84, 4, '스타페리 야경 감상', '고급 라운지에서 보는 야경과 해상 뷰. 공연이나 전시 일정에 맞춰 관람 시간을 조정합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (84, 5, '공연·전시 관람', '홍콩에서 열리는 공연 또는 전시 중 일정에 맞는 한 편을 관람합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (84, 6, '스파·휴식의 날', '스파나 온천, 마사지 등 느린 휴식으로 여행의 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (84, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 20, NULL, 'ART_REST', '상하이 예술·휴식 투어: 상하이 타워 관측대 · 천즈팡 거리', '632m 높이, 유리 바닥 전망대. 문화와 음식 체험 거리.', NULL, '상하이 타워 관측대 — 632m 높이, 유리 바닥 전망대
천즈팡 거리 — 문화와 음식 체험 거리
상하이 디즈니랜드 — 현대 테마파크 체험', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
미술관·공연 입장권 또는 스파 이용권', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 상하이 타워 관측대, 천즈팡 거리, 상하이 디즈니랜드 (상품·브랜드는 가상)', 'ON_SALE', 29);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (29, 2, 3, 300000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (85, 1, '상하이 도착', '인천에서 출발해 상하이에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (85, 2, '상하이 타워 관측대', '632m 높이, 유리 바닥 전망대. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (85, 3, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (29, 3, 4, 370000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (86, 1, '상하이 도착', '인천에서 출발해 상하이에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (86, 2, '상하이 타워 관측대', '632m 높이, 유리 바닥 전망대. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (86, 3, '천즈팡 거리', '문화와 음식 체험 거리. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (86, 4, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (29, 6, 7, 590000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (87, 1, '상하이 도착', '인천에서 출발해 상하이에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (87, 2, '상하이 타워 관측대', '632m 높이, 유리 바닥 전망대. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (87, 3, '천즈팡 거리', '문화와 음식 체험 거리. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (87, 4, '상하이 디즈니랜드', '현대 테마파크 체험. 공연이나 전시 일정에 맞춰 관람 시간을 조정합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (87, 5, '공연·전시 관람', '상하이에서 열리는 공연 또는 전시 중 일정에 맞는 한 편을 관람합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (87, 6, '스파·휴식의 날', '스파나 온천, 마사지 등 느린 휴식으로 여행의 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (87, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 21, NULL, 'SPORTS_ACTIVITY', '두바이 스포츠·액티비티 투어: 사막 사파리 · 에미레이트 스키장', '사막 액티비티 최고 체험. 실내 스키장, 쇼핑몰 내 위치.', NULL, '사막 사파리 — 사막 액티비티 최고 체험
에미레이트 스키장 — 실내 스키장, 쇼핑몰 내 위치
두바이 스포츠 시티 — 5000만 평방피트 복합 스포츠 시설', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
경기 관람 티켓 또는 액티비티 이용권·장비 대여', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 사막 사파리, 에미레이트 스키장, 두바이 스포츠 시티 (상품·브랜드는 가상)', 'ON_SALE', 30);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (30, 6, 7, 820000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (88, 1, '두바이 도착', '인천에서 출발해 두바이에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (88, 2, '사막 사파리', '사막 액티비티 최고 체험. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (88, 3, '에미레이트 스키장 체험', '실내 스키장, 쇼핑몰 내 위치. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (88, 4, '두바이 스포츠 시티', '5000만 평방피트 복합 스포츠 시설. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (88, 5, '근교 트레킹·야외 활동', '두바이 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (88, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (88, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (30, 9, 10, 1140000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (89, 1, '두바이 도착', '인천에서 출발해 두바이에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (89, 2, '사막 사파리', '사막 액티비티 최고 체험. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (89, 3, '에미레이트 스키장 체험', '실내 스키장, 쇼핑몰 내 위치. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (89, 4, '두바이 스포츠 시티', '5000만 평방피트 복합 스포츠 시설. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (89, 5, '근교 트레킹·야외 활동', '두바이 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (89, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (89, 7, '체험 레슨', '현지 코치에게 짧은 레슨을 받고 미니 게임으로 마무리합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (89, 8, '자유 일정과 휴식', '활동 사이 하루는 자유롭게 쉬며 근육을 풀 시간을 가집니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (89, 9, '사막 사파리 심화 코스', '가이드와 함께 한 단계 높은 코스에 도전합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (89, 10, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (30, 13, 14, 1580000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (90, 1, '두바이 도착', '인천에서 출발해 두바이에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (90, 2, '사막 사파리', '사막 액티비티 최고 체험. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (90, 3, '에미레이트 스키장 체험', '실내 스키장, 쇼핑몰 내 위치. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (90, 4, '두바이 스포츠 시티', '5000만 평방피트 복합 스포츠 시설. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (90, 5, '근교 트레킹·야외 활동', '두바이 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (90, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (90, 7, '체험 레슨', '현지 코치에게 짧은 레슨을 받고 미니 게임으로 마무리합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (90, 8, '자유 일정과 휴식', '활동 사이 하루는 자유롭게 쉬며 근육을 풀 시간을 가집니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (90, 9, '사막 사파리 심화 코스', '가이드와 함께 한 단계 높은 코스에 도전합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (90, 10, '강변·해변 러닝과 요가', '아침 러닝이나 요가로 몸을 깨운 뒤 도시를 가볍게 둘러봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (90, 11, '현지 팀 팬 모임', '현지 팬들과 함께 응원 문화를 체험하고 기념품을 고릅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (90, 12, '물가 액티비티', '수상·해안 액티비티를 즐기고 온천이나 스파로 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (90, 13, '로컬 스포츠 클래스', '현지에서 사랑받는 전통 스포츠를 배우는 체험 수업입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (90, 14, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 22, NULL, 'SPORTS_ACTIVITY', '시카고 스포츠·액티비티 투어: 큐스(야구) · 화이트삭스(야구)', '메이저리그, 리글리 필드. 메이저리그, 개럽 콤스키 파크.', '바람개비 아웃도어', '큐스(야구) — 메이저리그, 리글리 필드
화이트삭스(야구) — 메이저리그, 개럽 콤스키 파크
베어스(미식축구) — NFL, 솔저 필드', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
경기 관람 티켓 또는 액티비티 이용권·장비 대여', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 큐스(야구), 화이트삭스(야구), 베어스(미식축구) (상품·브랜드는 가상)', 'ON_SALE', 31);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (31, 6, 7, 880000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (91, 1, '시카고 도착', '인천에서 출발해 시카고에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (91, 2, '큐스(야구)', '메이저리그, 리글리 필드. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (91, 3, '화이트삭스(야구) 체험', '메이저리그, 개럽 콤스키 파크. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (91, 4, '베어스(미식축구)', 'NFL, 솔저 필드. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (91, 5, '근교 트레킹·야외 활동', '시카고 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (91, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (91, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (31, 9, 10, 1250000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (92, 1, '시카고 도착', '인천에서 출발해 시카고에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (92, 2, '큐스(야구)', '메이저리그, 리글리 필드. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (92, 3, '화이트삭스(야구) 체험', '메이저리그, 개럽 콤스키 파크. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (92, 4, '베어스(미식축구)', 'NFL, 솔저 필드. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (92, 5, '근교 트레킹·야외 활동', '시카고 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (92, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (92, 7, '체험 레슨', '현지 코치에게 짧은 레슨을 받고 미니 게임으로 마무리합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (92, 8, '자유 일정과 휴식', '활동 사이 하루는 자유롭게 쉬며 근육을 풀 시간을 가집니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (92, 9, '큐스(야구) 심화 코스', '가이드와 함께 한 단계 높은 코스에 도전합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (92, 10, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (31, 13, 14, 1730000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (93, 1, '시카고 도착', '인천에서 출발해 시카고에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (93, 2, '큐스(야구)', '메이저리그, 리글리 필드. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (93, 3, '화이트삭스(야구) 체험', '메이저리그, 개럽 콤스키 파크. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (93, 4, '베어스(미식축구)', 'NFL, 솔저 필드. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (93, 5, '근교 트레킹·야외 활동', '시카고 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (93, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (93, 7, '체험 레슨', '현지 코치에게 짧은 레슨을 받고 미니 게임으로 마무리합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (93, 8, '자유 일정과 휴식', '활동 사이 하루는 자유롭게 쉬며 근육을 풀 시간을 가집니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (93, 9, '큐스(야구) 심화 코스', '가이드와 함께 한 단계 높은 코스에 도전합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (93, 10, '강변·해변 러닝과 요가', '아침 러닝이나 요가로 몸을 깨운 뒤 도시를 가볍게 둘러봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (93, 11, '현지 팀 팬 모임', '현지 팬들과 함께 응원 문화를 체험하고 기념품을 고릅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (93, 12, '물가 액티비티', '수상·해안 액티비티를 즐기고 온천이나 스파로 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (93, 13, '로컬 스포츠 클래스', '현지에서 사랑받는 전통 스포츠를 배우는 체험 수업입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (93, 14, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 23, NULL, 'ART_REST', '시드니 예술·휴식 투어: 시드니 오페라 하우스 · SEA LIFE 아쿠아리움', '세계 아이콘 건축물, 공연 감상. 펭귄, 상어, 거북이 등 해양 생물.', '고요숲 스파', '시드니 오페라 하우스 — 세계 아이콘 건축물, 공연 감상
SEA LIFE 아쿠아리움 — 펭귄, 상어, 거북이 등 해양 생물
호주 박물관 — 호주 문화 역사 전시', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
미술관·공연 입장권 또는 스파 이용권', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 시드니 오페라 하우스, SEA LIFE 아쿠아리움, 호주 박물관 (상품·브랜드는 가상)', 'ON_SALE', 32);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (32, 6, 7, 830000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (94, 1, '시드니 도착', '인천에서 출발해 시드니에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (94, 2, '시드니 오페라 하우스', '세계 아이콘 건축물, 공연 감상. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (94, 3, 'SEA LIFE 아쿠아리움', '펭귄, 상어, 거북이 등 해양 생물. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (94, 4, '호주 박물관', '호주 문화 역사 전시. 공연이나 전시 일정에 맞춰 관람 시간을 조정합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (94, 5, '공연·전시 관람', '시드니에서 열리는 공연 또는 전시 중 일정에 맞는 한 편을 관람합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (94, 6, '스파·휴식의 날', '스파나 온천, 마사지 등 느린 휴식으로 여행의 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (94, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (32, 9, 10, 1170000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (95, 1, '시드니 도착', '인천에서 출발해 시드니에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (95, 2, '시드니 오페라 하우스', '세계 아이콘 건축물, 공연 감상. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (95, 3, 'SEA LIFE 아쿠아리움', '펭귄, 상어, 거북이 등 해양 생물. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (95, 4, '호주 박물관', '호주 문화 역사 전시. 공연이나 전시 일정에 맞춰 관람 시간을 조정합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (95, 5, '공연·전시 관람', '시드니에서 열리는 공연 또는 전시 중 일정에 맞는 한 편을 관람합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (95, 6, '스파·휴식의 날', '스파나 온천, 마사지 등 느린 휴식으로 여행의 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (95, 7, '근교 소도시 산책', '시드니 근교의 작은 마을을 산책하며 갤러리와 공방을 둘러봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (95, 8, '전통 체험 클래스', '현지 공예 또는 전통 문화 체험 수업에 참여해 작품을 만듭니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (95, 9, '자유 일정', '하루는 자유롭게 보냅니다. 가이드가 추천 산책로와 전시 정보를 드립니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (95, 10, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (32, 13, 14, 1610000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (96, 1, '시드니 도착', '인천에서 출발해 시드니에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (96, 2, '시드니 오페라 하우스', '세계 아이콘 건축물, 공연 감상. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (96, 3, 'SEA LIFE 아쿠아리움', '펭귄, 상어, 거북이 등 해양 생물. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (96, 4, '호주 박물관', '호주 문화 역사 전시. 공연이나 전시 일정에 맞춰 관람 시간을 조정합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (96, 5, '공연·전시 관람', '시드니에서 열리는 공연 또는 전시 중 일정에 맞는 한 편을 관람합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (96, 6, '스파·휴식의 날', '스파나 온천, 마사지 등 느린 휴식으로 여행의 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (96, 7, '근교 소도시 산책', '시드니 근교의 작은 마을을 산책하며 갤러리와 공방을 둘러봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (96, 8, '전통 체험 클래스', '현지 공예 또는 전통 문화 체험 수업에 참여해 작품을 만듭니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (96, 9, '자유 일정', '하루는 자유롭게 보냅니다. 가이드가 추천 산책로와 전시 정보를 드립니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (96, 10, '정원·공원 힐링 산책', '도심 공원과 정원을 걸으며 사색하는 시간을 가집니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (96, 11, '야경과 재즈·클래식의 밤', '저녁에는 야경 명소를 보고 가벼운 공연을 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (96, 12, '미술관 한 곳 더', '시드니 오페라 하우스 외에 가이드가 고른 작은 미술관을 한 곳 더 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (96, 13, '티타임과 독서의 오후', '현지 찻집에서 천천히 차를 마시며 하루를 정리합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (96, 14, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 24, NULL, 'SPORTS_ACTIVITY', '밴쿠버 스포츠·액티비티 투어: 린 헤드워터스 등산 · 그로우스 마운틴 스키', '고목림과 린 계곡 하이킹. 겨울 스키, 여름 하이킹.', NULL, '린 헤드워터스 등산 — 고목림과 린 계곡 하이킹
그로우스 마운틴 스키 — 겨울 스키, 여름 하이킹
사이프러스 마운틴 — 북쇼어 스키 리조트 중 하나', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
경기 관람 티켓 또는 액티비티 이용권·장비 대여', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 린 헤드워터스 등산, 그로우스 마운틴 스키, 사이프러스 마운틴 (상품·브랜드는 가상)', 'ON_SALE', 33);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (33, 6, 7, 960000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (97, 1, '밴쿠버 도착', '인천에서 출발해 밴쿠버에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (97, 2, '린 헤드워터스 등산', '고목림과 린 계곡 하이킹. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (97, 3, '그로우스 마운틴 스키 체험', '겨울 스키, 여름 하이킹. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (97, 4, '사이프러스 마운틴', '북쇼어 스키 리조트 중 하나. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (97, 5, '근교 트레킹·야외 활동', '밴쿠버 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (97, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (97, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (33, 9, 10, 1350000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (98, 1, '밴쿠버 도착', '인천에서 출발해 밴쿠버에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (98, 2, '린 헤드워터스 등산', '고목림과 린 계곡 하이킹. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (98, 3, '그로우스 마운틴 스키 체험', '겨울 스키, 여름 하이킹. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (98, 4, '사이프러스 마운틴', '북쇼어 스키 리조트 중 하나. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (98, 5, '근교 트레킹·야외 활동', '밴쿠버 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (98, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (98, 7, '체험 레슨', '현지 코치에게 짧은 레슨을 받고 미니 게임으로 마무리합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (98, 8, '자유 일정과 휴식', '활동 사이 하루는 자유롭게 쉬며 근육을 풀 시간을 가집니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (98, 9, '린 헤드워터스 등산 심화 코스', '가이드와 함께 한 단계 높은 코스에 도전합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (98, 10, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (33, 13, 14, 1870000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (99, 1, '밴쿠버 도착', '인천에서 출발해 밴쿠버에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (99, 2, '린 헤드워터스 등산', '고목림과 린 계곡 하이킹. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (99, 3, '그로우스 마운틴 스키 체험', '겨울 스키, 여름 하이킹. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (99, 4, '사이프러스 마운틴', '북쇼어 스키 리조트 중 하나. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (99, 5, '근교 트레킹·야외 활동', '밴쿠버 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (99, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (99, 7, '체험 레슨', '현지 코치에게 짧은 레슨을 받고 미니 게임으로 마무리합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (99, 8, '자유 일정과 휴식', '활동 사이 하루는 자유롭게 쉬며 근육을 풀 시간을 가집니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (99, 9, '린 헤드워터스 등산 심화 코스', '가이드와 함께 한 단계 높은 코스에 도전합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (99, 10, '강변·해변 러닝과 요가', '아침 러닝이나 요가로 몸을 깨운 뒤 도시를 가볍게 둘러봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (99, 11, '현지 팀 팬 모임', '현지 팬들과 함께 응원 문화를 체험하고 기념품을 고릅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (99, 12, '물가 액티비티', '수상·해안 액티비티를 즐기고 온천이나 스파로 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (99, 13, '로컬 스포츠 클래스', '현지에서 사랑받는 전통 스포츠를 배우는 체험 수업입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (99, 14, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 25, NULL, 'FOOD_DRINK', '상파울루 미식·주류 투어: 모르타델라 샌드위치 · 미슐랭 별 레스토랑', '뮤니시팔 마켓의 명물 음식. 브라질 미슐랭 별 70% 집중.', '참나무 위스키', '모르타델라 샌드위치 — 뮤니시팔 마켓의 명물 음식
미슐랭 별 레스토랑 — 브라질 미슐랭 별 70% 집중
이민자 요리 — 이탈리아, 일식, 레바논 음식', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
일정에 표시된 식사와 시음', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 모르타델라 샌드위치, 미슐랭 별 레스토랑, 이민자 요리 (상품·브랜드는 가상)', 'ON_SALE', 34);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (34, 6, 7, 780000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (100, 1, '상파울루 도착', '인천에서 출발해 상파울루에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (100, 2, '모르타델라 샌드위치 탐방', '뮤니시팔 마켓의 명물 음식. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (100, 3, '참나무 위스키 견학과 시음', '참나무 위스키(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 미슐랭 별 레스토랑과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (100, 4, '이민자 요리 체험', '이탈리아, 일식, 레바논 음식. 직접 맛보고 고르는 시간을 가진 뒤 저녁은 현지 식당에서 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (100, 5, '쿠킹 클래스', '현지 셰프에게 상파울루의 대표 요리를 배우고 직접 만든 요리로 저녁을 먹습니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (100, 6, '근교 산지 미식 여행', '상파울루 근교의 산지로 이동해 제철 재료와 지역 음식을 맛보고 농장·공방을 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (100, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (34, 9, 10, 1100000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (101, 1, '상파울루 도착', '인천에서 출발해 상파울루에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (101, 2, '모르타델라 샌드위치 탐방', '뮤니시팔 마켓의 명물 음식. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (101, 3, '참나무 위스키 견학과 시음', '참나무 위스키(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 미슐랭 별 레스토랑과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (101, 4, '이민자 요리 체험', '이탈리아, 일식, 레바논 음식. 직접 맛보고 고르는 시간을 가진 뒤 저녁은 현지 식당에서 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (101, 5, '쿠킹 클래스', '현지 셰프에게 상파울루의 대표 요리를 배우고 직접 만든 요리로 저녁을 먹습니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (101, 6, '근교 산지 미식 여행', '상파울루 근교의 산지로 이동해 제철 재료와 지역 음식을 맛보고 농장·공방을 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (101, 7, '미슐랭 별 레스토랑 깊이 보기', '브라질 미슐랭 별 70% 집중. 전문 가이드의 설명과 함께 두 번째 코스를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (101, 8, '시장 쇼핑과 자유 시간', '현지 시장과 상점가에서 기념품과 식재료를 둘러보고 자유 시간을 보냅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (101, 9, '로컬 맛집 릴레이', '가이드가 고른 현지 단골 식당 세 곳을 이어서 맛보는 미식 산책입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (101, 10, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (34, 13, 14, 1520000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (102, 1, '상파울루 도착', '인천에서 출발해 상파울루에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (102, 2, '모르타델라 샌드위치 탐방', '뮤니시팔 마켓의 명물 음식. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (102, 3, '참나무 위스키 견학과 시음', '참나무 위스키(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 미슐랭 별 레스토랑과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (102, 4, '이민자 요리 체험', '이탈리아, 일식, 레바논 음식. 직접 맛보고 고르는 시간을 가진 뒤 저녁은 현지 식당에서 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (102, 5, '쿠킹 클래스', '현지 셰프에게 상파울루의 대표 요리를 배우고 직접 만든 요리로 저녁을 먹습니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (102, 6, '근교 산지 미식 여행', '상파울루 근교의 산지로 이동해 제철 재료와 지역 음식을 맛보고 농장·공방을 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (102, 7, '미슐랭 별 레스토랑 깊이 보기', '브라질 미슐랭 별 70% 집중. 전문 가이드의 설명과 함께 두 번째 코스를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (102, 8, '시장 쇼핑과 자유 시간', '현지 시장과 상점가에서 기념품과 식재료를 둘러보고 자유 시간을 보냅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (102, 9, '로컬 맛집 릴레이', '가이드가 고른 현지 단골 식당 세 곳을 이어서 맛보는 미식 산책입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (102, 10, '디저트·카페 투어', '상파울루의 유명 디저트와 카페를 돌며 여유로운 오후를 보냅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (102, 11, '현지 가정식 초대', '현지 가정집 식탁에서 가정식을 함께 먹으며 이야기를 나눕니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (102, 12, '자유 일정', '하루는 자유롭게 보냅니다. 가이드가 추천 맛집 지도를 드립니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (102, 13, '야시장·야경 산책', '저녁 시장과 야경 명소를 걸으며 길거리 음식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (102, 14, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 26, NULL, 'ART_REST', '카이로 예술·휴식 투어: 그랜드 이집트 박물관 · 이집트 박물관', '10만 개 유물, 투탕카멘 보물. 타흐리르 광장, 역사 유물 전시.', NULL, '그랜드 이집트 박물관 — 10만 개 유물, 투탕카멘 보물
이집트 박물관 — 타흐리르 광장, 역사 유물 전시
기자 피라미드 — 세계 최대 고대 건축물', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
미술관·공연 입장권 또는 스파 이용권', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 그랜드 이집트 박물관, 이집트 박물관, 기자 피라미드 (상품·브랜드는 가상)', 'ON_SALE', 35);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (35, 6, 7, 820000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (103, 1, '카이로 도착', '인천에서 출발해 카이로에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (103, 2, '그랜드 이집트 박물관', '10만 개 유물, 투탕카멘 보물. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (103, 3, '이집트 박물관', '타흐리르 광장, 역사 유물 전시. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (103, 4, '기자 피라미드', '세계 최대 고대 건축물. 공연이나 전시 일정에 맞춰 관람 시간을 조정합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (103, 5, '공연·전시 관람', '카이로에서 열리는 공연 또는 전시 중 일정에 맞는 한 편을 관람합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (103, 6, '스파·휴식의 날', '스파나 온천, 마사지 등 느린 휴식으로 여행의 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (103, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (35, 9, 10, 1150000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (104, 1, '카이로 도착', '인천에서 출발해 카이로에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (104, 2, '그랜드 이집트 박물관', '10만 개 유물, 투탕카멘 보물. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (104, 3, '이집트 박물관', '타흐리르 광장, 역사 유물 전시. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (104, 4, '기자 피라미드', '세계 최대 고대 건축물. 공연이나 전시 일정에 맞춰 관람 시간을 조정합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (104, 5, '공연·전시 관람', '카이로에서 열리는 공연 또는 전시 중 일정에 맞는 한 편을 관람합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (104, 6, '스파·휴식의 날', '스파나 온천, 마사지 등 느린 휴식으로 여행의 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (104, 7, '근교 소도시 산책', '카이로 근교의 작은 마을을 산책하며 갤러리와 공방을 둘러봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (104, 8, '전통 체험 클래스', '현지 공예 또는 전통 문화 체험 수업에 참여해 작품을 만듭니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (104, 9, '자유 일정', '하루는 자유롭게 보냅니다. 가이드가 추천 산책로와 전시 정보를 드립니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (104, 10, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (35, 13, 14, 1580000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (105, 1, '카이로 도착', '인천에서 출발해 카이로에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (105, 2, '그랜드 이집트 박물관', '10만 개 유물, 투탕카멘 보물. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (105, 3, '이집트 박물관', '타흐리르 광장, 역사 유물 전시. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (105, 4, '기자 피라미드', '세계 최대 고대 건축물. 공연이나 전시 일정에 맞춰 관람 시간을 조정합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (105, 5, '공연·전시 관람', '카이로에서 열리는 공연 또는 전시 중 일정에 맞는 한 편을 관람합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (105, 6, '스파·휴식의 날', '스파나 온천, 마사지 등 느린 휴식으로 여행의 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (105, 7, '근교 소도시 산책', '카이로 근교의 작은 마을을 산책하며 갤러리와 공방을 둘러봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (105, 8, '전통 체험 클래스', '현지 공예 또는 전통 문화 체험 수업에 참여해 작품을 만듭니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (105, 9, '자유 일정', '하루는 자유롭게 보냅니다. 가이드가 추천 산책로와 전시 정보를 드립니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (105, 10, '정원·공원 힐링 산책', '도심 공원과 정원을 걸으며 사색하는 시간을 가집니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (105, 11, '야경과 재즈·클래식의 밤', '저녁에는 야경 명소를 보고 가벼운 공연을 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (105, 12, '미술관 한 곳 더', '그랜드 이집트 박물관 외에 가이드가 고른 작은 미술관을 한 곳 더 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (105, 13, '티타임과 독서의 오후', '현지 찻집에서 천천히 차를 마시며 하루를 정리합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (105, 14, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 27, NULL, 'FOOD_DRINK', '케이프타운 미식·주류 투어: 테이스트 저니 투어 · 케이프 말레이 음식', '전통 & 현대 음식. 역사적 음식 문화.', '달빛 와이너리', '테이스트 저니 투어 — 전통 & 현대 음식
케이프 말레이 음식 — 역사적 음식 문화
보-카프 투어 — 컬러풀 주택가 투어', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
일정에 표시된 식사와 시음', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 테이스트 저니 투어, 케이프 말레이 음식, 보-카프 투어 (상품·브랜드는 가상)', 'ON_SALE', 36);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (36, 6, 7, 700000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (106, 1, '케이프타운 도착', '인천에서 출발해 케이프타운에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (106, 2, '테이스트 저니 투어 탐방', '전통 & 현대 음식. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (106, 3, '달빛 와이너리 견학과 시음', '달빛 와이너리(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 케이프 말레이 음식과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (106, 4, '보-카프 투어 체험', '컬러풀 주택가 투어. 직접 맛보고 고르는 시간을 가진 뒤 저녁은 현지 식당에서 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (106, 5, '쿠킹 클래스', '현지 셰프에게 케이프타운의 대표 요리를 배우고 직접 만든 요리로 저녁을 먹습니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (106, 6, '근교 산지 미식 여행', '케이프타운 근교의 산지로 이동해 제철 재료와 지역 음식을 맛보고 농장·공방을 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (106, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (36, 9, 10, 990000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (107, 1, '케이프타운 도착', '인천에서 출발해 케이프타운에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (107, 2, '테이스트 저니 투어 탐방', '전통 & 현대 음식. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (107, 3, '달빛 와이너리 견학과 시음', '달빛 와이너리(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 케이프 말레이 음식과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (107, 4, '보-카프 투어 체험', '컬러풀 주택가 투어. 직접 맛보고 고르는 시간을 가진 뒤 저녁은 현지 식당에서 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (107, 5, '쿠킹 클래스', '현지 셰프에게 케이프타운의 대표 요리를 배우고 직접 만든 요리로 저녁을 먹습니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (107, 6, '근교 산지 미식 여행', '케이프타운 근교의 산지로 이동해 제철 재료와 지역 음식을 맛보고 농장·공방을 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (107, 7, '케이프 말레이 음식 깊이 보기', '역사적 음식 문화. 전문 가이드의 설명과 함께 두 번째 코스를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (107, 8, '시장 쇼핑과 자유 시간', '현지 시장과 상점가에서 기념품과 식재료를 둘러보고 자유 시간을 보냅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (107, 9, '로컬 맛집 릴레이', '가이드가 고른 현지 단골 식당 세 곳을 이어서 맛보는 미식 산책입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (107, 10, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (36, 13, 14, 1360000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (108, 1, '케이프타운 도착', '인천에서 출발해 케이프타운에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (108, 2, '테이스트 저니 투어 탐방', '전통 & 현대 음식. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (108, 3, '달빛 와이너리 견학과 시음', '달빛 와이너리(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 케이프 말레이 음식과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (108, 4, '보-카프 투어 체험', '컬러풀 주택가 투어. 직접 맛보고 고르는 시간을 가진 뒤 저녁은 현지 식당에서 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (108, 5, '쿠킹 클래스', '현지 셰프에게 케이프타운의 대표 요리를 배우고 직접 만든 요리로 저녁을 먹습니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (108, 6, '근교 산지 미식 여행', '케이프타운 근교의 산지로 이동해 제철 재료와 지역 음식을 맛보고 농장·공방을 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (108, 7, '케이프 말레이 음식 깊이 보기', '역사적 음식 문화. 전문 가이드의 설명과 함께 두 번째 코스를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (108, 8, '시장 쇼핑과 자유 시간', '현지 시장과 상점가에서 기념품과 식재료를 둘러보고 자유 시간을 보냅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (108, 9, '로컬 맛집 릴레이', '가이드가 고른 현지 단골 식당 세 곳을 이어서 맛보는 미식 산책입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (108, 10, '디저트·카페 투어', '케이프타운의 유명 디저트와 카페를 돌며 여유로운 오후를 보냅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (108, 11, '현지 가정식 초대', '현지 가정집 식탁에서 가정식을 함께 먹으며 이야기를 나눕니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (108, 12, '자유 일정', '하루는 자유롭게 보냅니다. 가이드가 추천 맛집 지도를 드립니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (108, 13, '야시장·야경 산책', '저녁 시장과 야경 명소를 걸으며 길거리 음식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (108, 14, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 27, NULL, 'SPORTS_ACTIVITY', '케이프타운 스포츠·액티비티 투어: 테이블 마운틴 하이킹 · 서핑', '케이블카 또는 등산. 황금빛 해변 서핑.', '바람개비 아웃도어', '테이블 마운틴 하이킹 — 케이블카 또는 등산
서핑 — 황금빛 해변 서핑
라이온스 헤드 패러글라이딩 — 익스트림 스포츠', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
경기 관람 티켓 또는 액티비티 이용권·장비 대여', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 테이블 마운틴 하이킹, 서핑, 라이온스 헤드 패러글라이딩 (상품·브랜드는 가상)', 'ON_SALE', 37);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (37, 6, 7, 810000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (109, 1, '케이프타운 도착', '인천에서 출발해 케이프타운에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (109, 2, '테이블 마운틴 하이킹', '케이블카 또는 등산. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (109, 3, '서핑 체험', '황금빛 해변 서핑. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (109, 4, '라이온스 헤드 패러글라이딩', '익스트림 스포츠. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (109, 5, '근교 트레킹·야외 활동', '케이프타운 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (109, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (109, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (37, 9, 10, 1140000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (110, 1, '케이프타운 도착', '인천에서 출발해 케이프타운에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (110, 2, '테이블 마운틴 하이킹', '케이블카 또는 등산. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (110, 3, '서핑 체험', '황금빛 해변 서핑. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (110, 4, '라이온스 헤드 패러글라이딩', '익스트림 스포츠. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (110, 5, '근교 트레킹·야외 활동', '케이프타운 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (110, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (110, 7, '체험 레슨', '현지 코치에게 짧은 레슨을 받고 미니 게임으로 마무리합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (110, 8, '자유 일정과 휴식', '활동 사이 하루는 자유롭게 쉬며 근육을 풀 시간을 가집니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (110, 9, '테이블 마운틴 하이킹 심화 코스', '가이드와 함께 한 단계 높은 코스에 도전합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (110, 10, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (37, 13, 14, 1570000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (111, 1, '케이프타운 도착', '인천에서 출발해 케이프타운에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (111, 2, '테이블 마운틴 하이킹', '케이블카 또는 등산. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (111, 3, '서핑 체험', '황금빛 해변 서핑. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (111, 4, '라이온스 헤드 패러글라이딩', '익스트림 스포츠. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (111, 5, '근교 트레킹·야외 활동', '케이프타운 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (111, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (111, 7, '체험 레슨', '현지 코치에게 짧은 레슨을 받고 미니 게임으로 마무리합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (111, 8, '자유 일정과 휴식', '활동 사이 하루는 자유롭게 쉬며 근육을 풀 시간을 가집니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (111, 9, '테이블 마운틴 하이킹 심화 코스', '가이드와 함께 한 단계 높은 코스에 도전합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (111, 10, '강변·해변 러닝과 요가', '아침 러닝이나 요가로 몸을 깨운 뒤 도시를 가볍게 둘러봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (111, 11, '현지 팀 팬 모임', '현지 팬들과 함께 응원 문화를 체험하고 기념품을 고릅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (111, 12, '물가 액티비티', '수상·해안 액티비티를 즐기고 온천이나 스파로 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (111, 13, '로컬 스포츠 클래스', '현지에서 사랑받는 전통 스포츠를 배우는 체험 수업입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (111, 14, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 27, NULL, 'ART_REST', '케이프타운 예술·휴식 투어: 로벤 아일랜드 · 미술관 & 갤러리', '역사 박물관. 남아프리카 미술.', NULL, '로벤 아일랜드 — 역사 박물관
미술관 & 갤러리 — 남아프리카 미술
디스트릭트 식스 — 역사 문화 명소', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
미술관·공연 입장권 또는 스파 이용권', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 로벤 아일랜드, 미술관 & 갤러리, 디스트릭트 식스 (상품·브랜드는 가상)', 'ON_SALE', 38);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (38, 6, 7, 740000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (112, 1, '케이프타운 도착', '인천에서 출발해 케이프타운에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (112, 2, '로벤 아일랜드', '역사 박물관. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (112, 3, '미술관 & 갤러리', '남아프리카 미술. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (112, 4, '디스트릭트 식스', '역사 문화 명소. 공연이나 전시 일정에 맞춰 관람 시간을 조정합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (112, 5, '공연·전시 관람', '케이프타운에서 열리는 공연 또는 전시 중 일정에 맞는 한 편을 관람합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (112, 6, '스파·휴식의 날', '스파나 온천, 마사지 등 느린 휴식으로 여행의 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (112, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (38, 9, 10, 1040000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (113, 1, '케이프타운 도착', '인천에서 출발해 케이프타운에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (113, 2, '로벤 아일랜드', '역사 박물관. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (113, 3, '미술관 & 갤러리', '남아프리카 미술. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (113, 4, '디스트릭트 식스', '역사 문화 명소. 공연이나 전시 일정에 맞춰 관람 시간을 조정합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (113, 5, '공연·전시 관람', '케이프타운에서 열리는 공연 또는 전시 중 일정에 맞는 한 편을 관람합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (113, 6, '스파·휴식의 날', '스파나 온천, 마사지 등 느린 휴식으로 여행의 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (113, 7, '근교 소도시 산책', '케이프타운 근교의 작은 마을을 산책하며 갤러리와 공방을 둘러봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (113, 8, '전통 체험 클래스', '현지 공예 또는 전통 문화 체험 수업에 참여해 작품을 만듭니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (113, 9, '자유 일정', '하루는 자유롭게 보냅니다. 가이드가 추천 산책로와 전시 정보를 드립니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (113, 10, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (38, 13, 14, 1430000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (114, 1, '케이프타운 도착', '인천에서 출발해 케이프타운에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (114, 2, '로벤 아일랜드', '역사 박물관. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (114, 3, '미술관 & 갤러리', '남아프리카 미술. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (114, 4, '디스트릭트 식스', '역사 문화 명소. 공연이나 전시 일정에 맞춰 관람 시간을 조정합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (114, 5, '공연·전시 관람', '케이프타운에서 열리는 공연 또는 전시 중 일정에 맞는 한 편을 관람합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (114, 6, '스파·휴식의 날', '스파나 온천, 마사지 등 느린 휴식으로 여행의 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (114, 7, '근교 소도시 산책', '케이프타운 근교의 작은 마을을 산책하며 갤러리와 공방을 둘러봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (114, 8, '전통 체험 클래스', '현지 공예 또는 전통 문화 체험 수업에 참여해 작품을 만듭니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (114, 9, '자유 일정', '하루는 자유롭게 보냅니다. 가이드가 추천 산책로와 전시 정보를 드립니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (114, 10, '정원·공원 힐링 산책', '도심 공원과 정원을 걸으며 사색하는 시간을 가집니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (114, 11, '야경과 재즈·클래식의 밤', '저녁에는 야경 명소를 보고 가벼운 공연을 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (114, 12, '미술관 한 곳 더', '로벤 아일랜드 외에 가이드가 고른 작은 미술관을 한 곳 더 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (114, 13, '티타임과 독서의 오후', '현지 찻집에서 천천히 차를 마시며 하루를 정리합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (114, 14, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 28, NULL, 'ART_REST', '밀라노 예술·휴식 투어: 라 스칼라 오페라하우스 · 두오모(대성당)', '세계적 오페라극장, 공연 감상. 고딕 건축 걸작, 지붕 테라스.', NULL, '라 스칼라 오페라하우스 — 세계적 오페라극장, 공연 감상
두오모(대성당) — 고딕 건축 걸작, 지붕 테라스
브레라 미술관 — 이탈리아 그림 수집, 첫 일요일 무료', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
미술관·공연 입장권 또는 스파 이용권', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 라 스칼라 오페라하우스, 두오모(대성당), 브레라 미술관 (상품·브랜드는 가상)', 'ON_SALE', 39);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (39, 6, 7, 830000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (115, 1, '밀라노 도착', '인천에서 출발해 밀라노에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (115, 2, '라 스칼라 오페라하우스', '세계적 오페라극장, 공연 감상. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (115, 3, '두오모(대성당)', '고딕 건축 걸작, 지붕 테라스. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (115, 4, '브레라 미술관', '이탈리아 그림 수집, 첫 일요일 무료. 공연이나 전시 일정에 맞춰 관람 시간을 조정합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (115, 5, '공연·전시 관람', '밀라노에서 열리는 공연 또는 전시 중 일정에 맞는 한 편을 관람합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (115, 6, '스파·휴식의 날', '스파나 온천, 마사지 등 느린 휴식으로 여행의 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (115, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (39, 9, 10, 1160000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (116, 1, '밀라노 도착', '인천에서 출발해 밀라노에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (116, 2, '라 스칼라 오페라하우스', '세계적 오페라극장, 공연 감상. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (116, 3, '두오모(대성당)', '고딕 건축 걸작, 지붕 테라스. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (116, 4, '브레라 미술관', '이탈리아 그림 수집, 첫 일요일 무료. 공연이나 전시 일정에 맞춰 관람 시간을 조정합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (116, 5, '공연·전시 관람', '밀라노에서 열리는 공연 또는 전시 중 일정에 맞는 한 편을 관람합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (116, 6, '스파·휴식의 날', '스파나 온천, 마사지 등 느린 휴식으로 여행의 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (116, 7, '근교 소도시 산책', '밀라노 근교의 작은 마을을 산책하며 갤러리와 공방을 둘러봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (116, 8, '전통 체험 클래스', '현지 공예 또는 전통 문화 체험 수업에 참여해 작품을 만듭니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (116, 9, '자유 일정', '하루는 자유롭게 보냅니다. 가이드가 추천 산책로와 전시 정보를 드립니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (116, 10, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (39, 13, 14, 1600000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (117, 1, '밀라노 도착', '인천에서 출발해 밀라노에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (117, 2, '라 스칼라 오페라하우스', '세계적 오페라극장, 공연 감상. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (117, 3, '두오모(대성당)', '고딕 건축 걸작, 지붕 테라스. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (117, 4, '브레라 미술관', '이탈리아 그림 수집, 첫 일요일 무료. 공연이나 전시 일정에 맞춰 관람 시간을 조정합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (117, 5, '공연·전시 관람', '밀라노에서 열리는 공연 또는 전시 중 일정에 맞는 한 편을 관람합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (117, 6, '스파·휴식의 날', '스파나 온천, 마사지 등 느린 휴식으로 여행의 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (117, 7, '근교 소도시 산책', '밀라노 근교의 작은 마을을 산책하며 갤러리와 공방을 둘러봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (117, 8, '전통 체험 클래스', '현지 공예 또는 전통 문화 체험 수업에 참여해 작품을 만듭니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (117, 9, '자유 일정', '하루는 자유롭게 보냅니다. 가이드가 추천 산책로와 전시 정보를 드립니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (117, 10, '정원·공원 힐링 산책', '도심 공원과 정원을 걸으며 사색하는 시간을 가집니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (117, 11, '야경과 재즈·클래식의 밤', '저녁에는 야경 명소를 보고 가벼운 공연을 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (117, 12, '미술관 한 곳 더', '라 스칼라 오페라하우스 외에 가이드가 고른 작은 미술관을 한 곳 더 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (117, 13, '티타임과 독서의 오후', '현지 찻집에서 천천히 차를 마시며 하루를 정리합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (117, 14, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 29, NULL, 'FOOD_DRINK', '암스테르담 미식·주류 투어: 생 청어 · 네덜란드 전통 음식', '전통 네덜란드 길거리 음식. 판케이크, 치즈 등 현지 특산.', '달빛 와이너리', '생 청어 — 전통 네덜란드 길거리 음식
네덜란드 전통 음식 — 판케이크, 치즈 등 현지 특산
운하변 카페 문화 — 운하 보며 식사하는 경험', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
일정에 표시된 식사와 시음', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 생 청어, 네덜란드 전통 음식, 운하변 카페 문화 (상품·브랜드는 가상)', 'ON_SALE', 40);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (40, 6, 7, 740000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (118, 1, '암스테르담 도착', '인천에서 출발해 암스테르담에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (118, 2, '생 청어 탐방', '전통 네덜란드 길거리 음식. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (118, 3, '달빛 와이너리 견학과 시음', '달빛 와이너리(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 네덜란드 전통 음식과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (118, 4, '운하변 카페 문화 체험', '운하 보며 식사하는 경험. 직접 맛보고 고르는 시간을 가진 뒤 저녁은 현지 식당에서 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (118, 5, '쿠킹 클래스', '현지 셰프에게 암스테르담의 대표 요리를 배우고 직접 만든 요리로 저녁을 먹습니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (118, 6, '근교 산지 미식 여행', '암스테르담 근교의 산지로 이동해 제철 재료와 지역 음식을 맛보고 농장·공방을 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (118, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (40, 9, 10, 1030000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (119, 1, '암스테르담 도착', '인천에서 출발해 암스테르담에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (119, 2, '생 청어 탐방', '전통 네덜란드 길거리 음식. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (119, 3, '달빛 와이너리 견학과 시음', '달빛 와이너리(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 네덜란드 전통 음식과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (119, 4, '운하변 카페 문화 체험', '운하 보며 식사하는 경험. 직접 맛보고 고르는 시간을 가진 뒤 저녁은 현지 식당에서 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (119, 5, '쿠킹 클래스', '현지 셰프에게 암스테르담의 대표 요리를 배우고 직접 만든 요리로 저녁을 먹습니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (119, 6, '근교 산지 미식 여행', '암스테르담 근교의 산지로 이동해 제철 재료와 지역 음식을 맛보고 농장·공방을 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (119, 7, '네덜란드 전통 음식 깊이 보기', '판케이크, 치즈 등 현지 특산. 전문 가이드의 설명과 함께 두 번째 코스를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (119, 8, '시장 쇼핑과 자유 시간', '현지 시장과 상점가에서 기념품과 식재료를 둘러보고 자유 시간을 보냅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (119, 9, '로컬 맛집 릴레이', '가이드가 고른 현지 단골 식당 세 곳을 이어서 맛보는 미식 산책입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (119, 10, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (40, 13, 14, 1420000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (120, 1, '암스테르담 도착', '인천에서 출발해 암스테르담에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (120, 2, '생 청어 탐방', '전통 네덜란드 길거리 음식. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (120, 3, '달빛 와이너리 견학과 시음', '달빛 와이너리(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 네덜란드 전통 음식과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (120, 4, '운하변 카페 문화 체험', '운하 보며 식사하는 경험. 직접 맛보고 고르는 시간을 가진 뒤 저녁은 현지 식당에서 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (120, 5, '쿠킹 클래스', '현지 셰프에게 암스테르담의 대표 요리를 배우고 직접 만든 요리로 저녁을 먹습니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (120, 6, '근교 산지 미식 여행', '암스테르담 근교의 산지로 이동해 제철 재료와 지역 음식을 맛보고 농장·공방을 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (120, 7, '네덜란드 전통 음식 깊이 보기', '판케이크, 치즈 등 현지 특산. 전문 가이드의 설명과 함께 두 번째 코스를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (120, 8, '시장 쇼핑과 자유 시간', '현지 시장과 상점가에서 기념품과 식재료를 둘러보고 자유 시간을 보냅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (120, 9, '로컬 맛집 릴레이', '가이드가 고른 현지 단골 식당 세 곳을 이어서 맛보는 미식 산책입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (120, 10, '디저트·카페 투어', '암스테르담의 유명 디저트와 카페를 돌며 여유로운 오후를 보냅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (120, 11, '현지 가정식 초대', '현지 가정집 식탁에서 가정식을 함께 먹으며 이야기를 나눕니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (120, 12, '자유 일정', '하루는 자유롭게 보냅니다. 가이드가 추천 맛집 지도를 드립니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (120, 13, '야시장·야경 산책', '저녁 시장과 야경 명소를 걸으며 길거리 음식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (120, 14, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 30, NULL, 'FOOD_DRINK', '이스탄불 미식·주류 투어: 시밋 · 메제', '참깨 베이글, 현지 아침 음식. 다양한 전채 요리 모음.', '구름 치즈공방', '시밋 — 참깨 베이글, 현지 아침 음식
메제 — 다양한 전채 요리 모음
이스탄불 푸드 워킹투어 — 현지 음식 거리 체험', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
일정에 표시된 식사와 시음', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 시밋, 메제, 이스탄불 푸드 워킹투어 (상품·브랜드는 가상)', 'ON_SALE', 41);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (41, 6, 7, 700000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (121, 1, '이스탄불 도착', '인천에서 출발해 이스탄불에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (121, 2, '시밋 탐방', '참깨 베이글, 현지 아침 음식. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (121, 3, '구름 치즈공방 견학과 시음', '구름 치즈공방(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 메제과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (121, 4, '이스탄불 푸드 워킹투어 체험', '현지 음식 거리 체험. 직접 맛보고 고르는 시간을 가진 뒤 저녁은 현지 식당에서 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (121, 5, '쿠킹 클래스', '현지 셰프에게 이스탄불의 대표 요리를 배우고 직접 만든 요리로 저녁을 먹습니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (121, 6, '근교 산지 미식 여행', '이스탄불 근교의 산지로 이동해 제철 재료와 지역 음식을 맛보고 농장·공방을 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (121, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (41, 9, 10, 990000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (122, 1, '이스탄불 도착', '인천에서 출발해 이스탄불에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (122, 2, '시밋 탐방', '참깨 베이글, 현지 아침 음식. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (122, 3, '구름 치즈공방 견학과 시음', '구름 치즈공방(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 메제과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (122, 4, '이스탄불 푸드 워킹투어 체험', '현지 음식 거리 체험. 직접 맛보고 고르는 시간을 가진 뒤 저녁은 현지 식당에서 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (122, 5, '쿠킹 클래스', '현지 셰프에게 이스탄불의 대표 요리를 배우고 직접 만든 요리로 저녁을 먹습니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (122, 6, '근교 산지 미식 여행', '이스탄불 근교의 산지로 이동해 제철 재료와 지역 음식을 맛보고 농장·공방을 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (122, 7, '메제 깊이 보기', '다양한 전채 요리 모음. 전문 가이드의 설명과 함께 두 번째 코스를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (122, 8, '시장 쇼핑과 자유 시간', '현지 시장과 상점가에서 기념품과 식재료를 둘러보고 자유 시간을 보냅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (122, 9, '로컬 맛집 릴레이', '가이드가 고른 현지 단골 식당 세 곳을 이어서 맛보는 미식 산책입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (122, 10, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (41, 13, 14, 1360000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (123, 1, '이스탄불 도착', '인천에서 출발해 이스탄불에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (123, 2, '시밋 탐방', '참깨 베이글, 현지 아침 음식. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (123, 3, '구름 치즈공방 견학과 시음', '구름 치즈공방(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 메제과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (123, 4, '이스탄불 푸드 워킹투어 체험', '현지 음식 거리 체험. 직접 맛보고 고르는 시간을 가진 뒤 저녁은 현지 식당에서 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (123, 5, '쿠킹 클래스', '현지 셰프에게 이스탄불의 대표 요리를 배우고 직접 만든 요리로 저녁을 먹습니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (123, 6, '근교 산지 미식 여행', '이스탄불 근교의 산지로 이동해 제철 재료와 지역 음식을 맛보고 농장·공방을 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (123, 7, '메제 깊이 보기', '다양한 전채 요리 모음. 전문 가이드의 설명과 함께 두 번째 코스를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (123, 8, '시장 쇼핑과 자유 시간', '현지 시장과 상점가에서 기념품과 식재료를 둘러보고 자유 시간을 보냅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (123, 9, '로컬 맛집 릴레이', '가이드가 고른 현지 단골 식당 세 곳을 이어서 맛보는 미식 산책입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (123, 10, '디저트·카페 투어', '이스탄불의 유명 디저트와 카페를 돌며 여유로운 오후를 보냅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (123, 11, '현지 가정식 초대', '현지 가정집 식탁에서 가정식을 함께 먹으며 이야기를 나눕니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (123, 12, '자유 일정', '하루는 자유롭게 보냅니다. 가이드가 추천 맛집 지도를 드립니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (123, 13, '야시장·야경 산책', '저녁 시장과 야경 명소를 걸으며 길거리 음식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (123, 14, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 31, NULL, 'FOOD_DRINK', '프라하 미식·주류 투어: 트들닉 · 체코 맥주', '녹아내리는 체코 과자. 세계 최고 맥주 소비 국가.', '은하수 제면소', '트들닉 — 녹아내리는 체코 과자
체코 맥주 — 세계 최고 맥주 소비 국가
체코 전통 음식 — 현지 펍과 레스토랑 체험', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
일정에 표시된 식사와 시음', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 트들닉, 체코 맥주, 체코 전통 음식 (상품·브랜드는 가상)', 'ON_SALE', 42);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (42, 6, 7, 720000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (124, 1, '프라하 도착', '인천에서 출발해 프라하에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (124, 2, '트들닉 탐방', '녹아내리는 체코 과자. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (124, 3, '은하수 제면소 견학과 시음', '은하수 제면소(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 체코 맥주과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (124, 4, '체코 전통 음식 체험', '현지 펍과 레스토랑 체험. 직접 맛보고 고르는 시간을 가진 뒤 저녁은 현지 식당에서 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (124, 5, '쿠킹 클래스', '현지 셰프에게 프라하의 대표 요리를 배우고 직접 만든 요리로 저녁을 먹습니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (124, 6, '근교 산지 미식 여행', '프라하 근교의 산지로 이동해 제철 재료와 지역 음식을 맛보고 농장·공방을 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (124, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (42, 9, 10, 1010000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (125, 1, '프라하 도착', '인천에서 출발해 프라하에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (125, 2, '트들닉 탐방', '녹아내리는 체코 과자. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (125, 3, '은하수 제면소 견학과 시음', '은하수 제면소(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 체코 맥주과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (125, 4, '체코 전통 음식 체험', '현지 펍과 레스토랑 체험. 직접 맛보고 고르는 시간을 가진 뒤 저녁은 현지 식당에서 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (125, 5, '쿠킹 클래스', '현지 셰프에게 프라하의 대표 요리를 배우고 직접 만든 요리로 저녁을 먹습니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (125, 6, '근교 산지 미식 여행', '프라하 근교의 산지로 이동해 제철 재료와 지역 음식을 맛보고 농장·공방을 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (125, 7, '체코 맥주 깊이 보기', '세계 최고 맥주 소비 국가. 전문 가이드의 설명과 함께 두 번째 코스를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (125, 8, '시장 쇼핑과 자유 시간', '현지 시장과 상점가에서 기념품과 식재료를 둘러보고 자유 시간을 보냅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (125, 9, '로컬 맛집 릴레이', '가이드가 고른 현지 단골 식당 세 곳을 이어서 맛보는 미식 산책입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (125, 10, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (42, 13, 14, 1390000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (126, 1, '프라하 도착', '인천에서 출발해 프라하에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (126, 2, '트들닉 탐방', '녹아내리는 체코 과자. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (126, 3, '은하수 제면소 견학과 시음', '은하수 제면소(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 체코 맥주과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (126, 4, '체코 전통 음식 체험', '현지 펍과 레스토랑 체험. 직접 맛보고 고르는 시간을 가진 뒤 저녁은 현지 식당에서 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (126, 5, '쿠킹 클래스', '현지 셰프에게 프라하의 대표 요리를 배우고 직접 만든 요리로 저녁을 먹습니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (126, 6, '근교 산지 미식 여행', '프라하 근교의 산지로 이동해 제철 재료와 지역 음식을 맛보고 농장·공방을 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (126, 7, '체코 맥주 깊이 보기', '세계 최고 맥주 소비 국가. 전문 가이드의 설명과 함께 두 번째 코스를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (126, 8, '시장 쇼핑과 자유 시간', '현지 시장과 상점가에서 기념품과 식재료를 둘러보고 자유 시간을 보냅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (126, 9, '로컬 맛집 릴레이', '가이드가 고른 현지 단골 식당 세 곳을 이어서 맛보는 미식 산책입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (126, 10, '디저트·카페 투어', '프라하의 유명 디저트와 카페를 돌며 여유로운 오후를 보냅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (126, 11, '현지 가정식 초대', '현지 가정집 식탁에서 가정식을 함께 먹으며 이야기를 나눕니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (126, 12, '자유 일정', '하루는 자유롭게 보냅니다. 가이드가 추천 맛집 지도를 드립니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (126, 13, '야시장·야경 산책', '저녁 시장과 야경 명소를 걸으며 길거리 음식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (126, 14, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 32, NULL, 'ART_REST', '빈 예술·휴식 투어: 쿤스트히스토리셰스 박물관 · 벨베데레 궁전', '예술 작품의 대규모 컬렉션을 보유한 박물관. 합스부르크 왕가의 별궁, 미술관으로 운영 중.', NULL, '쿤스트히스토리셰스 박물관 — 예술 작품의 대규모 컬렉션을 보유한 박물관
벨베데레 궁전 — 합스부르크 왕가의 별궁, 미술관으로 운영 중
스페인 승마학교 — 450년 역사의 리피차너 말 훈련장, UNESCO 무형문화유산', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
미술관·공연 입장권 또는 스파 이용권', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 쿤스트히스토리셰스 박물관, 벨베데레 궁전, 스페인 승마학교 (상품·브랜드는 가상)', 'ON_SALE', 43);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (43, 6, 7, 800000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (127, 1, '빈 도착', '인천에서 출발해 빈에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (127, 2, '쿤스트히스토리셰스 박물관', '예술 작품의 대규모 컬렉션을 보유한 박물관. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (127, 3, '벨베데레 궁전', '합스부르크 왕가의 별궁, 미술관으로 운영 중. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (127, 4, '스페인 승마학교', '450년 역사의 리피차너 말 훈련장, UNESCO 무형문화유산. 공연이나 전시 일정에 맞춰 관람 시간을 조정합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (127, 5, '공연·전시 관람', '빈에서 열리는 공연 또는 전시 중 일정에 맞는 한 편을 관람합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (127, 6, '스파·휴식의 날', '스파나 온천, 마사지 등 느린 휴식으로 여행의 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (127, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (43, 9, 10, 1120000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (128, 1, '빈 도착', '인천에서 출발해 빈에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (128, 2, '쿤스트히스토리셰스 박물관', '예술 작품의 대규모 컬렉션을 보유한 박물관. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (128, 3, '벨베데레 궁전', '합스부르크 왕가의 별궁, 미술관으로 운영 중. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (128, 4, '스페인 승마학교', '450년 역사의 리피차너 말 훈련장, UNESCO 무형문화유산. 공연이나 전시 일정에 맞춰 관람 시간을 조정합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (128, 5, '공연·전시 관람', '빈에서 열리는 공연 또는 전시 중 일정에 맞는 한 편을 관람합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (128, 6, '스파·휴식의 날', '스파나 온천, 마사지 등 느린 휴식으로 여행의 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (128, 7, '근교 소도시 산책', '빈 근교의 작은 마을을 산책하며 갤러리와 공방을 둘러봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (128, 8, '전통 체험 클래스', '현지 공예 또는 전통 문화 체험 수업에 참여해 작품을 만듭니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (128, 9, '자유 일정', '하루는 자유롭게 보냅니다. 가이드가 추천 산책로와 전시 정보를 드립니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (128, 10, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (43, 13, 14, 1550000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (129, 1, '빈 도착', '인천에서 출발해 빈에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (129, 2, '쿤스트히스토리셰스 박물관', '예술 작품의 대규모 컬렉션을 보유한 박물관. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (129, 3, '벨베데레 궁전', '합스부르크 왕가의 별궁, 미술관으로 운영 중. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (129, 4, '스페인 승마학교', '450년 역사의 리피차너 말 훈련장, UNESCO 무형문화유산. 공연이나 전시 일정에 맞춰 관람 시간을 조정합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (129, 5, '공연·전시 관람', '빈에서 열리는 공연 또는 전시 중 일정에 맞는 한 편을 관람합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (129, 6, '스파·휴식의 날', '스파나 온천, 마사지 등 느린 휴식으로 여행의 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (129, 7, '근교 소도시 산책', '빈 근교의 작은 마을을 산책하며 갤러리와 공방을 둘러봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (129, 8, '전통 체험 클래스', '현지 공예 또는 전통 문화 체험 수업에 참여해 작품을 만듭니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (129, 9, '자유 일정', '하루는 자유롭게 보냅니다. 가이드가 추천 산책로와 전시 정보를 드립니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (129, 10, '정원·공원 힐링 산책', '도심 공원과 정원을 걸으며 사색하는 시간을 가집니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (129, 11, '야경과 재즈·클래식의 밤', '저녁에는 야경 명소를 보고 가벼운 공연을 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (129, 12, '미술관 한 곳 더', '쿤스트히스토리셰스 박물관 외에 가이드가 고른 작은 미술관을 한 곳 더 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (129, 13, '티타임과 독서의 오후', '현지 찻집에서 천천히 차를 마시며 하루를 정리합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (129, 14, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 33, NULL, 'FOOD_DRINK', '리스본 미식·주류 투어: 포르투갈 음식 와인 투어 · 파스텔 데 나타', '현지 가이드와 함께 포르투갈 요리 맛보기. 포르투갈식 계란 타르트.', '소금꽃 식초공방', '포르투갈 음식 와인 투어 — 현지 가이드와 함께 포르투갈 요리 맛보기
파스텔 데 나타 — 포르투갈식 계란 타르트
진지냐 — 포르투갈 전통 체리 리큐르 음료', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
일정에 표시된 식사와 시음', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 포르투갈 음식 와인 투어, 파스텔 데 나타, 진지냐 (상품·브랜드는 가상)', 'ON_SALE', 44);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (44, 6, 7, 810000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (130, 1, '리스본 도착', '인천에서 출발해 리스본에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (130, 2, '포르투갈 음식 와인 투어 탐방', '현지 가이드와 함께 포르투갈 요리 맛보기. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (130, 3, '소금꽃 식초공방 견학과 시음', '소금꽃 식초공방(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 파스텔 데 나타과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (130, 4, '진지냐 체험', '포르투갈 전통 체리 리큐르 음료. 직접 맛보고 고르는 시간을 가진 뒤 저녁은 현지 식당에서 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (130, 5, '쿠킹 클래스', '현지 셰프에게 리스본의 대표 요리를 배우고 직접 만든 요리로 저녁을 먹습니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (130, 6, '근교 산지 미식 여행', '리스본 근교의 산지로 이동해 제철 재료와 지역 음식을 맛보고 농장·공방을 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (130, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (44, 9, 10, 1130000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (131, 1, '리스본 도착', '인천에서 출발해 리스본에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (131, 2, '포르투갈 음식 와인 투어 탐방', '현지 가이드와 함께 포르투갈 요리 맛보기. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (131, 3, '소금꽃 식초공방 견학과 시음', '소금꽃 식초공방(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 파스텔 데 나타과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (131, 4, '진지냐 체험', '포르투갈 전통 체리 리큐르 음료. 직접 맛보고 고르는 시간을 가진 뒤 저녁은 현지 식당에서 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (131, 5, '쿠킹 클래스', '현지 셰프에게 리스본의 대표 요리를 배우고 직접 만든 요리로 저녁을 먹습니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (131, 6, '근교 산지 미식 여행', '리스본 근교의 산지로 이동해 제철 재료와 지역 음식을 맛보고 농장·공방을 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (131, 7, '파스텔 데 나타 깊이 보기', '포르투갈식 계란 타르트. 전문 가이드의 설명과 함께 두 번째 코스를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (131, 8, '시장 쇼핑과 자유 시간', '현지 시장과 상점가에서 기념품과 식재료를 둘러보고 자유 시간을 보냅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (131, 9, '로컬 맛집 릴레이', '가이드가 고른 현지 단골 식당 세 곳을 이어서 맛보는 미식 산책입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (131, 10, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (44, 13, 14, 1570000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (132, 1, '리스본 도착', '인천에서 출발해 리스본에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (132, 2, '포르투갈 음식 와인 투어 탐방', '현지 가이드와 함께 포르투갈 요리 맛보기. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (132, 3, '소금꽃 식초공방 견학과 시음', '소금꽃 식초공방(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 파스텔 데 나타과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (132, 4, '진지냐 체험', '포르투갈 전통 체리 리큐르 음료. 직접 맛보고 고르는 시간을 가진 뒤 저녁은 현지 식당에서 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (132, 5, '쿠킹 클래스', '현지 셰프에게 리스본의 대표 요리를 배우고 직접 만든 요리로 저녁을 먹습니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (132, 6, '근교 산지 미식 여행', '리스본 근교의 산지로 이동해 제철 재료와 지역 음식을 맛보고 농장·공방을 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (132, 7, '파스텔 데 나타 깊이 보기', '포르투갈식 계란 타르트. 전문 가이드의 설명과 함께 두 번째 코스를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (132, 8, '시장 쇼핑과 자유 시간', '현지 시장과 상점가에서 기념품과 식재료를 둘러보고 자유 시간을 보냅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (132, 9, '로컬 맛집 릴레이', '가이드가 고른 현지 단골 식당 세 곳을 이어서 맛보는 미식 산책입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (132, 10, '디저트·카페 투어', '리스본의 유명 디저트와 카페를 돌며 여유로운 오후를 보냅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (132, 11, '현지 가정식 초대', '현지 가정집 식탁에서 가정식을 함께 먹으며 이야기를 나눕니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (132, 12, '자유 일정', '하루는 자유롭게 보냅니다. 가이드가 추천 맛집 지도를 드립니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (132, 13, '야시장·야경 산책', '저녁 시장과 야경 명소를 걸으며 길거리 음식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (132, 14, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 34, NULL, 'FOOD_DRINK', '에든버러 미식·주류 투어: 스카치 위스키 익스피리언스 · 캐논볼 레스토랑', '위스키 역사와 테이스팅 투어. 에든버러 성 전망의 수상 스코틀랜드 음식점.', '은하수 제면소', '스카치 위스키 익스피리언스 — 위스키 역사와 테이스팅 투어
캐논볼 레스토랑 — 에든버러 성 전망의 수상 스코틀랜드 음식점
스코틀랜드 전통 요리 — 스코틀랜드식 하깅스, 무, 감자 요리', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
일정에 표시된 식사와 시음', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 스카치 위스키 익스피리언스, 캐논볼 레스토랑, 스코틀랜드 전통 요리 (상품·브랜드는 가상)', 'ON_SALE', 45);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (45, 6, 7, 760000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (133, 1, '에든버러 도착', '인천에서 출발해 에든버러에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (133, 2, '스카치 위스키 익스피리언스 탐방', '위스키 역사와 테이스팅 투어. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (133, 3, '은하수 제면소 견학과 시음', '은하수 제면소(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 캐논볼 레스토랑과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (133, 4, '스코틀랜드 전통 요리 체험', '스코틀랜드식 하깅스, 무, 감자 요리. 직접 맛보고 고르는 시간을 가진 뒤 저녁은 현지 식당에서 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (133, 5, '쿠킹 클래스', '현지 셰프에게 에든버러의 대표 요리를 배우고 직접 만든 요리로 저녁을 먹습니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (133, 6, '근교 산지 미식 여행', '에든버러 근교의 산지로 이동해 제철 재료와 지역 음식을 맛보고 농장·공방을 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (133, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (45, 9, 10, 1060000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (134, 1, '에든버러 도착', '인천에서 출발해 에든버러에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (134, 2, '스카치 위스키 익스피리언스 탐방', '위스키 역사와 테이스팅 투어. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (134, 3, '은하수 제면소 견학과 시음', '은하수 제면소(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 캐논볼 레스토랑과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (134, 4, '스코틀랜드 전통 요리 체험', '스코틀랜드식 하깅스, 무, 감자 요리. 직접 맛보고 고르는 시간을 가진 뒤 저녁은 현지 식당에서 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (134, 5, '쿠킹 클래스', '현지 셰프에게 에든버러의 대표 요리를 배우고 직접 만든 요리로 저녁을 먹습니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (134, 6, '근교 산지 미식 여행', '에든버러 근교의 산지로 이동해 제철 재료와 지역 음식을 맛보고 농장·공방을 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (134, 7, '캐논볼 레스토랑 깊이 보기', '에든버러 성 전망의 수상 스코틀랜드 음식점. 전문 가이드의 설명과 함께 두 번째 코스를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (134, 8, '시장 쇼핑과 자유 시간', '현지 시장과 상점가에서 기념품과 식재료를 둘러보고 자유 시간을 보냅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (134, 9, '로컬 맛집 릴레이', '가이드가 고른 현지 단골 식당 세 곳을 이어서 맛보는 미식 산책입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (134, 10, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (45, 13, 14, 1460000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (135, 1, '에든버러 도착', '인천에서 출발해 에든버러에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (135, 2, '스카치 위스키 익스피리언스 탐방', '위스키 역사와 테이스팅 투어. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (135, 3, '은하수 제면소 견학과 시음', '은하수 제면소(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 캐논볼 레스토랑과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (135, 4, '스코틀랜드 전통 요리 체험', '스코틀랜드식 하깅스, 무, 감자 요리. 직접 맛보고 고르는 시간을 가진 뒤 저녁은 현지 식당에서 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (135, 5, '쿠킹 클래스', '현지 셰프에게 에든버러의 대표 요리를 배우고 직접 만든 요리로 저녁을 먹습니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (135, 6, '근교 산지 미식 여행', '에든버러 근교의 산지로 이동해 제철 재료와 지역 음식을 맛보고 농장·공방을 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (135, 7, '캐논볼 레스토랑 깊이 보기', '에든버러 성 전망의 수상 스코틀랜드 음식점. 전문 가이드의 설명과 함께 두 번째 코스를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (135, 8, '시장 쇼핑과 자유 시간', '현지 시장과 상점가에서 기념품과 식재료를 둘러보고 자유 시간을 보냅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (135, 9, '로컬 맛집 릴레이', '가이드가 고른 현지 단골 식당 세 곳을 이어서 맛보는 미식 산책입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (135, 10, '디저트·카페 투어', '에든버러의 유명 디저트와 카페를 돌며 여유로운 오후를 보냅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (135, 11, '현지 가정식 초대', '현지 가정집 식탁에서 가정식을 함께 먹으며 이야기를 나눕니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (135, 12, '자유 일정', '하루는 자유롭게 보냅니다. 가이드가 추천 맛집 지도를 드립니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (135, 13, '야시장·야경 산책', '저녁 시장과 야경 명소를 걸으며 길거리 음식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (135, 14, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 35, NULL, 'SPORTS_ACTIVITY', '싱가포르 스포츠·액티비티 투어: 싱가포르 그랑프리 · 수상스포츠', '세계 유일의 F1 야간 나이트 레이스 경주대회. 카약, 다이빙, 윈드서핑, 제트스키.', '산들 트레킹', '싱가포르 그랑프리 — 세계 유일의 F1 야간 나이트 레이스 경주대회
수상스포츠 — 카약, 다이빙, 윈드서핑, 제트스키
드래곤보트 레이싱 — 전통 드래곤 보트 경주', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
경기 관람 티켓 또는 액티비티 이용권·장비 대여', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 싱가포르 그랑프리, 수상스포츠, 드래곤보트 레이싱 (상품·브랜드는 가상)', 'ON_SALE', 46);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (46, 6, 7, 700000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (136, 1, '싱가포르 도착', '인천에서 출발해 싱가포르에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (136, 2, '싱가포르 그랑프리', '세계 유일의 F1 야간 나이트 레이스 경주대회. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (136, 3, '수상스포츠 체험', '카약, 다이빙, 윈드서핑, 제트스키. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (136, 4, '드래곤보트 레이싱', '전통 드래곤 보트 경주. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (136, 5, '근교 트레킹·야외 활동', '싱가포르 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (136, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (136, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (46, 9, 10, 960000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (137, 1, '싱가포르 도착', '인천에서 출발해 싱가포르에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (137, 2, '싱가포르 그랑프리', '세계 유일의 F1 야간 나이트 레이스 경주대회. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (137, 3, '수상스포츠 체험', '카약, 다이빙, 윈드서핑, 제트스키. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (137, 4, '드래곤보트 레이싱', '전통 드래곤 보트 경주. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (137, 5, '근교 트레킹·야외 활동', '싱가포르 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (137, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (137, 7, '체험 레슨', '현지 코치에게 짧은 레슨을 받고 미니 게임으로 마무리합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (137, 8, '자유 일정과 휴식', '활동 사이 하루는 자유롭게 쉬며 근육을 풀 시간을 가집니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (137, 9, '싱가포르 그랑프리 심화 코스', '가이드와 함께 한 단계 높은 코스에 도전합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (137, 10, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (46, 13, 14, 1300000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (138, 1, '싱가포르 도착', '인천에서 출발해 싱가포르에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (138, 2, '싱가포르 그랑프리', '세계 유일의 F1 야간 나이트 레이스 경주대회. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (138, 3, '수상스포츠 체험', '카약, 다이빙, 윈드서핑, 제트스키. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (138, 4, '드래곤보트 레이싱', '전통 드래곤 보트 경주. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (138, 5, '근교 트레킹·야외 활동', '싱가포르 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (138, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (138, 7, '체험 레슨', '현지 코치에게 짧은 레슨을 받고 미니 게임으로 마무리합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (138, 8, '자유 일정과 휴식', '활동 사이 하루는 자유롭게 쉬며 근육을 풀 시간을 가집니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (138, 9, '싱가포르 그랑프리 심화 코스', '가이드와 함께 한 단계 높은 코스에 도전합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (138, 10, '강변·해변 러닝과 요가', '아침 러닝이나 요가로 몸을 깨운 뒤 도시를 가볍게 둘러봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (138, 11, '현지 팀 팬 모임', '현지 팬들과 함께 응원 문화를 체험하고 기념품을 고릅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (138, 12, '물가 액티비티', '수상·해안 액티비티를 즐기고 온천이나 스파로 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (138, 13, '로컬 스포츠 클래스', '현지에서 사랑받는 전통 스포츠를 배우는 체험 수업입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (138, 14, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 36, NULL, 'SPORTS_ACTIVITY', '마카오 스포츠·액티비티 투어: 마카오 그랑프리 · F3 마카오 그랑프리', '자동차와 오토바이 국제 레이싱 이벤트. 포뮬러 3 세계 국제 경주.', NULL, '마카오 그랑프리 — 자동차와 오토바이 국제 레이싱 이벤트
F3 마카오 그랑프리 — 포뮬러 3 세계 국제 경주
오토바이 그랑프리 — 국제 오토바이 경주 대회', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
경기 관람 티켓 또는 액티비티 이용권·장비 대여', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 마카오 그랑프리, F3 마카오 그랑프리, 오토바이 그랑프리 (상품·브랜드는 가상)', 'ON_SALE', 47);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (47, 2, 3, 320000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (139, 1, '마카오 도착', '인천에서 출발해 마카오에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (139, 2, '마카오 그랑프리', '자동차와 오토바이 국제 레이싱 이벤트. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (139, 3, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (47, 3, 4, 400000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (140, 1, '마카오 도착', '인천에서 출발해 마카오에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (140, 2, '마카오 그랑프리', '자동차와 오토바이 국제 레이싱 이벤트. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (140, 3, 'F3 마카오 그랑프리 체험', '포뮬러 3 세계 국제 경주. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (140, 4, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (47, 6, 7, 640000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (141, 1, '마카오 도착', '인천에서 출발해 마카오에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (141, 2, '마카오 그랑프리', '자동차와 오토바이 국제 레이싱 이벤트. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (141, 3, 'F3 마카오 그랑프리 체험', '포뮬러 3 세계 국제 경주. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (141, 4, '오토바이 그랑프리', '국제 오토바이 경주 대회. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (141, 5, '근교 트레킹·야외 활동', '마카오 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (141, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (141, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 37, NULL, 'FOOD_DRINK', '타이베이 미식·주류 투어: 라오허 야시장 · 닝시아 야시장', '다양한 지역 음식을 파는 야시장. 굴 계란말이, 타로볼, 참깨떡 전문.', '푸른보리 양조장', '라오허 야시장 — 다양한 지역 음식을 파는 야시장
닝시아 야시장 — 굴 계란말이, 타로볼, 참깨떡 전문
브레이즈드 비프 누들 — 타이베이 대표 국물 국수', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
일정에 표시된 식사와 시음', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 라오허 야시장, 닝시아 야시장, 브레이즈드 비프 누들 (상품·브랜드는 가상)', 'ON_SALE', 48);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (48, 2, 3, 290000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (142, 1, '타이베이 도착', '인천에서 출발해 타이베이에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (142, 2, '라오허 야시장 탐방', '다양한 지역 음식을 파는 야시장. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (142, 3, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (48, 3, 4, 360000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (143, 1, '타이베이 도착', '인천에서 출발해 타이베이에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (143, 2, '라오허 야시장 탐방', '다양한 지역 음식을 파는 야시장. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (143, 3, '푸른보리 양조장 견학과 시음', '푸른보리 양조장(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 닝시아 야시장과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (143, 4, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (48, 6, 7, 560000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (144, 1, '타이베이 도착', '인천에서 출발해 타이베이에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (144, 2, '라오허 야시장 탐방', '다양한 지역 음식을 파는 야시장. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (144, 3, '푸른보리 양조장 견학과 시음', '푸른보리 양조장(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 닝시아 야시장과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (144, 4, '브레이즈드 비프 누들 체험', '타이베이 대표 국물 국수. 직접 맛보고 고르는 시간을 가진 뒤 저녁은 현지 식당에서 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (144, 5, '쿠킹 클래스', '현지 셰프에게 타이베이의 대표 요리를 배우고 직접 만든 요리로 저녁을 먹습니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (144, 6, '근교 산지 미식 여행', '타이베이 근교의 산지로 이동해 제철 재료와 지역 음식을 맛보고 농장·공방을 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (144, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 38, NULL, 'SPORTS_ACTIVITY', '다낭 스포츠·액티비티 투어: 서핑 (마이 케 비치) · 대리산 등산', '아시아 최고 해변에서 서핑 학교 운영. 5개 석회암 산 클러스터, 동굴 사원 탐험.', '거코 스포츠', '서핑 (마이 케 비치) — 아시아 최고 해변에서 서핑 학교 운영
대리산 등산 — 5개 석회암 산 클러스터, 동굴 사원 탐험
수상스포츠 — 패들보드, 제트스키 등 다양한 활동', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
경기 관람 티켓 또는 액티비티 이용권·장비 대여', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 서핑 (마이 케 비치), 대리산 등산, 수상스포츠 (상품·브랜드는 가상)', 'ON_SALE', 49);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (49, 2, 3, 340000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (145, 1, '다낭 도착', '인천에서 출발해 다낭에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (145, 2, '서핑 (마이 케 비치)', '아시아 최고 해변에서 서핑 학교 운영. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (145, 3, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (49, 3, 4, 420000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (146, 1, '다낭 도착', '인천에서 출발해 다낭에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (146, 2, '서핑 (마이 케 비치)', '아시아 최고 해변에서 서핑 학교 운영. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (146, 3, '대리산 등산 체험', '5개 석회암 산 클러스터, 동굴 사원 탐험. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (146, 4, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (49, 6, 7, 660000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (147, 1, '다낭 도착', '인천에서 출발해 다낭에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (147, 2, '서핑 (마이 케 비치)', '아시아 최고 해변에서 서핑 학교 운영. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (147, 3, '대리산 등산 체험', '5개 석회암 산 클러스터, 동굴 사원 탐험. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (147, 4, '수상스포츠', '패들보드, 제트스키 등 다양한 활동. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (147, 5, '근교 트레킹·야외 활동', '다낭 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (147, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (147, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 39, NULL, 'SPORTS_ACTIVITY', '나트랑 스포츠·액티비티 투어: 다이빙 (혼 문 섬) · 스노클링', '베트남 다이빙 수도, 350종 산호 200종 물고기. 초보자용 혼 문 섬 스노클링 투어.', NULL, '다이빙 (혼 문 섬) — 베트남 다이빙 수도, 350종 산호 200종 물고기
스노클링 — 초보자용 혼 문 섬 스노클링 투어
제트스키와 패러세일 — 해양 스포츠 센터 활동', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
경기 관람 티켓 또는 액티비티 이용권·장비 대여', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 다이빙 (혼 문 섬), 스노클링, 제트스키와 패러세일 (상품·브랜드는 가상)', 'ON_SALE', 50);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (50, 2, 3, 350000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (148, 1, '나트랑 도착', '인천에서 출발해 나트랑에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (148, 2, '다이빙 (혼 문 섬)', '베트남 다이빙 수도, 350종 산호 200종 물고기. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (148, 3, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (50, 3, 4, 440000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (149, 1, '나트랑 도착', '인천에서 출발해 나트랑에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (149, 2, '다이빙 (혼 문 섬)', '베트남 다이빙 수도, 350종 산호 200종 물고기. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (149, 3, '스노클링 체험', '초보자용 혼 문 섬 스노클링 투어. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (149, 4, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (50, 6, 7, 690000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (150, 1, '나트랑 도착', '인천에서 출발해 나트랑에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (150, 2, '다이빙 (혼 문 섬)', '베트남 다이빙 수도, 350종 산호 200종 물고기. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (150, 3, '스노클링 체험', '초보자용 혼 문 섬 스노클링 투어. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (150, 4, '제트스키와 패러세일', '해양 스포츠 센터 활동. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (150, 5, '근교 트레킹·야외 활동', '나트랑 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (150, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (150, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 40, NULL, 'FOOD_DRINK', '푸꾸옥 미식·주류 투어: 푸꾸옥 생선 소스 · 푸꾸옥 야시장 해산물', '세계 최고 품질 생선 소스의 본고장. 지역 특산 해산물 요리 전문.', '햇살 올리브농장', '푸꾸옥 생선 소스 — 세계 최고 품질 생선 소스의 본고장
푸꾸옥 야시장 해산물 — 지역 특산 해산물 요리 전문
안초비 가공 — 생선 소스 생산 과정 투어 가능', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
일정에 표시된 식사와 시음', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 푸꾸옥 생선 소스, 푸꾸옥 야시장 해산물, 안초비 가공 (상품·브랜드는 가상)', 'ON_SALE', 51);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (51, 2, 3, 310000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (151, 1, '푸꾸옥 도착', '인천에서 출발해 푸꾸옥에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (151, 2, '푸꾸옥 생선 소스 탐방', '세계 최고 품질 생선 소스의 본고장. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (151, 3, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (51, 3, 4, 380000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (152, 1, '푸꾸옥 도착', '인천에서 출발해 푸꾸옥에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (152, 2, '푸꾸옥 생선 소스 탐방', '세계 최고 품질 생선 소스의 본고장. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (152, 3, '햇살 올리브농장 견학과 시음', '햇살 올리브농장(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 푸꾸옥 야시장 해산물과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (152, 4, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (51, 6, 7, 600000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (153, 1, '푸꾸옥 도착', '인천에서 출발해 푸꾸옥에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (153, 2, '푸꾸옥 생선 소스 탐방', '세계 최고 품질 생선 소스의 본고장. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (153, 3, '햇살 올리브농장 견학과 시음', '햇살 올리브농장(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 푸꾸옥 야시장 해산물과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (153, 4, '안초비 가공 체험', '생선 소스 생산 과정 투어 가능. 직접 맛보고 고르는 시간을 가진 뒤 저녁은 현지 식당에서 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (153, 5, '쿠킹 클래스', '현지 셰프에게 푸꾸옥의 대표 요리를 배우고 직접 만든 요리로 저녁을 먹습니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (153, 6, '근교 산지 미식 여행', '푸꾸옥 근교의 산지로 이동해 제철 재료와 지역 음식을 맛보고 농장·공방을 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (153, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 41, NULL, 'ART_REST', '발리 예술·휴식 투어: 테갈랄랑 쌀 계단 논 · 발리 요가 수행', '우붓 근처 아름다운 호수식 계단 논. 1000년 힌두 요가 전통, 요가 수도.', '달무리 공연장', '테갈랄랑 쌀 계단 논 — 우붓 근처 아름다운 호수식 계단 논
발리 요가 수행 — 1000년 힌두 요가 전통, 요가 수도
1000개 사원 — 발리 힌두 문화 종교 유산', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
미술관·공연 입장권 또는 스파 이용권', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 테갈랄랑 쌀 계단 논, 발리 요가 수행, 1000개 사원 (상품·브랜드는 가상)', 'ON_SALE', 52);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (52, 6, 7, 550000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (154, 1, '발리 도착', '인천에서 출발해 발리에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (154, 2, '테갈랄랑 쌀 계단 논', '우붓 근처 아름다운 호수식 계단 논. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (154, 3, '발리 요가 수행', '1000년 힌두 요가 전통, 요가 수도. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (154, 4, '1000개 사원', '발리 힌두 문화 종교 유산. 공연이나 전시 일정에 맞춰 관람 시간을 조정합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (154, 5, '공연·전시 관람', '발리에서 열리는 공연 또는 전시 중 일정에 맞는 한 편을 관람합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (154, 6, '스파·휴식의 날', '스파나 온천, 마사지 등 느린 휴식으로 여행의 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (154, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (52, 9, 10, 750000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (155, 1, '발리 도착', '인천에서 출발해 발리에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (155, 2, '테갈랄랑 쌀 계단 논', '우붓 근처 아름다운 호수식 계단 논. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (155, 3, '발리 요가 수행', '1000년 힌두 요가 전통, 요가 수도. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (155, 4, '1000개 사원', '발리 힌두 문화 종교 유산. 공연이나 전시 일정에 맞춰 관람 시간을 조정합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (155, 5, '공연·전시 관람', '발리에서 열리는 공연 또는 전시 중 일정에 맞는 한 편을 관람합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (155, 6, '스파·휴식의 날', '스파나 온천, 마사지 등 느린 휴식으로 여행의 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (155, 7, '근교 소도시 산책', '발리 근교의 작은 마을을 산책하며 갤러리와 공방을 둘러봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (155, 8, '전통 체험 클래스', '현지 공예 또는 전통 문화 체험 수업에 참여해 작품을 만듭니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (155, 9, '자유 일정', '하루는 자유롭게 보냅니다. 가이드가 추천 산책로와 전시 정보를 드립니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (155, 10, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (52, 13, 14, 1020000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (156, 1, '발리 도착', '인천에서 출발해 발리에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (156, 2, '테갈랄랑 쌀 계단 논', '우붓 근처 아름다운 호수식 계단 논. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (156, 3, '발리 요가 수행', '1000년 힌두 요가 전통, 요가 수도. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (156, 4, '1000개 사원', '발리 힌두 문화 종교 유산. 공연이나 전시 일정에 맞춰 관람 시간을 조정합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (156, 5, '공연·전시 관람', '발리에서 열리는 공연 또는 전시 중 일정에 맞는 한 편을 관람합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (156, 6, '스파·휴식의 날', '스파나 온천, 마사지 등 느린 휴식으로 여행의 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (156, 7, '근교 소도시 산책', '발리 근교의 작은 마을을 산책하며 갤러리와 공방을 둘러봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (156, 8, '전통 체험 클래스', '현지 공예 또는 전통 문화 체험 수업에 참여해 작품을 만듭니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (156, 9, '자유 일정', '하루는 자유롭게 보냅니다. 가이드가 추천 산책로와 전시 정보를 드립니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (156, 10, '정원·공원 힐링 산책', '도심 공원과 정원을 걸으며 사색하는 시간을 가집니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (156, 11, '야경과 재즈·클래식의 밤', '저녁에는 야경 명소를 보고 가벼운 공연을 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (156, 12, '미술관 한 곳 더', '테갈랄랑 쌀 계단 논 외에 가이드가 고른 작은 미술관을 한 곳 더 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (156, 13, '티타임과 독서의 오후', '현지 찻집에서 천천히 차를 마시며 하루를 정리합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (156, 14, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 42, NULL, 'FOOD_DRINK', '하노이 미식·주류 투어: 포 (쌀국수) · 분 차 하노이', '베트남 국민 음식, 위로의 국물 요리. 구이 돼지와 쌀국수 조합.', '새벽 커피로스터스', '포 (쌀국수) — 베트남 국민 음식, 위로의 국물 요리
분 차 하노이 — 구이 돼지와 쌀국수 조합
커피 거리 (카페 거리) — 계란 커피, 우유 커피 전문거리', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
일정에 표시된 식사와 시음', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 포 (쌀국수), 분 차 하노이, 커피 거리 (카페 거리) (상품·브랜드는 가상)', 'ON_SALE', 53);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (53, 2, 3, 310000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (157, 1, '하노이 도착', '인천에서 출발해 하노이에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (157, 2, '포 (쌀국수) 탐방', '베트남 국민 음식, 위로의 국물 요리. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (157, 3, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (53, 3, 4, 390000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (158, 1, '하노이 도착', '인천에서 출발해 하노이에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (158, 2, '포 (쌀국수) 탐방', '베트남 국민 음식, 위로의 국물 요리. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (158, 3, '새벽 커피로스터스 견학과 시음', '새벽 커피로스터스(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 분 차 하노이과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (158, 4, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (53, 6, 7, 620000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (159, 1, '하노이 도착', '인천에서 출발해 하노이에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (159, 2, '포 (쌀국수) 탐방', '베트남 국민 음식, 위로의 국물 요리. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (159, 3, '새벽 커피로스터스 견학과 시음', '새벽 커피로스터스(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 분 차 하노이과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (159, 4, '커피 거리 (카페 거리) 체험', '계란 커피, 우유 커피 전문거리. 직접 맛보고 고르는 시간을 가진 뒤 저녁은 현지 식당에서 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (159, 5, '쿠킹 클래스', '현지 셰프에게 하노이의 대표 요리를 배우고 직접 만든 요리로 저녁을 먹습니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (159, 6, '근교 산지 미식 여행', '하노이 근교의 산지로 이동해 제철 재료와 지역 음식을 맛보고 농장·공방을 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (159, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 43, NULL, 'ART_REST', '호치민 예술·휴식 투어: 전쟁 유적 박물관 · 베트남 역사 박물관', '베트남 전쟁 역사 전시, 100만 연방객. 베트남 근현대 역사 유산.', '고요숲 스파', '전쟁 유적 박물관 — 베트남 전쟁 역사 전시, 100만 연방객
베트남 역사 박물관 — 베트남 근현대 역사 유산
수상 인형극 — UNESCO 무형문화유산 전통 예술', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
미술관·공연 입장권 또는 스파 이용권', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 전쟁 유적 박물관, 베트남 역사 박물관, 수상 인형극 (상품·브랜드는 가상)', 'ON_SALE', 54);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (54, 2, 3, 330000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (160, 1, '호치민 도착', '인천에서 출발해 호치민에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (160, 2, '전쟁 유적 박물관', '베트남 전쟁 역사 전시, 100만 연방객. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (160, 3, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (54, 3, 4, 400000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (161, 1, '호치민 도착', '인천에서 출발해 호치민에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (161, 2, '전쟁 유적 박물관', '베트남 전쟁 역사 전시, 100만 연방객. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (161, 3, '베트남 역사 박물관', '베트남 근현대 역사 유산. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (161, 4, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (54, 6, 7, 640000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (162, 1, '호치민 도착', '인천에서 출발해 호치민에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (162, 2, '전쟁 유적 박물관', '베트남 전쟁 역사 전시, 100만 연방객. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (162, 3, '베트남 역사 박물관', '베트남 근현대 역사 유산. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (162, 4, '수상 인형극', 'UNESCO 무형문화유산 전통 예술. 공연이나 전시 일정에 맞춰 관람 시간을 조정합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (162, 5, '공연·전시 관람', '호치민에서 열리는 공연 또는 전시 중 일정에 맞는 한 편을 관람합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (162, 6, '스파·휴식의 날', '스파나 온천, 마사지 등 느린 휴식으로 여행의 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (162, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 44, NULL, 'FOOD_DRINK', '쿠알라룸푸르 미식·주류 투어: 치우 킷 마켓 · 사테', '쿠알라룸푸르 최대 규모의 습식 시장. 땅콩소스를 곁들인 구운 꼬치.', '소금꽃 식초공방', '치우 킷 마켓 — 쿠알라룸푸르 최대 규모의 습식 시장
사테 — 땅콩소스를 곁들인 구운 꼬치
락사 — 전통 국수 수프 요리', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
일정에 표시된 식사와 시음', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 치우 킷 마켓, 사테, 락사 (상품·브랜드는 가상)', 'ON_SALE', 55);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (55, 6, 7, 540000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (163, 1, '쿠알라룸푸르 도착', '인천에서 출발해 쿠알라룸푸르에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (163, 2, '치우 킷 마켓 탐방', '쿠알라룸푸르 최대 규모의 습식 시장. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (163, 3, '소금꽃 식초공방 견학과 시음', '소금꽃 식초공방(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 사테과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (163, 4, '락사 체험', '전통 국수 수프 요리. 직접 맛보고 고르는 시간을 가진 뒤 저녁은 현지 식당에서 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (163, 5, '쿠킹 클래스', '현지 셰프에게 쿠알라룸푸르의 대표 요리를 배우고 직접 만든 요리로 저녁을 먹습니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (163, 6, '근교 산지 미식 여행', '쿠알라룸푸르 근교의 산지로 이동해 제철 재료와 지역 음식을 맛보고 농장·공방을 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (163, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (55, 9, 10, 740000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (164, 1, '쿠알라룸푸르 도착', '인천에서 출발해 쿠알라룸푸르에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (164, 2, '치우 킷 마켓 탐방', '쿠알라룸푸르 최대 규모의 습식 시장. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (164, 3, '소금꽃 식초공방 견학과 시음', '소금꽃 식초공방(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 사테과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (164, 4, '락사 체험', '전통 국수 수프 요리. 직접 맛보고 고르는 시간을 가진 뒤 저녁은 현지 식당에서 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (164, 5, '쿠킹 클래스', '현지 셰프에게 쿠알라룸푸르의 대표 요리를 배우고 직접 만든 요리로 저녁을 먹습니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (164, 6, '근교 산지 미식 여행', '쿠알라룸푸르 근교의 산지로 이동해 제철 재료와 지역 음식을 맛보고 농장·공방을 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (164, 7, '사테 깊이 보기', '땅콩소스를 곁들인 구운 꼬치. 전문 가이드의 설명과 함께 두 번째 코스를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (164, 8, '시장 쇼핑과 자유 시간', '현지 시장과 상점가에서 기념품과 식재료를 둘러보고 자유 시간을 보냅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (164, 9, '로컬 맛집 릴레이', '가이드가 고른 현지 단골 식당 세 곳을 이어서 맛보는 미식 산책입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (164, 10, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (55, 13, 14, 1010000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (165, 1, '쿠알라룸푸르 도착', '인천에서 출발해 쿠알라룸푸르에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (165, 2, '치우 킷 마켓 탐방', '쿠알라룸푸르 최대 규모의 습식 시장. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (165, 3, '소금꽃 식초공방 견학과 시음', '소금꽃 식초공방(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 사테과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (165, 4, '락사 체험', '전통 국수 수프 요리. 직접 맛보고 고르는 시간을 가진 뒤 저녁은 현지 식당에서 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (165, 5, '쿠킹 클래스', '현지 셰프에게 쿠알라룸푸르의 대표 요리를 배우고 직접 만든 요리로 저녁을 먹습니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (165, 6, '근교 산지 미식 여행', '쿠알라룸푸르 근교의 산지로 이동해 제철 재료와 지역 음식을 맛보고 농장·공방을 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (165, 7, '사테 깊이 보기', '땅콩소스를 곁들인 구운 꼬치. 전문 가이드의 설명과 함께 두 번째 코스를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (165, 8, '시장 쇼핑과 자유 시간', '현지 시장과 상점가에서 기념품과 식재료를 둘러보고 자유 시간을 보냅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (165, 9, '로컬 맛집 릴레이', '가이드가 고른 현지 단골 식당 세 곳을 이어서 맛보는 미식 산책입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (165, 10, '디저트·카페 투어', '쿠알라룸푸르의 유명 디저트와 카페를 돌며 여유로운 오후를 보냅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (165, 11, '현지 가정식 초대', '현지 가정집 식탁에서 가정식을 함께 먹으며 이야기를 나눕니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (165, 12, '자유 일정', '하루는 자유롭게 보냅니다. 가이드가 추천 맛집 지도를 드립니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (165, 13, '야시장·야경 산책', '저녁 시장과 야경 명소를 걸으며 길거리 음식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (165, 14, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 45, NULL, 'SPORTS_ACTIVITY', '샌프란시스코 스포츠·액티비티 투어: 골든 게이트 브릿지 사이클링 · 샌프란시스코 자이언츠', '자전거 타기 및 하이킹. 야구 경기 관람.', '거코 스포츠', '골든 게이트 브릿지 사이클링 — 자전거 타기 및 하이킹
샌프란시스코 자이언츠 — 야구 경기 관람
베이 에어리어 사이클링 — 도시 전역 자전거 길', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
경기 관람 티켓 또는 액티비티 이용권·장비 대여', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 골든 게이트 브릿지 사이클링, 샌프란시스코 자이언츠, 베이 에어리어 사이클링 (상품·브랜드는 가상)', 'ON_SALE', 56);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (56, 6, 7, 950000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (166, 1, '샌프란시스코 도착', '인천에서 출발해 샌프란시스코에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (166, 2, '골든 게이트 브릿지 사이클링', '자전거 타기 및 하이킹. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (166, 3, '샌프란시스코 자이언츠 체험', '야구 경기 관람. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (166, 4, '베이 에어리어 사이클링', '도시 전역 자전거 길. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (166, 5, '근교 트레킹·야외 활동', '샌프란시스코 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (166, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (166, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (56, 9, 10, 1340000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (167, 1, '샌프란시스코 도착', '인천에서 출발해 샌프란시스코에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (167, 2, '골든 게이트 브릿지 사이클링', '자전거 타기 및 하이킹. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (167, 3, '샌프란시스코 자이언츠 체험', '야구 경기 관람. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (167, 4, '베이 에어리어 사이클링', '도시 전역 자전거 길. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (167, 5, '근교 트레킹·야외 활동', '샌프란시스코 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (167, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (167, 7, '체험 레슨', '현지 코치에게 짧은 레슨을 받고 미니 게임으로 마무리합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (167, 8, '자유 일정과 휴식', '활동 사이 하루는 자유롭게 쉬며 근육을 풀 시간을 가집니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (167, 9, '골든 게이트 브릿지 사이클링 심화 코스', '가이드와 함께 한 단계 높은 코스에 도전합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (167, 10, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (56, 13, 14, 1850000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (168, 1, '샌프란시스코 도착', '인천에서 출발해 샌프란시스코에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (168, 2, '골든 게이트 브릿지 사이클링', '자전거 타기 및 하이킹. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (168, 3, '샌프란시스코 자이언츠 체험', '야구 경기 관람. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (168, 4, '베이 에어리어 사이클링', '도시 전역 자전거 길. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (168, 5, '근교 트레킹·야외 활동', '샌프란시스코 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (168, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (168, 7, '체험 레슨', '현지 코치에게 짧은 레슨을 받고 미니 게임으로 마무리합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (168, 8, '자유 일정과 휴식', '활동 사이 하루는 자유롭게 쉬며 근육을 풀 시간을 가집니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (168, 9, '골든 게이트 브릿지 사이클링 심화 코스', '가이드와 함께 한 단계 높은 코스에 도전합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (168, 10, '강변·해변 러닝과 요가', '아침 러닝이나 요가로 몸을 깨운 뒤 도시를 가볍게 둘러봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (168, 11, '현지 팀 팬 모임', '현지 팬들과 함께 응원 문화를 체험하고 기념품을 고릅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (168, 12, '물가 액티비티', '수상·해안 액티비티를 즐기고 온천이나 스파로 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (168, 13, '로컬 스포츠 클래스', '현지에서 사랑받는 전통 스포츠를 배우는 체험 수업입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (168, 14, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 46, NULL, 'SPORTS_ACTIVITY', '토론토 스포츠·액티비티 투어: 토론토 메이플 리프스 · 토론토 래플터스', '하키 경기 관람 (스콜뱅크 아레나). 농구 경기 관람.', '산들 트레킹', '토론토 메이플 리프스 — 하키 경기 관람 (스콜뱅크 아레나)
토론토 래플터스 — 농구 경기 관람
토론토 아일랜드 카누 — 카누 및 카약', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
경기 관람 티켓 또는 액티비티 이용권·장비 대여', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 토론토 메이플 리프스, 토론토 래플터스, 토론토 아일랜드 카누 (상품·브랜드는 가상)', 'ON_SALE', 57);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (57, 6, 7, 960000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (169, 1, '토론토 도착', '인천에서 출발해 토론토에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (169, 2, '토론토 메이플 리프스', '하키 경기 관람 (스콜뱅크 아레나). 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (169, 3, '토론토 래플터스 체험', '농구 경기 관람. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (169, 4, '토론토 아일랜드 카누', '카누 및 카약. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (169, 5, '근교 트레킹·야외 활동', '토론토 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (169, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (169, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (57, 9, 10, 1350000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (170, 1, '토론토 도착', '인천에서 출발해 토론토에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (170, 2, '토론토 메이플 리프스', '하키 경기 관람 (스콜뱅크 아레나). 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (170, 3, '토론토 래플터스 체험', '농구 경기 관람. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (170, 4, '토론토 아일랜드 카누', '카누 및 카약. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (170, 5, '근교 트레킹·야외 활동', '토론토 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (170, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (170, 7, '체험 레슨', '현지 코치에게 짧은 레슨을 받고 미니 게임으로 마무리합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (170, 8, '자유 일정과 휴식', '활동 사이 하루는 자유롭게 쉬며 근육을 풀 시간을 가집니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (170, 9, '토론토 메이플 리프스 심화 코스', '가이드와 함께 한 단계 높은 코스에 도전합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (170, 10, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (57, 13, 14, 1870000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (171, 1, '토론토 도착', '인천에서 출발해 토론토에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (171, 2, '토론토 메이플 리프스', '하키 경기 관람 (스콜뱅크 아레나). 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (171, 3, '토론토 래플터스 체험', '농구 경기 관람. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (171, 4, '토론토 아일랜드 카누', '카누 및 카약. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (171, 5, '근교 트레킹·야외 활동', '토론토 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (171, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (171, 7, '체험 레슨', '현지 코치에게 짧은 레슨을 받고 미니 게임으로 마무리합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (171, 8, '자유 일정과 휴식', '활동 사이 하루는 자유롭게 쉬며 근육을 풀 시간을 가집니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (171, 9, '토론토 메이플 리프스 심화 코스', '가이드와 함께 한 단계 높은 코스에 도전합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (171, 10, '강변·해변 러닝과 요가', '아침 러닝이나 요가로 몸을 깨운 뒤 도시를 가볍게 둘러봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (171, 11, '현지 팀 팬 모임', '현지 팬들과 함께 응원 문화를 체험하고 기념품을 고릅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (171, 12, '물가 액티비티', '수상·해안 액티비티를 즐기고 온천이나 스파로 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (171, 13, '로컬 스포츠 클래스', '현지에서 사랑받는 전통 스포츠를 배우는 체험 수업입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (171, 14, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 47, NULL, 'SPORTS_ACTIVITY', '호놀룰루 스포츠·액티비티 투어: 와이키키 서핑 · 하나우마 베이 스노클링', '초보자 친화적 서핑. 해양 생물 관찰.', NULL, '와이키키 서핑 — 초보자 친화적 서핑
하나우마 베이 스노클링 — 해양 생물 관찰
돌핀 워칭 — 돌고래 관찰 투어', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
경기 관람 티켓 또는 액티비티 이용권·장비 대여', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 와이키키 서핑, 하나우마 베이 스노클링, 돌핀 워칭 (상품·브랜드는 가상)', 'ON_SALE', 58);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (58, 6, 7, 920000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (172, 1, '호놀룰루 도착', '인천에서 출발해 호놀룰루에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (172, 2, '와이키키 서핑', '초보자 친화적 서핑. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (172, 3, '하나우마 베이 스노클링 체험', '해양 생물 관찰. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (172, 4, '돌핀 워칭', '돌고래 관찰 투어. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (172, 5, '근교 트레킹·야외 활동', '호놀룰루 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (172, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (172, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (58, 9, 10, 1300000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (173, 1, '호놀룰루 도착', '인천에서 출발해 호놀룰루에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (173, 2, '와이키키 서핑', '초보자 친화적 서핑. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (173, 3, '하나우마 베이 스노클링 체험', '해양 생물 관찰. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (173, 4, '돌핀 워칭', '돌고래 관찰 투어. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (173, 5, '근교 트레킹·야외 활동', '호놀룰루 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (173, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (173, 7, '체험 레슨', '현지 코치에게 짧은 레슨을 받고 미니 게임으로 마무리합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (173, 8, '자유 일정과 휴식', '활동 사이 하루는 자유롭게 쉬며 근육을 풀 시간을 가집니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (173, 9, '와이키키 서핑 심화 코스', '가이드와 함께 한 단계 높은 코스에 도전합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (173, 10, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (58, 13, 14, 1800000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (174, 1, '호놀룰루 도착', '인천에서 출발해 호놀룰루에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (174, 2, '와이키키 서핑', '초보자 친화적 서핑. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (174, 3, '하나우마 베이 스노클링 체험', '해양 생물 관찰. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (174, 4, '돌핀 워칭', '돌고래 관찰 투어. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (174, 5, '근교 트레킹·야외 활동', '호놀룰루 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (174, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (174, 7, '체험 레슨', '현지 코치에게 짧은 레슨을 받고 미니 게임으로 마무리합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (174, 8, '자유 일정과 휴식', '활동 사이 하루는 자유롭게 쉬며 근육을 풀 시간을 가집니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (174, 9, '와이키키 서핑 심화 코스', '가이드와 함께 한 단계 높은 코스에 도전합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (174, 10, '강변·해변 러닝과 요가', '아침 러닝이나 요가로 몸을 깨운 뒤 도시를 가볍게 둘러봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (174, 11, '현지 팀 팬 모임', '현지 팬들과 함께 응원 문화를 체험하고 기념품을 고릅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (174, 12, '물가 액티비티', '수상·해안 액티비티를 즐기고 온천이나 스파로 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (174, 13, '로컬 스포츠 클래스', '현지에서 사랑받는 전통 스포츠를 배우는 체험 수업입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (174, 14, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 48, NULL, 'ART_REST', '멕시코시티 예술·휴식 투어: 무소 수마야 · 팔라시오 데 벨라스 아르테스', '현대 미술관. 미술 공연장.', '고요숲 스파', '무소 수마야 — 현대 미술관
팔라시오 데 벨라스 아르테스 — 미술 공연장
보스케 데 차풀테펙 — 대규모 공원 및 박물관', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
미술관·공연 입장권 또는 스파 이용권', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 무소 수마야, 팔라시오 데 벨라스 아르테스, 보스케 데 차풀테펙 (상품·브랜드는 가상)', 'ON_SALE', 59);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (59, 6, 7, 800000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (175, 1, '멕시코시티 도착', '인천에서 출발해 멕시코시티에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (175, 2, '무소 수마야', '현대 미술관. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (175, 3, '팔라시오 데 벨라스 아르테스', '미술 공연장. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (175, 4, '보스케 데 차풀테펙', '대규모 공원 및 박물관. 공연이나 전시 일정에 맞춰 관람 시간을 조정합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (175, 5, '공연·전시 관람', '멕시코시티에서 열리는 공연 또는 전시 중 일정에 맞는 한 편을 관람합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (175, 6, '스파·휴식의 날', '스파나 온천, 마사지 등 느린 휴식으로 여행의 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (175, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (59, 9, 10, 1130000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (176, 1, '멕시코시티 도착', '인천에서 출발해 멕시코시티에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (176, 2, '무소 수마야', '현대 미술관. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (176, 3, '팔라시오 데 벨라스 아르테스', '미술 공연장. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (176, 4, '보스케 데 차풀테펙', '대규모 공원 및 박물관. 공연이나 전시 일정에 맞춰 관람 시간을 조정합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (176, 5, '공연·전시 관람', '멕시코시티에서 열리는 공연 또는 전시 중 일정에 맞는 한 편을 관람합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (176, 6, '스파·휴식의 날', '스파나 온천, 마사지 등 느린 휴식으로 여행의 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (176, 7, '근교 소도시 산책', '멕시코시티 근교의 작은 마을을 산책하며 갤러리와 공방을 둘러봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (176, 8, '전통 체험 클래스', '현지 공예 또는 전통 문화 체험 수업에 참여해 작품을 만듭니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (176, 9, '자유 일정', '하루는 자유롭게 보냅니다. 가이드가 추천 산책로와 전시 정보를 드립니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (176, 10, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (59, 13, 14, 1560000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (177, 1, '멕시코시티 도착', '인천에서 출발해 멕시코시티에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (177, 2, '무소 수마야', '현대 미술관. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (177, 3, '팔라시오 데 벨라스 아르테스', '미술 공연장. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (177, 4, '보스케 데 차풀테펙', '대규모 공원 및 박물관. 공연이나 전시 일정에 맞춰 관람 시간을 조정합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (177, 5, '공연·전시 관람', '멕시코시티에서 열리는 공연 또는 전시 중 일정에 맞는 한 편을 관람합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (177, 6, '스파·휴식의 날', '스파나 온천, 마사지 등 느린 휴식으로 여행의 피로를 풉니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (177, 7, '근교 소도시 산책', '멕시코시티 근교의 작은 마을을 산책하며 갤러리와 공방을 둘러봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (177, 8, '전통 체험 클래스', '현지 공예 또는 전통 문화 체험 수업에 참여해 작품을 만듭니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (177, 9, '자유 일정', '하루는 자유롭게 보냅니다. 가이드가 추천 산책로와 전시 정보를 드립니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (177, 10, '정원·공원 힐링 산책', '도심 공원과 정원을 걸으며 사색하는 시간을 가집니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (177, 11, '야경과 재즈·클래식의 밤', '저녁에는 야경 명소를 보고 가벼운 공연을 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (177, 12, '미술관 한 곳 더', '무소 수마야 외에 가이드가 고른 작은 미술관을 한 곳 더 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (177, 13, '티타임과 독서의 오후', '현지 찻집에서 천천히 차를 마시며 하루를 정리합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (177, 14, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 49, NULL, 'FOOD_DRINK', '멜버른 미식·주류 투어: 퀸 빅토리아 마켓 · 멜버른 커피 문화', '호주 최대 규모 시장. 세계 최고 수준의 커피.', '새벽 커피로스터스', '퀸 빅토리아 마켓 — 호주 최대 규모 시장
멜버른 커피 문화 — 세계 최고 수준의 커피
다문화 마켓 — 국제 음식 경험', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
일정에 표시된 식사와 시음', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 퀸 빅토리아 마켓, 멜버른 커피 문화, 다문화 마켓 (상품·브랜드는 가상)', 'ON_SALE', 60);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (60, 6, 7, 690000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (178, 1, '멜버른 도착', '인천에서 출발해 멜버른에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (178, 2, '퀸 빅토리아 마켓 탐방', '호주 최대 규모 시장. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (178, 3, '새벽 커피로스터스 견학과 시음', '새벽 커피로스터스(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 멜버른 커피 문화과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (178, 4, '다문화 마켓 체험', '국제 음식 경험. 직접 맛보고 고르는 시간을 가진 뒤 저녁은 현지 식당에서 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (178, 5, '쿠킹 클래스', '현지 셰프에게 멜버른의 대표 요리를 배우고 직접 만든 요리로 저녁을 먹습니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (178, 6, '근교 산지 미식 여행', '멜버른 근교의 산지로 이동해 제철 재료와 지역 음식을 맛보고 농장·공방을 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (178, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (60, 9, 10, 970000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (179, 1, '멜버른 도착', '인천에서 출발해 멜버른에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (179, 2, '퀸 빅토리아 마켓 탐방', '호주 최대 규모 시장. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (179, 3, '새벽 커피로스터스 견학과 시음', '새벽 커피로스터스(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 멜버른 커피 문화과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (179, 4, '다문화 마켓 체험', '국제 음식 경험. 직접 맛보고 고르는 시간을 가진 뒤 저녁은 현지 식당에서 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (179, 5, '쿠킹 클래스', '현지 셰프에게 멜버른의 대표 요리를 배우고 직접 만든 요리로 저녁을 먹습니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (179, 6, '근교 산지 미식 여행', '멜버른 근교의 산지로 이동해 제철 재료와 지역 음식을 맛보고 농장·공방을 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (179, 7, '멜버른 커피 문화 깊이 보기', '세계 최고 수준의 커피. 전문 가이드의 설명과 함께 두 번째 코스를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (179, 8, '시장 쇼핑과 자유 시간', '현지 시장과 상점가에서 기념품과 식재료를 둘러보고 자유 시간을 보냅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (179, 9, '로컬 맛집 릴레이', '가이드가 고른 현지 단골 식당 세 곳을 이어서 맛보는 미식 산책입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (179, 10, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (60, 13, 14, 1330000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (180, 1, '멜버른 도착', '인천에서 출발해 멜버른에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (180, 2, '퀸 빅토리아 마켓 탐방', '호주 최대 규모 시장. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (180, 3, '새벽 커피로스터스 견학과 시음', '새벽 커피로스터스(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 멜버른 커피 문화과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (180, 4, '다문화 마켓 체험', '국제 음식 경험. 직접 맛보고 고르는 시간을 가진 뒤 저녁은 현지 식당에서 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (180, 5, '쿠킹 클래스', '현지 셰프에게 멜버른의 대표 요리를 배우고 직접 만든 요리로 저녁을 먹습니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (180, 6, '근교 산지 미식 여행', '멜버른 근교의 산지로 이동해 제철 재료와 지역 음식을 맛보고 농장·공방을 방문합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (180, 7, '멜버른 커피 문화 깊이 보기', '세계 최고 수준의 커피. 전문 가이드의 설명과 함께 두 번째 코스를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (180, 8, '시장 쇼핑과 자유 시간', '현지 시장과 상점가에서 기념품과 식재료를 둘러보고 자유 시간을 보냅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (180, 9, '로컬 맛집 릴레이', '가이드가 고른 현지 단골 식당 세 곳을 이어서 맛보는 미식 산책입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (180, 10, '디저트·카페 투어', '멜버른의 유명 디저트와 카페를 돌며 여유로운 오후를 보냅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (180, 11, '현지 가정식 초대', '현지 가정집 식탁에서 가정식을 함께 먹으며 이야기를 나눕니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (180, 12, '자유 일정', '하루는 자유롭게 보냅니다. 가이드가 추천 맛집 지도를 드립니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (180, 13, '야시장·야경 산책', '저녁 시장과 야경 명소를 걸으며 길거리 음식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (180, 14, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('OVERSEAS', 50, NULL, 'SPORTS_ACTIVITY', '괌 스포츠·액티비티 투어: 스쿠버 다이빙 · 스노클링', 'WWII 난파선 및 산호초. 투몬 베이 및 아름다운 해변.', NULL, '스쿠버 다이빙 — WWII 난파선 및 산호초
스노클링 — 투몬 베이 및 아름다운 해변
워터스포츠 — 제트스키 및 패러세일링', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
경기 관람 티켓 또는 액티비티 이용권·장비 대여', '국제선 항공권(해외 여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 스쿠버 다이빙, 스노클링, 워터스포츠 (상품·브랜드는 가상)', 'ON_SALE', 61);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (61, 2, 3, 370000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (181, 1, '괌 도착', '인천에서 출발해 괌에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (181, 2, '스쿠버 다이빙', 'WWII 난파선 및 산호초. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (181, 3, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (61, 3, 4, 480000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (182, 1, '괌 도착', '인천에서 출발해 괌에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (182, 2, '스쿠버 다이빙', 'WWII 난파선 및 산호초. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (182, 3, '스노클링 체험', '투몬 베이 및 아름다운 해변. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (182, 4, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (61, 6, 7, 800000, 2, 20);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (183, 1, '괌 도착', '인천에서 출발해 괌에 도착합니다(항공권 별도). 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (183, 2, '스쿠버 다이빙', 'WWII 난파선 및 산호초. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (183, 3, '스노클링 체험', '투몬 베이 및 아름다운 해변. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (183, 4, '워터스포츠', '제트스키 및 패러세일링. 장비 대여와 안전 교육이 포함됩니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (183, 5, '근교 트레킹·야외 활동', '괌 근교의 자연으로 이동해 가볍게 걷고 풍경을 즐기는 액티비티를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (183, 6, '경기장·스포츠 문화 투어', '경기장 내부와 박물관을 둘러보며 현지 스포츠 문화를 배웁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (183, 7, '체크아웃과 출발', '조식 후 체크아웃하고 공항으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');

-- [M] 국내 투어: 10개 도시 × 3테마 (1박2일·2박3일·3박4일)
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('DOMESTIC', NULL, 1, 'FOOD_DRINK', '경주 미식·주류 투어: 황남빵 · 경주 한우', '1939년부터 만들어온 팥 앙금 경주 대표 간식. 40년 전통 한우 숯불구이 전문점.', '금빛밀 베이커리', '황남빵 — 1939년부터 만들어온 팥 앙금 경주 대표 간식
경주 한우 — 40년 전통 한우 숯불구이 전문점
경주 콩국수 — 1956년부터 만든 원조 콩국 반찬소 콩 삶은물', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
일정에 표시된 식사와 시음', '서울·대전 출발 이동편(국내여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 황남빵, 경주 한우, 경주 콩국수 (상품·브랜드는 가상)', 'ON_SALE', 62);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (62, 1, 2, 100000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (184, 1, '경주 도착과 대표 체험', '서울·대전에서 출발해 경주에 도착합니다. 가이드와 만나 1939년부터 만들어온 팥 앙금 경주 대표 간식. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (184, 2, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (62, 2, 3, 150000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (185, 1, '경주 도착', '서울·대전에서 출발해 경주에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (185, 2, '황남빵 탐방', '1939년부터 만들어온 팥 앙금 경주 대표 간식. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (185, 3, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (62, 3, 4, 200000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (186, 1, '경주 도착', '서울·대전에서 출발해 경주에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (186, 2, '황남빵 탐방', '1939년부터 만들어온 팥 앙금 경주 대표 간식. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (186, 3, '금빛밀 베이커리 견학과 시음', '금빛밀 베이커리(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 경주 한우과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (186, 4, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('DOMESTIC', NULL, 1, 'SPORTS_ACTIVITY', '경주 스포츠·액티비티 투어: 불국사/석굴암 트레킹 · 안압지 도보 투어', '유네스코 유산 사찰로 가는 산길 등산. 신라시대 월정교와 주변 고분 연결 코스.', NULL, '불국사/석굴암 트레킹 — 유네스코 유산 사찰로 가는 산길 등산
안압지 도보 투어 — 신라시대 월정교와 주변 고분 연결 코스
대릉원 자전거 — 12만 평 고분 군집지 주변 자전거 타기', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
경기 관람 티켓 또는 액티비티 이용권·장비 대여', '서울·대전 출발 이동편(국내여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 불국사/석굴암 트레킹, 안압지 도보 투어, 대릉원 자전거 (상품·브랜드는 가상)', 'ON_SALE', 63);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (63, 1, 2, 110000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (187, 1, '경주 도착과 대표 체험', '서울·대전에서 출발해 경주에 도착합니다. 가이드와 만나 유네스코 유산 사찰로 가는 산길 등산. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (187, 2, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (63, 2, 3, 170000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (188, 1, '경주 도착', '서울·대전에서 출발해 경주에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (188, 2, '불국사/석굴암 트레킹', '유네스코 유산 사찰로 가는 산길 등산. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (188, 3, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (63, 3, 4, 230000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (189, 1, '경주 도착', '서울·대전에서 출발해 경주에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (189, 2, '불국사/석굴암 트레킹', '유네스코 유산 사찰로 가는 산길 등산. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (189, 3, '안압지 도보 투어 체험', '신라시대 월정교와 주변 고분 연결 코스. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (189, 4, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('DOMESTIC', NULL, 1, 'ART_REST', '경주 예술·휴식 투어: 불국사 · 석굴암', '751년 창건 유네스코 세계문화유산 불교사찰. 774년 완성 신라 석조미술의 최고 걸작.', NULL, '불국사 — 751년 창건 유네스코 세계문화유산 불교사찰
석굴암 — 774년 완성 신라 석조미술의 최고 걸작
대릉원 — 23기 신라 고분 군집, 역사박물관 겸함', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
미술관·공연 입장권 또는 스파 이용권', '서울·대전 출발 이동편(국내여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 불국사, 석굴암, 대릉원 (상품·브랜드는 가상)', 'ON_SALE', 64);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (64, 1, 2, 100000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (190, 1, '경주 도착과 대표 체험', '서울·대전에서 출발해 경주에 도착합니다. 가이드와 만나 751년 창건 유네스코 세계문화유산 불교사찰. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (190, 2, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (64, 2, 3, 160000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (191, 1, '경주 도착', '서울·대전에서 출발해 경주에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (191, 2, '불국사', '751년 창건 유네스코 세계문화유산 불교사찰. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (191, 3, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (64, 3, 4, 210000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (192, 1, '경주 도착', '서울·대전에서 출발해 경주에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (192, 2, '불국사', '751년 창건 유네스코 세계문화유산 불교사찰. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (192, 3, '석굴암', '774년 완성 신라 석조미술의 최고 걸작. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (192, 4, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('DOMESTIC', NULL, 2, 'FOOD_DRINK', '강릉 미식·주류 투어: 초당순두부 · 활어회', '부드러운 순두부와 함께하는 한상차림 정식. 싱싱한 해산물 회 한상과 미역국.', '은하수 제면소', '초당순두부 — 부드러운 순두부와 함께하는 한상차림 정식
활어회 — 싱싱한 해산물 회 한상과 미역국
감자전 — 강릉 특산 감자로 만든 바삭한 부침', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
일정에 표시된 식사와 시음', '서울·대전 출발 이동편(국내여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 초당순두부, 활어회, 감자전 (상품·브랜드는 가상)', 'ON_SALE', 65);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (65, 1, 2, 100000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (193, 1, '강릉 도착과 대표 체험', '서울·대전에서 출발해 강릉에 도착합니다. 가이드와 만나 부드러운 순두부와 함께하는 한상차림 정식. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (193, 2, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (65, 2, 3, 160000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (194, 1, '강릉 도착', '서울·대전에서 출발해 강릉에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (194, 2, '초당순두부 탐방', '부드러운 순두부와 함께하는 한상차림 정식. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (194, 3, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (65, 3, 4, 210000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (195, 1, '강릉 도착', '서울·대전에서 출발해 강릉에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (195, 2, '초당순두부 탐방', '부드러운 순두부와 함께하는 한상차림 정식. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (195, 3, '은하수 제면소 견학과 시음', '은하수 제면소(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 활어회과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (195, 4, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('DOMESTIC', NULL, 2, 'SPORTS_ACTIVITY', '강릉 스포츠·액티비티 투어: 정동진 해돋이 관광 · 경포호 자전거', '일출 열차 타고 보는 해변 일출 경험. 호수 주변 사이클링 코스와 해변 자전거.', NULL, '정동진 해돋이 관광 — 일출 열차 타고 보는 해변 일출 경험
경포호 자전거 — 호수 주변 사이클링 코스와 해변 자전거
스카이해변 서핑 — 초급 서핑 강습과 보드 체험 가능', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
경기 관람 티켓 또는 액티비티 이용권·장비 대여', '서울·대전 출발 이동편(국내여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 정동진 해돋이 관광, 경포호 자전거, 스카이해변 서핑 (상품·브랜드는 가상)', 'ON_SALE', 66);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (66, 1, 2, 120000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (196, 1, '강릉 도착과 대표 체험', '서울·대전에서 출발해 강릉에 도착합니다. 가이드와 만나 일출 열차 타고 보는 해변 일출 경험. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (196, 2, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (66, 2, 3, 180000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (197, 1, '강릉 도착', '서울·대전에서 출발해 강릉에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (197, 2, '정동진 해돋이 관광', '일출 열차 타고 보는 해변 일출 경험. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (197, 3, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (66, 3, 4, 240000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (198, 1, '강릉 도착', '서울·대전에서 출발해 강릉에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (198, 2, '정동진 해돋이 관광', '일출 열차 타고 보는 해변 일출 경험. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (198, 3, '경포호 자전거 체험', '호수 주변 사이클링 코스와 해변 자전거. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (198, 4, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('DOMESTIC', NULL, 2, 'ART_REST', '강릉 예술·휴식 투어: 오죽헌 · 선교장', '신사임당 생가, 한옥 전통 건축미 체험. 400년 된 대저택, 한옥 전통생활 박물관.', '고요숲 스파', '오죽헌 — 신사임당 생가, 한옥 전통 건축미 체험
선교장 — 400년 된 대저택, 한옥 전통생활 박물관
경포대 — 조선시대 누정 건축, 호수 야경 감상지', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
미술관·공연 입장권 또는 스파 이용권', '서울·대전 출발 이동편(국내여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 오죽헌, 선교장, 경포대 (상품·브랜드는 가상)', 'ON_SALE', 67);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (67, 1, 2, 110000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (199, 1, '강릉 도착과 대표 체험', '서울·대전에서 출발해 강릉에 도착합니다. 가이드와 만나 신사임당 생가, 한옥 전통 건축미 체험. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (199, 2, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (67, 2, 3, 170000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (200, 1, '강릉 도착', '서울·대전에서 출발해 강릉에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (200, 2, '오죽헌', '신사임당 생가, 한옥 전통 건축미 체험. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (200, 3, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (67, 3, 4, 220000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (201, 1, '강릉 도착', '서울·대전에서 출발해 강릉에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (201, 2, '오죽헌', '신사임당 생가, 한옥 전통 건축미 체험. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (201, 3, '선교장', '400년 된 대저택, 한옥 전통생활 박물관. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (201, 4, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('DOMESTIC', NULL, 3, 'FOOD_DRINK', '속초 미식·주류 투어: 오징어 짬뽕 · 오징어순대', '통째로 한 마리 들어간 국물 국수. 호젓한 맛과 함께하는 아바이마을 별미.', '은하수 제면소', '오징어 짬뽕 — 통째로 한 마리 들어간 국물 국수
오징어순대 — 호젓한 맛과 함께하는 아바이마을 별미
아바이순대 — 함경도 실향민 음식 문화 대표 간식', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
일정에 표시된 식사와 시음', '서울·대전 출발 이동편(국내여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 오징어 짬뽕, 오징어순대, 아바이순대 (상품·브랜드는 가상)', 'ON_SALE', 68);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (68, 1, 2, 110000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (202, 1, '속초 도착과 대표 체험', '서울·대전에서 출발해 속초에 도착합니다. 가이드와 만나 통째로 한 마리 들어간 국물 국수. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (202, 2, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (68, 2, 3, 160000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (203, 1, '속초 도착', '서울·대전에서 출발해 속초에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (203, 2, '오징어 짬뽕 탐방', '통째로 한 마리 들어간 국물 국수. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (203, 3, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (68, 3, 4, 210000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (204, 1, '속초 도착', '서울·대전에서 출발해 속초에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (204, 2, '오징어 짬뽕 탐방', '통째로 한 마리 들어간 국물 국수. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (204, 3, '은하수 제면소 견학과 시음', '은하수 제면소(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 오징어순대과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (204, 4, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('DOMESTIC', NULL, 3, 'SPORTS_ACTIVITY', '속초 스포츠·액티비티 투어: 설악산 케이블카 (권금성) · 설악산 트레킹', '등산 없이 정상 뷰 보기, 왕복 15분. 초급부터 고급까지 다양한 등산로.', '거코 스포츠', '설악산 케이블카 (권금성) — 등산 없이 정상 뷰 보기, 왕복 15분
설악산 트레킹 — 초급부터 고급까지 다양한 등산로
청초호 자전거 — 호수 주변 사이클링 및 조깅 코스', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
경기 관람 티켓 또는 액티비티 이용권·장비 대여', '서울·대전 출발 이동편(국내여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 설악산 케이블카 (권금성), 설악산 트레킹, 청초호 자전거 (상품·브랜드는 가상)', 'ON_SALE', 69);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (69, 1, 2, 120000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (205, 1, '속초 도착과 대표 체험', '서울·대전에서 출발해 속초에 도착합니다. 가이드와 만나 등산 없이 정상 뷰 보기, 왕복 15분. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (205, 2, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (69, 2, 3, 180000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (206, 1, '속초 도착', '서울·대전에서 출발해 속초에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (206, 2, '설악산 케이블카 (권금성)', '등산 없이 정상 뷰 보기, 왕복 15분. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (206, 3, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (69, 3, 4, 250000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (207, 1, '속초 도착', '서울·대전에서 출발해 속초에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (207, 2, '설악산 케이블카 (권금성)', '등산 없이 정상 뷰 보기, 왕복 15분. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (207, 3, '설악산 트레킹 체험', '초급부터 고급까지 다양한 등산로. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (207, 4, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('DOMESTIC', NULL, 3, 'ART_REST', '속초 예술·휴식 투어: 아바이마을 · 설악사', '드라마 가을동화 촬영지, 함경도 풍정. 신라시대 창건 불교사찰, 계곡 경관.', NULL, '아바이마을 — 드라마 가을동화 촬영지, 함경도 풍정
설악사 — 신라시대 창건 불교사찰, 계곡 경관
엑스포 타워 야경 — 속초 전경과 해상 불빛 감상', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
미술관·공연 입장권 또는 스파 이용권', '서울·대전 출발 이동편(국내여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 아바이마을, 설악사, 엑스포 타워 야경 (상품·브랜드는 가상)', 'ON_SALE', 70);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (70, 1, 2, 110000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (208, 1, '속초 도착과 대표 체험', '서울·대전에서 출발해 속초에 도착합니다. 가이드와 만나 드라마 가을동화 촬영지, 함경도 풍정. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (208, 2, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (70, 2, 3, 170000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (209, 1, '속초 도착', '서울·대전에서 출발해 속초에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (209, 2, '아바이마을', '드라마 가을동화 촬영지, 함경도 풍정. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (209, 3, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (70, 3, 4, 220000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (210, 1, '속초 도착', '서울·대전에서 출발해 속초에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (210, 2, '아바이마을', '드라마 가을동화 촬영지, 함경도 풍정. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (210, 3, '설악사', '신라시대 창건 불교사찰, 계곡 경관. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (210, 4, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('DOMESTIC', NULL, 4, 'FOOD_DRINK', '부산 미식·주류 투어: 밀면 · 돼지국밥', '돼지 사골 국물 국수, 부산 13대 향토음식. 서민의 음식, 남천동 밀면골목 특화.', '바람결 증류소', '밀면 — 돼지 사골 국물 국수, 부산 13대 향토음식
돼지국밥 — 서민의 음식, 남천동 밀면골목 특화
활어회 — 신선한 해산물 회 한상과 함께', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
일정에 표시된 식사와 시음', '서울·대전 출발 이동편(국내여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 밀면, 돼지국밥, 활어회 (상품·브랜드는 가상)', 'ON_SALE', 71);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (71, 1, 2, 100000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (211, 1, '부산 도착과 대표 체험', '서울·대전에서 출발해 부산에 도착합니다. 가이드와 만나 돼지 사골 국물 국수, 부산 13대 향토음식. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (211, 2, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (71, 2, 3, 140000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (212, 1, '부산 도착', '서울·대전에서 출발해 부산에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (212, 2, '밀면 탐방', '돼지 사골 국물 국수, 부산 13대 향토음식. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (212, 3, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (71, 3, 4, 190000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (213, 1, '부산 도착', '서울·대전에서 출발해 부산에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (213, 2, '밀면 탐방', '돼지 사골 국물 국수, 부산 13대 향토음식. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (213, 3, '바람결 증류소 견학과 시음', '바람결 증류소(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 돼지국밥과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (213, 4, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('DOMESTIC', NULL, 4, 'SPORTS_ACTIVITY', '부산 스포츠·액티비티 투어: 광안리 해변 서핑 · 해운대 비치 배구', '초급 강습과 보드 대여 가능 비치. 모래해변에서 즐기는 스포츠 활동.', NULL, '광안리 해변 서핑 — 초급 강습과 보드 대여 가능 비치
해운대 비치 배구 — 모래해변에서 즐기는 스포츠 활동
미포 해안 트레킹 — 조개구이와 함께하는 해변 산책', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
경기 관람 티켓 또는 액티비티 이용권·장비 대여', '서울·대전 출발 이동편(국내여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 광안리 해변 서핑, 해운대 비치 배구, 미포 해안 트레킹 (상품·브랜드는 가상)', 'ON_SALE', 72);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (72, 1, 2, 110000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (214, 1, '부산 도착과 대표 체험', '서울·대전에서 출발해 부산에 도착합니다. 가이드와 만나 초급 강습과 보드 대여 가능 비치. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (214, 2, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (72, 2, 3, 170000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (215, 1, '부산 도착', '서울·대전에서 출발해 부산에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (215, 2, '광안리 해변 서핑', '초급 강습과 보드 대여 가능 비치. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (215, 3, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (72, 3, 4, 220000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (216, 1, '부산 도착', '서울·대전에서 출발해 부산에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (216, 2, '광안리 해변 서핑', '초급 강습과 보드 대여 가능 비치. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (216, 3, '해운대 비치 배구 체험', '모래해변에서 즐기는 스포츠 활동. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (216, 4, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('DOMESTIC', NULL, 4, 'ART_REST', '부산 예술·휴식 투어: 감천문화마을 · 용두산 공원', '색칠된 집들의 벽화 마을, 사진 명소. 항구 조망과 용두산 공중케이블카.', NULL, '감천문화마을 — 색칠된 집들의 벽화 마을, 사진 명소
용두산 공원 — 항구 조망과 용두산 공중케이블카
자갈치 시장 — 활어회 판매 모습 보기, 시장 문화체험', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
미술관·공연 입장권 또는 스파 이용권', '서울·대전 출발 이동편(국내여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 감천문화마을, 용두산 공원, 자갈치 시장 (상품·브랜드는 가상)', 'ON_SALE', 73);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (73, 1, 2, 100000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (217, 1, '부산 도착과 대표 체험', '서울·대전에서 출발해 부산에 도착합니다. 가이드와 만나 색칠된 집들의 벽화 마을, 사진 명소. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (217, 2, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (73, 2, 3, 150000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (218, 1, '부산 도착', '서울·대전에서 출발해 부산에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (218, 2, '감천문화마을', '색칠된 집들의 벽화 마을, 사진 명소. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (218, 3, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (73, 3, 4, 200000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (219, 1, '부산 도착', '서울·대전에서 출발해 부산에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (219, 2, '감천문화마을', '색칠된 집들의 벽화 마을, 사진 명소. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (219, 3, '용두산 공원', '항구 조망과 용두산 공중케이블카. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (219, 4, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('DOMESTIC', NULL, 5, 'FOOD_DRINK', '제주 미식·주류 투어: 흑돼지 구이 · 고등어 & 성게', '담백한 맛, 쫄깃한 식감의 제주 특산돼지. 싱싱한 해산물 구이와 비빔밥.', '은하수 제면소', '흑돼지 구이 — 담백한 맛, 쫄깃한 식감의 제주 특산돼지
고등어 & 성게 — 싱싱한 해산물 구이와 비빔밥
전복 & 굴 — 소금 위에 구운 고급 해산물', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
일정에 표시된 식사와 시음', '서울·대전 출발 이동편(국내여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 흑돼지 구이, 고등어 & 성게, 전복 & 굴 (상품·브랜드는 가상)', 'ON_SALE', 74);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (74, 1, 2, 100000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (220, 1, '제주 도착과 대표 체험', '서울·대전에서 출발해 제주에 도착합니다. 가이드와 만나 담백한 맛, 쫄깃한 식감의 제주 특산돼지. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (220, 2, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (74, 2, 3, 150000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (221, 1, '제주 도착', '서울·대전에서 출발해 제주에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (221, 2, '흑돼지 구이 탐방', '담백한 맛, 쫄깃한 식감의 제주 특산돼지. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (221, 3, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (74, 3, 4, 200000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (222, 1, '제주 도착', '서울·대전에서 출발해 제주에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (222, 2, '흑돼지 구이 탐방', '담백한 맛, 쫄깃한 식감의 제주 특산돼지. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (222, 3, '은하수 제면소 견학과 시음', '은하수 제면소(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 고등어 & 성게과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (222, 4, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('DOMESTIC', NULL, 5, 'SPORTS_ACTIVITY', '제주 스포츠·액티비티 투어: 한라산 등산 · 올레길 도보', '백록담 정상 오르기, 약 5-6시간 소요. 27개 코스 437km 중 선택 도보여행.', NULL, '한라산 등산 — 백록담 정상 오르기, 약 5-6시간 소요
올레길 도보 — 27개 코스 437km 중 선택 도보여행
용머리 해안 트레킹 — 주상절리 경관 따라가는 1시간 등산', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
경기 관람 티켓 또는 액티비티 이용권·장비 대여', '서울·대전 출발 이동편(국내여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 한라산 등산, 올레길 도보, 용머리 해안 트레킹 (상품·브랜드는 가상)', 'ON_SALE', 75);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (75, 1, 2, 110000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (223, 1, '제주 도착과 대표 체험', '서울·대전에서 출발해 제주에 도착합니다. 가이드와 만나 백록담 정상 오르기, 약 5-6시간 소요. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (223, 2, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (75, 2, 3, 170000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (224, 1, '제주 도착', '서울·대전에서 출발해 제주에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (224, 2, '한라산 등산', '백록담 정상 오르기, 약 5-6시간 소요. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (224, 3, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (75, 3, 4, 230000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (225, 1, '제주 도착', '서울·대전에서 출발해 제주에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (225, 2, '한라산 등산', '백록담 정상 오르기, 약 5-6시간 소요. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (225, 3, '올레길 도보 체험', '27개 코스 437km 중 선택 도보여행. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (225, 4, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('DOMESTIC', NULL, 5, 'ART_REST', '제주 예술·휴식 투어: 용머리 주상절리 · 세계지질공원 경관', '120만년 화산으로 만든 기암괴석. 한라산, 용머리 등 지질유산 감상.', '고요숲 스파', '용머리 주상절리 — 120만년 화산으로 만든 기암괴석
세계지질공원 경관 — 한라산, 용머리 등 지질유산 감상
제주 민속박물관 — 제주인의 전통생활 문화 전시', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
미술관·공연 입장권 또는 스파 이용권', '서울·대전 출발 이동편(국내여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 용머리 주상절리, 세계지질공원 경관, 제주 민속박물관 (상품·브랜드는 가상)', 'ON_SALE', 76);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (76, 1, 2, 100000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (226, 1, '제주 도착과 대표 체험', '서울·대전에서 출발해 제주에 도착합니다. 가이드와 만나 120만년 화산으로 만든 기암괴석. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (226, 2, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (76, 2, 3, 160000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (227, 1, '제주 도착', '서울·대전에서 출발해 제주에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (227, 2, '용머리 주상절리', '120만년 화산으로 만든 기암괴석. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (227, 3, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (76, 3, 4, 210000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (228, 1, '제주 도착', '서울·대전에서 출발해 제주에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (228, 2, '용머리 주상절리', '120만년 화산으로 만든 기암괴석. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (228, 3, '세계지질공원 경관', '한라산, 용머리 등 지질유산 감상. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (228, 4, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('DOMESTIC', NULL, 6, 'FOOD_DRINK', '전주 미식·주류 투어: 전주 비빔밥 · 콩나물국밥', '채소 많고 정성 들인 전주식 비빔밥. 1956년 전통, 콩나물 가득 한 국밥.', '새벽 커피로스터스', '전주 비빔밥 — 채소 많고 정성 들인 전주식 비빔밥
콩나물국밥 — 1956년 전통, 콩나물 가득 한 국밥
막걸리 & 안주 — 300m 막걸리 골목, 푸짐한 반찬', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
일정에 표시된 식사와 시음', '서울·대전 출발 이동편(국내여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 전주 비빔밥, 콩나물국밥, 막걸리 & 안주 (상품·브랜드는 가상)', 'ON_SALE', 77);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (77, 1, 2, 100000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (229, 1, '전주 도착과 대표 체험', '서울·대전에서 출발해 전주에 도착합니다. 가이드와 만나 채소 많고 정성 들인 전주식 비빔밥. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (229, 2, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (77, 2, 3, 160000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (230, 1, '전주 도착', '서울·대전에서 출발해 전주에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (230, 2, '전주 비빔밥 탐방', '채소 많고 정성 들인 전주식 비빔밥. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (230, 3, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (77, 3, 4, 210000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (231, 1, '전주 도착', '서울·대전에서 출발해 전주에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (231, 2, '전주 비빔밥 탐방', '채소 많고 정성 들인 전주식 비빔밥. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (231, 3, '새벽 커피로스터스 견학과 시음', '새벽 커피로스터스(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 콩나물국밥과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (231, 4, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('DOMESTIC', NULL, 6, 'SPORTS_ACTIVITY', '전주 스포츠·액티비티 투어: 한옥마을 도보 · 덕진공원 자전거', '800채 이상 한옥 문화유산 도보투어. 연못 주변 산책로 자전거 코스.', '산들 트레킹', '한옥마을 도보 — 800채 이상 한옥 문화유산 도보투어
덕진공원 자전거 — 연못 주변 산책로 자전거 코스
경기전 주변 도보 — 태조 어진 봉안처 주변 1시간 투어', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
경기 관람 티켓 또는 액티비티 이용권·장비 대여', '서울·대전 출발 이동편(국내여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 한옥마을 도보, 덕진공원 자전거, 경기전 주변 도보 (상품·브랜드는 가상)', 'ON_SALE', 78);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (78, 1, 2, 120000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (232, 1, '전주 도착과 대표 체험', '서울·대전에서 출발해 전주에 도착합니다. 가이드와 만나 800채 이상 한옥 문화유산 도보투어. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (232, 2, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (78, 2, 3, 180000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (233, 1, '전주 도착', '서울·대전에서 출발해 전주에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (233, 2, '한옥마을 도보', '800채 이상 한옥 문화유산 도보투어. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (233, 3, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (78, 3, 4, 240000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (234, 1, '전주 도착', '서울·대전에서 출발해 전주에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (234, 2, '한옥마을 도보', '800채 이상 한옥 문화유산 도보투어. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (234, 3, '덕진공원 자전거 체험', '연못 주변 산책로 자전거 코스. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (234, 4, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('DOMESTIC', NULL, 6, 'ART_REST', '전주 예술·휴식 투어: 경기전 · 전동성당', '태조 이성계 어진 봉안, 조선 최고 유산. 한옥마을 상징 천주교성당, 고딕양식.', '유리잔 공방', '경기전 — 태조 이성계 어진 봉안, 조선 최고 유산
전동성당 — 한옥마을 상징 천주교성당, 고딕양식
전주 한옥마을 — 1910년부터 근대주거 발달과정 보존', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
미술관·공연 입장권 또는 스파 이용권', '서울·대전 출발 이동편(국내여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 경기전, 전동성당, 전주 한옥마을 (상품·브랜드는 가상)', 'ON_SALE', 79);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (79, 1, 2, 110000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (235, 1, '전주 도착과 대표 체험', '서울·대전에서 출발해 전주에 도착합니다. 가이드와 만나 태조 이성계 어진 봉안, 조선 최고 유산. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (235, 2, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (79, 2, 3, 170000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (236, 1, '전주 도착', '서울·대전에서 출발해 전주에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (236, 2, '경기전', '태조 이성계 어진 봉안, 조선 최고 유산. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (236, 3, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (79, 3, 4, 220000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (237, 1, '전주 도착', '서울·대전에서 출발해 전주에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (237, 2, '경기전', '태조 이성계 어진 봉안, 조선 최고 유산. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (237, 3, '전동성당', '한옥마을 상징 천주교성당, 고딕양식. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (237, 4, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('DOMESTIC', NULL, 7, 'FOOD_DRINK', '여수 미식·주류 투어: 갓김치 & 게장백반 · 삼치 선어회', '여수 명물 갓김치와 간장게장 한상. 동해 특산 삼치 활어회 한상차림.', '참나무 위스키', '갓김치 & 게장백반 — 여수 명물 갓김치와 간장게장 한상
삼치 선어회 — 동해 특산 삼치 활어회 한상차림
돌문어 요리 — 돌산 신기항 싱싱한 돌문어 회, 샤부샤부', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
일정에 표시된 식사와 시음', '서울·대전 출발 이동편(국내여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 갓김치 & 게장백반, 삼치 선어회, 돌문어 요리 (상품·브랜드는 가상)', 'ON_SALE', 80);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (80, 1, 2, 90000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (238, 1, '여수 도착과 대표 체험', '서울·대전에서 출발해 여수에 도착합니다. 가이드와 만나 여수 명물 갓김치와 간장게장 한상. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (238, 2, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (80, 2, 3, 140000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (239, 1, '여수 도착', '서울·대전에서 출발해 여수에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (239, 2, '갓김치 & 게장백반 탐방', '여수 명물 갓김치와 간장게장 한상. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (239, 3, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (80, 3, 4, 190000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (240, 1, '여수 도착', '서울·대전에서 출발해 여수에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (240, 2, '갓김치 & 게장백반 탐방', '여수 명물 갓김치와 간장게장 한상. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (240, 3, '참나무 위스키 견학과 시음', '참나무 위스키(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 삼치 선어회과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (240, 4, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('DOMESTIC', NULL, 7, 'SPORTS_ACTIVITY', '여수 스포츠·액티비티 투어: 여수 해상케이블카 · 향일암 일출 관광', '국내 첫 해상 케이블카, 투명 바닥 체험. 연간 100만명 방문, 일출제례 공연.', NULL, '여수 해상케이블카 — 국내 첫 해상 케이블카, 투명 바닥 체험
향일암 일출 관광 — 연간 100만명 방문, 일출제례 공연
다도해 스카이해변 산책 — 여러 섬 연결한 갯길 도보 체험', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
경기 관람 티켓 또는 액티비티 이용권·장비 대여', '서울·대전 출발 이동편(국내여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 여수 해상케이블카, 향일암 일출 관광, 다도해 스카이해변 산책 (상품·브랜드는 가상)', 'ON_SALE', 81);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (81, 1, 2, 110000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (241, 1, '여수 도착과 대표 체험', '서울·대전에서 출발해 여수에 도착합니다. 가이드와 만나 국내 첫 해상 케이블카, 투명 바닥 체험. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (241, 2, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (81, 2, 3, 160000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (242, 1, '여수 도착', '서울·대전에서 출발해 여수에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (242, 2, '여수 해상케이블카', '국내 첫 해상 케이블카, 투명 바닥 체험. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (242, 3, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (81, 3, 4, 210000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (243, 1, '여수 도착', '서울·대전에서 출발해 여수에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (243, 2, '여수 해상케이블카', '국내 첫 해상 케이블카, 투명 바닥 체험. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (243, 3, '향일암 일출 관광 체험', '연간 100만명 방문, 일출제례 공연. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (243, 4, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('DOMESTIC', NULL, 7, 'ART_REST', '여수 예술·휴식 투어: 여수 이순신광장 · 여수국립공원 절경', '해상 불꽃쇼와 메인 공연무대. 다도해 경관의 천 개 섬 뷰.', NULL, '여수 이순신광장 — 해상 불꽃쇼와 메인 공연무대
여수국립공원 절경 — 다도해 경관의 천 개 섬 뷰
향일암 관음도량 — 영험한 도량, 기도 명소로 알려짐', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
미술관·공연 입장권 또는 스파 이용권', '서울·대전 출발 이동편(국내여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 여수 이순신광장, 여수국립공원 절경, 향일암 관음도량 (상품·브랜드는 가상)', 'ON_SALE', 82);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (82, 1, 2, 100000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (244, 1, '여수 도착과 대표 체험', '서울·대전에서 출발해 여수에 도착합니다. 가이드와 만나 해상 불꽃쇼와 메인 공연무대. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (244, 2, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (82, 2, 3, 150000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (245, 1, '여수 도착', '서울·대전에서 출발해 여수에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (245, 2, '여수 이순신광장', '해상 불꽃쇼와 메인 공연무대. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (245, 3, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (82, 3, 4, 200000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (246, 1, '여수 도착', '서울·대전에서 출발해 여수에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (246, 2, '여수 이순신광장', '해상 불꽃쇼와 메인 공연무대. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (246, 3, '여수국립공원 절경', '다도해 경관의 천 개 섬 뷰. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (246, 4, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('DOMESTIC', NULL, 8, 'FOOD_DRINK', '순천 미식·주류 투어: 짱뚱어탕 · 장어 & 꼼장어', '순천만 갯벌 물고기, 된장 시래기 국물. 장어탕, 꼼장어 구이 전문점 풍부.', '금빛밀 베이커리', '짱뚱어탕 — 순천만 갯벌 물고기, 된장 시래기 국물
장어 & 꼼장어 — 장어탕, 꼼장어 구이 전문점 풍부
꼬막 — 갯벌 뻘에서 나는 순천 대표 특산물', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
일정에 표시된 식사와 시음', '서울·대전 출발 이동편(국내여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 짱뚱어탕, 장어 & 꼼장어, 꼬막 (상품·브랜드는 가상)', 'ON_SALE', 83);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (83, 1, 2, 100000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (247, 1, '순천 도착과 대표 체험', '서울·대전에서 출발해 순천에 도착합니다. 가이드와 만나 순천만 갯벌 물고기, 된장 시래기 국물. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (247, 2, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (83, 2, 3, 140000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (248, 1, '순천 도착', '서울·대전에서 출발해 순천에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (248, 2, '짱뚱어탕 탐방', '순천만 갯벌 물고기, 된장 시래기 국물. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (248, 3, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (83, 3, 4, 190000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (249, 1, '순천 도착', '서울·대전에서 출발해 순천에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (249, 2, '짱뚱어탕 탐방', '순천만 갯벌 물고기, 된장 시래기 국물. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (249, 3, '금빛밀 베이커리 견학과 시음', '금빛밀 베이커리(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 장어 & 꼼장어과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (249, 4, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('DOMESTIC', NULL, 8, 'SPORTS_ACTIVITY', '순천 스포츠·액티비티 투어: 순천만 습지 자전거 · 스카이큐브 (무인궤도열차)', '광활한 습지 자전거 도로, 생태 관찰. 정원과 습지 연결 선형 경험.', NULL, '순천만 습지 자전거 — 광활한 습지 자전거 도로, 생태 관찰
스카이큐브 (무인궤도열차) — 정원과 습지 연결 선형 경험
조계산 트레킹 — 초급-중급 등산로, 사찰 경유', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
경기 관람 티켓 또는 액티비티 이용권·장비 대여', '서울·대전 출발 이동편(국내여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 순천만 습지 자전거, 스카이큐브 (무인궤도열차), 조계산 트레킹 (상품·브랜드는 가상)', 'ON_SALE', 84);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (84, 1, 2, 110000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (250, 1, '순천 도착과 대표 체험', '서울·대전에서 출발해 순천에 도착합니다. 가이드와 만나 광활한 습지 자전거 도로, 생태 관찰. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (250, 2, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (84, 2, 3, 170000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (251, 1, '순천 도착', '서울·대전에서 출발해 순천에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (251, 2, '순천만 습지 자전거', '광활한 습지 자전거 도로, 생태 관찰. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (251, 3, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (84, 3, 4, 220000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (252, 1, '순천 도착', '서울·대전에서 출발해 순천에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (252, 2, '순천만 습지 자전거', '광활한 습지 자전거 도로, 생태 관찰. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (252, 3, '스카이큐브 (무인궤도열차) 체험', '정원과 습지 연결 선형 경험. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (252, 4, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('DOMESTIC', NULL, 8, 'ART_REST', '순천 예술·휴식 투어: 순천만국가정원 · 선암사', '2013년 박람회지, 연간 500만명 방문. 무지개 승선교, 2018년 세계유산 등재.', '달무리 공연장', '순천만국가정원 — 2013년 박람회지, 연간 500만명 방문
선암사 — 무지개 승선교, 2018년 세계유산 등재
송광사 — 16국사 배출, 승보사찰 천년 고찰', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
미술관·공연 입장권 또는 스파 이용권', '서울·대전 출발 이동편(국내여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 순천만국가정원, 선암사, 송광사 (상품·브랜드는 가상)', 'ON_SALE', 85);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (85, 1, 2, 100000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (253, 1, '순천 도착과 대표 체험', '서울·대전에서 출발해 순천에 도착합니다. 가이드와 만나 2013년 박람회지, 연간 500만명 방문. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (253, 2, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (85, 2, 3, 150000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (254, 1, '순천 도착', '서울·대전에서 출발해 순천에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (254, 2, '순천만국가정원', '2013년 박람회지, 연간 500만명 방문. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (254, 3, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (85, 3, 4, 200000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (255, 1, '순천 도착', '서울·대전에서 출발해 순천에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (255, 2, '순천만국가정원', '2013년 박람회지, 연간 500만명 방문. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (255, 3, '선암사', '무지개 승선교, 2018년 세계유산 등재. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (255, 4, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('DOMESTIC', NULL, 9, 'FOOD_DRINK', '통영 미식·주류 투어: 통영 굴 요리 · 멍게비빔밥', '국내 80% 생산, 굴구이, 그라탱, 파스타. 멍게, 해초, 계란 올린 다채로운 비빔밥.', '푸른보리 양조장', '통영 굴 요리 — 국내 80% 생산, 굴구이, 그라탱, 파스타
멍게비빔밥 — 멍게, 해초, 계란 올린 다채로운 비빔밥
도다리 쑥국 — 봄 별미, 도다리 살 넉넉한 계절 국', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
일정에 표시된 식사와 시음', '서울·대전 출발 이동편(국내여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 통영 굴 요리, 멍게비빔밥, 도다리 쑥국 (상품·브랜드는 가상)', 'ON_SALE', 86);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (86, 1, 2, 100000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (256, 1, '통영 도착과 대표 체험', '서울·대전에서 출발해 통영에 도착합니다. 가이드와 만나 국내 80% 생산, 굴구이, 그라탱, 파스타. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (256, 2, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (86, 2, 3, 160000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (257, 1, '통영 도착', '서울·대전에서 출발해 통영에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (257, 2, '통영 굴 요리 탐방', '국내 80% 생산, 굴구이, 그라탱, 파스타. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (257, 3, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (86, 3, 4, 210000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (258, 1, '통영 도착', '서울·대전에서 출발해 통영에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (258, 2, '통영 굴 요리 탐방', '국내 80% 생산, 굴구이, 그라탱, 파스타. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (258, 3, '푸른보리 양조장 견학과 시음', '푸른보리 양조장(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 멍게비빔밥과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (258, 4, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('DOMESTIC', NULL, 9, 'SPORTS_ACTIVITY', '통영 스포츠·액티비티 투어: 통영 케이블카 · 미륵산 트레킹', '국내 최장 1975m, 미륵산 정상 뷰. 초급-중급 코스, 다도해 조망.', NULL, '통영 케이블카 — 국내 최장 1975m, 미륵산 정상 뷰
미륵산 트레킹 — 초급-중급 코스, 다도해 조망
스카이라인 루지 — 1.5km 슬로프 루지, 해산 경관', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
경기 관람 티켓 또는 액티비티 이용권·장비 대여', '서울·대전 출발 이동편(국내여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 통영 케이블카, 미륵산 트레킹, 스카이라인 루지 (상품·브랜드는 가상)', 'ON_SALE', 87);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (87, 1, 2, 120000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (259, 1, '통영 도착과 대표 체험', '서울·대전에서 출발해 통영에 도착합니다. 가이드와 만나 국내 최장 1975m, 미륵산 정상 뷰. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (259, 2, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (87, 2, 3, 180000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (260, 1, '통영 도착', '서울·대전에서 출발해 통영에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (260, 2, '통영 케이블카', '국내 최장 1975m, 미륵산 정상 뷰. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (260, 3, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (87, 3, 4, 240000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (261, 1, '통영 도착', '서울·대전에서 출발해 통영에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (261, 2, '통영 케이블카', '국내 최장 1975m, 미륵산 정상 뷰. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (261, 3, '미륵산 트레킹 체험', '초급-중급 코스, 다도해 조망. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (261, 4, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('DOMESTIC', NULL, 9, 'ART_REST', '통영 예술·휴식 투어: 동피랑 벽화마을 · 세병관', '색칠된 벽화마을, 사진 명소 최고. 임진왜란 당시 삼도수군통제사영 유적.', '달무리 공연장', '동피랑 벽화마을 — 색칠된 벽화마을, 사진 명소 최고
세병관 — 임진왜란 당시 삼도수군통제사영 유적
중앙해상권 유적 — 충렬사, 향토역사관 임진왜란 역사', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
미술관·공연 입장권 또는 스파 이용권', '서울·대전 출발 이동편(국내여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 동피랑 벽화마을, 세병관, 중앙해상권 유적 (상품·브랜드는 가상)', 'ON_SALE', 88);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (88, 1, 2, 110000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (262, 1, '통영 도착과 대표 체험', '서울·대전에서 출발해 통영에 도착합니다. 가이드와 만나 색칠된 벽화마을, 사진 명소 최고. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (262, 2, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (88, 2, 3, 160000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (263, 1, '통영 도착', '서울·대전에서 출발해 통영에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (263, 2, '동피랑 벽화마을', '색칠된 벽화마을, 사진 명소 최고. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (263, 3, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (88, 3, 4, 220000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (264, 1, '통영 도착', '서울·대전에서 출발해 통영에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (264, 2, '동피랑 벽화마을', '색칠된 벽화마을, 사진 명소 최고. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (264, 3, '세병관', '임진왜란 당시 삼도수군통제사영 유적. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (264, 4, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('DOMESTIC', NULL, 10, 'FOOD_DRINK', '단양 미식·주류 투어: 더덕 (산나물) · 곤드레 돌판밥', '산속 약초, 살짝 쪄먹는 건강식. 더덕 마늘과 함께 돌판에 구운 밥.', '금빛밀 베이커리', '더덕 (산나물) — 산속 약초, 살짝 쪄먹는 건강식
곤드레 돌판밥 — 더덕 마늘과 함께 돌판에 구운 밥
메기 매운탕 — 남한강 토종 메기 국물 진한 매운탕', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
일정에 표시된 식사와 시음', '서울·대전 출발 이동편(국내여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 더덕 (산나물), 곤드레 돌판밥, 메기 매운탕 (상품·브랜드는 가상)', 'ON_SALE', 89);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (89, 1, 2, 110000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (265, 1, '단양 도착과 대표 체험', '서울·대전에서 출발해 단양에 도착합니다. 가이드와 만나 산속 약초, 살짝 쪄먹는 건강식. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (265, 2, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (89, 2, 3, 160000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (266, 1, '단양 도착', '서울·대전에서 출발해 단양에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (266, 2, '더덕 (산나물) 탐방', '산속 약초, 살짝 쪄먹는 건강식. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (266, 3, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (89, 3, 4, 210000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (267, 1, '단양 도착', '서울·대전에서 출발해 단양에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (267, 2, '더덕 (산나물) 탐방', '산속 약초, 살짝 쪄먹는 건강식. 현지 가이드와 함께 대표 맛집과 시장을 돌며 점심과 간식을 맛봅니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (267, 3, '금빛밀 베이커리 견학과 시음', '금빛밀 베이커리(가상)의 공방을 둘러보고 시음 코스를 즐깁니다. 곤드레 돌판밥과 어울리는 한 잔을 곁들입니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (267, 4, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('DOMESTIC', NULL, 10, 'SPORTS_ACTIVITY', '단양 스포츠·액티비티 투어: 도담삼봉 유람선 · 구담봉 산악 등산', '세 봉우리 경관 보트 투어, 30분. 거북 모양 기암, 초급 등산로.', '산들 트레킹', '도담삼봉 유람선 — 세 봉우리 경관 보트 투어, 30분
구담봉 산악 등산 — 거북 모양 기암, 초급 등산로
등선폭포 트레킹 — 계곡 물소리 따라 1시간 등산', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
경기 관람 티켓 또는 액티비티 이용권·장비 대여', '서울·대전 출발 이동편(국내여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 도담삼봉 유람선, 구담봉 산악 등산, 등선폭포 트레킹 (상품·브랜드는 가상)', 'ON_SALE', 90);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (90, 1, 2, 120000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (268, 1, '단양 도착과 대표 체험', '서울·대전에서 출발해 단양에 도착합니다. 가이드와 만나 세 봉우리 경관 보트 투어, 30분. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (268, 2, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (90, 2, 3, 180000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (269, 1, '단양 도착', '서울·대전에서 출발해 단양에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (269, 2, '도담삼봉 유람선', '세 봉우리 경관 보트 투어, 30분. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (269, 3, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (90, 3, 4, 240000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (270, 1, '단양 도착', '서울·대전에서 출발해 단양에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (270, 2, '도담삼봉 유람선', '세 봉우리 경관 보트 투어, 30분. 현지 가이드와 함께 경기장·현장 분위기를 즐깁니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (270, 3, '구담봉 산악 등산 체험', '거북 모양 기암, 초급 등산로. 초보자도 따라 할 수 있도록 강사가 안내합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (270, 4, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour (scope, destination_id, city_id, theme, title, subtitle, collab_brand, highlights, includes, excludes, source_note, status, sort_order) VALUES ('DOMESTIC', NULL, 10, 'ART_REST', '단양 예술·휴식 투어: 단양팔경 · 도담삼봉 풍경', '도담삼봉, 구담봉 등 8대 절경 관광. 남한강 위 세 봉우리 경관.', '고요숲 스파', '단양팔경 — 도담삼봉, 구담봉 등 8대 절경 관광
도담삼봉 풍경 — 남한강 위 세 봉우리 경관
선암계곡 경관 — 맑은 계곡물 따라 가는 절경 산책', '현지 한국어 가이드 동행
일정표에 있는 현지 이동 차량
일정표의 입장료·체험비
미술관·공연 입장권 또는 스파 이용권', '서울·대전 출발 이동편(국내여행 메뉴에서 별도 선택)
호텔 숙박(호텔 메뉴에서 별도 선택)
개인 경비와 쇼핑
여행자 보험
선택 관광과 가이드 팁', '웹 조사 참고: 단양팔경, 도담삼봉 풍경, 선암계곡 경관 (상품·브랜드는 가상)', 'ON_SALE', 91);
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (91, 1, 2, 110000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (271, 1, '단양 도착과 대표 체험', '서울·대전에서 출발해 단양에 도착합니다. 가이드와 만나 도담삼봉, 구담봉 등 8대 절경 관광. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (271, 2, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (91, 2, 3, 170000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (272, 1, '단양 도착', '서울·대전에서 출발해 단양에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (272, 2, '단양팔경', '도담삼봉, 구담봉 등 8대 절경 관광. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (272, 3, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
INSERT INTO tour_option (tour_id, nights, days, price_per_person, min_people, max_people) VALUES (91, 3, 4, 220000, 2, 30);
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (273, 1, '단양 도착', '서울·대전에서 출발해 단양에 도착합니다. 숙소에 짐을 풀고 가이드 미팅과 환영 안내, 가벼운 저녁 식사를 합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (273, 2, '단양팔경', '도담삼봉, 구담봉 등 8대 절경 관광. 전문 도슨트의 설명과 함께 천천히 감상합니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (273, 3, '도담삼봉 풍경', '남한강 위 세 봉우리 경관. 여유롭게 둘러본 뒤 근처 카페에서 쉬어 갑니다.');
INSERT INTO tour_day (option_id, day_no, title, description) VALUES (273, 4, '체크아웃과 출발', '조식 후 체크아웃하고 역·터미널으로 이동합니다. 아쉬운 마음으로 여행을 마무리합니다.');
