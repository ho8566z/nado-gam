package com.nadogam;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.nio.charset.StandardCharsets;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.core.io.ClassPathResource;
import org.springframework.security.web.FilterChainProxy;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

// 오렌지 테마와 마스코트(거코): 로고 옆에는 없고 빈 화면 등에 들어가며, 포인트 색이 오렌지다.
@SpringBootTest
class ThemeTest {

	@Autowired
	WebApplicationContext context;

	@Autowired
	FilterChainProxy springSecurityFilterChain;

	MockMvc mvc;

	@BeforeEach
	void setUp() {
		mvc = MockMvcBuilders.webAppContextSetup(context).addFilters(springSecurityFilterChain).build();
	}

	private String css(String name) throws Exception {
		return new String(new ClassPathResource("static/css/" + name).getInputStream().readAllBytes(), StandardCharsets.UTF_8);
	}

	@Test
	void 포인트_색은_오렌지이고_하늘색은_남지_않는다() throws Exception {
		assertThat(css("main.css")).contains("--accent: #ff5a36").contains("--accent-2: #2f3dff").doesNotContain("5cc8ff");
		assertThat(css("travel.css")).doesNotContain("92, 200, 255");
		assertThat(css("auth.css")).doesNotContain("92, 200, 255");
	}

	@Test
	void 상단_로고_옆에는_마스코트가_없고_글자만_있다() throws Exception {
		mvc.perform(get("/")).andExpect(status().isOk())
			.andExpect(content().string(org.hamcrest.Matchers.not(org.hamcrest.Matchers.containsString("mascot--logo"))))
			.andExpect(content().string(org.hamcrest.Matchers.containsString("<span>nado-gam</span>")))
			.andExpect(content().string(org.hamcrest.Matchers.containsString("mascot.css")));
	}

	@Test
	void 여행지_검색_결과가_없을_때_보여_줄_마스코트가_있다() throws Exception {
		mvc.perform(get("/travel")).andExpect(status().isOk())
			.andExpect(content().string(org.hamcrest.Matchers.containsString("id=\"dest-empty\"")))
			.andExpect(content().string(org.hamcrest.Matchers.containsString("mascot--sm")));
	}

	@Test
	void 모든_사용자_화면에_모바일_하단_탭_바가_있고_휴대폰_폭에서만_보인다() throws Exception {
		for (String path : new String[] { "/", "/travel", "/special", "/bestseller", "/login", "/signup" }) {
			mvc.perform(get(path)).andExpect(status().isOk())
				.andExpect(content().string(org.hamcrest.Matchers.containsString("class=\"tabbar\"")));
		}
		String css = css("main.css");
		assertThat(css).contains(".tabbar { display: none; }").contains("@media (max-width: 760px)");
	}

	@Test
	void 마스코트는_거코가_프로펠러_비행기를_탄_모습이고_불병아리는_없다() throws Exception {
		mvc.perform(get("/travel")).andExpect(status().isOk())
			.andExpect(content().string(org.hamcrest.Matchers.containsString("mascot-prop")))
			.andExpect(content().string(org.hamcrest.Matchers.containsString("mascot-rider")))
			.andExpect(content().string(org.hamcrest.Matchers.not(org.hamcrest.Matchers.containsString("mascot-wing"))))
			.andExpect(content().string(org.hamcrest.Matchers.not(org.hamcrest.Matchers.containsString("mascot-flame"))));
		assertThat(css("mascot.css")).contains("@keyframes prop").contains("@keyframes scarf").doesNotContain("@keyframes flap");
	}

	@Test
	void 항공편_경로는_원래_비행기_아이콘을_쓴다() throws Exception {
		assertThat(css("main.css")).contains("content: \"✈\"").doesNotContain("geoko-plane");
		String utils = new String(new ClassPathResource("static/js/globe-utils.js").getInputStream().readAllBytes(), StandardCharsets.UTF_8);
		String travel = new String(new ClassPathResource("static/js/travel-globe.js").getInputStream().readAllBytes(), StandardCharsets.UTF_8);
		assertThat(utils).doesNotContain("makeMascotPlane");
		assertThat(travel).contains("U.makePlane()");
	}

	@Test
	void 상단_메뉴는_홈_특별전_베스트셀러_투어_해외_국내_계정_고객문의_순서다() throws Exception {
		String html = mvc.perform(get("/")).andReturn().getResponse().getContentAsString();
		String nav = html.substring(html.indexOf("<nav aria-label=\"주 메뉴\">"), html.indexOf("</nav>"));
		int last = -1;
		for (String label : new String[] { ">홈<", ">이달의 특별전<", ">베스트셀러<", ">투어<", ">해외여행<", ">국내여행<", ">계정<", ">고객문의<", ">로그인<", ">회원가입<" }) {
			int at = nav.indexOf(label);
			assertThat(at).as(label).isGreaterThan(last);
			last = at;
		}
		assertThat(nav).doesNotContain("특별기획");
	}

	@Test
	void 거코_이름_글자는_오렌지색으로_칠한다() throws Exception {
		String js = new String(new ClassPathResource("static/js/common.js").getInputStream().readAllBytes(), StandardCharsets.UTF_8);
		assertThat(js).contains("var NAME = '거코'").contains("name-geoko");
		assertThat(css("mascot.css")).contains(".name-geoko { color: var(--accent-ink)");
		String html = mvc.perform(get("/travel")).andReturn().getResponse().getContentAsString();
		assertThat(html).contains("#98a3bb").doesNotContain("#ff9a3c");
	}

	@Test
	void 메인_지구본은_전_세계_도시_100곳_사이를_오가고_인천_고정이_아니다() throws Exception {
		String cities = new String(new ClassPathResource("static/js/world-cities.js").getInputStream().readAllBytes(), StandardCharsets.UTF_8);
		assertThat(java.util.regex.Pattern.compile("\\['[^']+', -?\\d").matcher(cities).results().count()).isEqualTo(100);
		String home = new String(new ClassPathResource("static/js/home-globe.js").getInputStream().readAllBytes(), StandardCharsets.UTF_8);
		assertThat(home).contains("NadoWorldCities").contains("makeRoutes(60)").contains(".pathsData(lines)").doesNotContain("makePlane").doesNotContain("htmlElementsData").doesNotContain("/api/globe/routes").doesNotContain("'인천'");
		String html = mvc.perform(get("/")).andReturn().getResponse().getContentAsString();
		assertThat(html).contains("world-cities.js").contains("주요 도시 100곳");
	}

	@Test
	void 메인_지구본은_어느_축으로든_자유_회전하고_원래_각도로_되돌리지_않는다() throws Exception {
		String js = new String(new ClassPathResource("static/js/home-globe.js").getInputStream().readAllBytes(), StandardCharsets.UTF_8);
		assertThat(js).contains("controlType: 'trackball'").contains("function applyRotation").doesNotContain("HOME_LAT")
			.contains("omega = cruise.slice()")
			.contains("CRUISE = reduce ? 0 : 15 * RAD").contains("FLICK_MAX = 1200 * RAD").contains("FLICK_SECONDS = 3").doesNotContain("omega = [0, 0, 0];             // 잡고");
	}
}
