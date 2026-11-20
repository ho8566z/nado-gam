// 메인 지구본: 천천히 돌아가는 지구 위로 인천에서 세계 각지로 비행기가 날아간다.
// 경로는 /api/globe/routes 에서 받는다(직항 1구간, 경유 2구간). 기획전·베스트셀러 여행지는 노란색으로 강조한다.
(function () {
	'use strict';

	var el = document.getElementById('globe');
	if (!el) { return; }

	var U = window.NadoGlobe;
	var reduce = U ? U.reduce : false;
	var RAD = Math.PI / 180;

	function fallback() {
		el.innerHTML = '<div class="globe-fallback"><p>지구본을 불러오지 못했어요. 인터넷 연결을 확인해 주세요.</p></div>';
	}

	if (typeof Globe !== 'function' || !U) { fallback(); return; }

	function start(routes) {
		var width = el.clientWidth || 640;
		var height = el.clientHeight || 520;

		var paths = routes.map(function (r) {
			var built = U.buildPath(r.points);
			return { pts: built.pts, total: built.total, featured: r.featured, name: r.name, points: r.points };
		}).filter(function (p) { return p.pts.length > 1; });

		// 회전은 직접 제어한다. 카메라의 '위쪽'이 고정되지 않아 어느 축으로든 돌릴 수 있도록 trackball 방식을 쓴다.
		var globe = Globe({ controlType: 'trackball' })(el)
			.width(width).height(height)
			.backgroundColor('rgba(0,0,0,0)')
			.globeImageUrl(U.IMG + 'earth-blue-marble.jpg')
			.bumpImageUrl(U.IMG + 'earth-topology.png')
			.showAtmosphere(true).atmosphereColor('#ffa050').atmosphereAltitude(0.2)
			// 비행 경로: 흐르는 점선으로 그린다
			.pathsData(paths)
			.pathPoints('pts').pathPointLat(function (p) { return p[0]; }).pathPointLng(function (p) { return p[1]; }).pathPointAlt(function (p) { return p[2]; })
			.pathColor(function (d) { return d.featured ? ['rgba(255,209,102,0.15)', 'rgba(255,209,102,0.95)'] : ['rgba(255, 138, 31,0.05)', 'rgba(255, 138, 31,0.6)']; })
			.pathStroke(function (d) { return d.featured ? 0.9 : 0.4; })
			.pathDashLength(0.22).pathDashGap(0.1)
			.pathDashAnimateTime(function (d) { return reduce ? 0 : 5000 + d.total * 2500; })
			.pathTransitionDuration(0);

		// 도시 점과 인천에서 퍼지는 물결
		var cities = {};
		paths.forEach(function (p) {
			var last = p.points[p.points.length - 1];
			cities[last.code] = { lat: last.lat, lng: last.lng, featured: p.featured, name: p.name };
		});
		var cityList = Object.keys(cities).map(function (k) { return cities[k]; });
		var home = routes.length ? routes[0].points[0] : { lat: 37.4602, lng: 126.4407, city: '인천' };

		globe
			.pointsData(cityList.concat([{ lat: home.lat, lng: home.lng, featured: true, home: true }]))
			.pointAltitude(0.004).pointRadius(function (d) { return d.home ? 0.55 : (d.featured ? 0.4 : 0.2); })
			.pointColor(function (d) { return d.home ? '#ff8a1f' : (d.featured ? '#ffd166' : 'rgba(255,255,255,0.85)'); })
			.ringsData(cityList.filter(function (c) { return c.featured; }).concat([{ lat: home.lat, lng: home.lng, home: true }]))
			.ringColor(function (d) { return d.home ? function (t) { return 'rgba(255, 138, 31,' + (1 - t) + ')'; } : function (t) { return 'rgba(255,209,102,' + (1 - t) + ')'; }; })
			.ringMaxRadius(function (d) { return d.home ? 5 : 3; }).ringPropagationSpeed(2).ringRepeatPeriod(1800);

		// 비행기와 도시 이름은 같은 HTML 레이어에 올린다. (지구본 글자 레이어는 한글을 그리지 못한다)
		var items = [];
		cityList.filter(function (c) { return c.featured; }).forEach(function (c) {
			items.push({ type: 'label', lat: c.lat, lng: c.lng, alt: 0.01, el: U.makeLabel(c.name) });
		});
		items.push({ type: 'label', lat: home.lat, lng: home.lng, alt: 0.01, el: U.makeLabel('인천', 'city-label--home') });

		var planes = [];
		var PLANE_COUNT = reduce ? 0 : Math.min(7, Math.max(3, paths.length));
		function pickRoute() {
			// 기획전·베스트셀러 여행지가 더 자주 뽑히게 한다.
			var featured = paths.filter(function (p) { return p.featured; });
			var pool = (featured.length && Math.random() < 0.55) ? featured : paths;
			return pool[Math.floor(Math.random() * pool.length)];
		}
		for (var i = 0; i < PLANE_COUNT && paths.length; i++) {
			var plane = { type: 'plane', el: U.makePlane(), route: pickRoute(), t: -Math.random() * 0.9, lat: 0, lng: 0, alt: 0, rot: 0 };
			planes.push(plane);
			items.push(plane);
		}

		globe.htmlElementsData(items)
			.htmlLat(function (d) { return d.lat; }).htmlLng(function (d) { return d.lng; }).htmlAltitude(function (d) { return d.alt; })
			.htmlElement(function (d) { return d.el; })
			.htmlTransitionDuration(0);
		if (typeof globe.htmlElementVisibilityModifier === 'function') {
			globe.htmlElementVisibilityModifier(function (node, visible) { node.style.opacity = visible ? '1' : '0'; });
		}

		// 회전은 기본 컨트롤 대신 직접 구현한다. (자유 회전, 11/20 변경)
		// 카메라를 지구 중심 기준으로 '어느 축으로든' 돌린다. 끌어서 놓으면 놓은 방향(축)으로 계속 돌고,
		// 서서히 평소 속도로 안정된다. 세로·대각선으로 돌려도 원래 각도로 되돌아가지 않고 그 축 그대로 계속 돈다.
		var CRUISE = reduce ? 0 : 7 * RAD;      // 평소 회전 속도(라디안/초)
		var cruise = [0, -CRUISE, 0];           // 평소 회전 벡터(카메라 각속도). 처음에는 지구 자전축(세로)이고 지표면이 오른쪽으로 흐른다
		var omega = cruise.slice();             // 지금 회전 벡터(방향 = 회전축, 크기 = 속도)
		var drag = null;

		function dot(a, b) { return a[0] * b[0] + a[1] * b[1] + a[2] * b[2]; }
		function len(a) { return Math.sqrt(dot(a, a)); }
		function scale(a, s) { return [a[0] * s, a[1] * s, a[2] * s]; }
		function add(a, b) { return [a[0] + b[0], a[1] + b[1], a[2] + b[2]]; }
		function cross(a, b) { return [a[1] * b[2] - a[2] * b[1], a[2] * b[0] - a[0] * b[2], a[0] * b[1] - a[1] * b[0]]; }
		function norm(a) { var l = len(a) || 1; return scale(a, 1 / l); }
		// 로드리게스 회전: v 를 단위축 ax 둘레로 ang 만큼 돌린다
		function rotate(v, ax, ang) {
			var c = Math.cos(ang), s = Math.sin(ang);
			return add(add(scale(v, c), scale(cross(ax, v), s)), scale(ax, dot(ax, v) * (1 - c)));
		}

		// 처음 보는 각도(위도 28°, 경도 120°)로 카메라를 놓고, 그 위치와 '위쪽' 벡터를 직접 관리한다.
		globe.pointOfView({ lat: 28, lng: 120, altitude: 2.15 }, 0);
		var cam = globe.camera();
		var pos = [cam.position.x, cam.position.y, cam.position.z];
		var up = [cam.up.x, cam.up.y, cam.up.z];
		var dist = len(pos);
		var controls = globe.controls();
		controls.enabled = false;      // 기본 드래그 회전은 끄고 아래에서 직접 처리한다
		try { globe.renderer().setPixelRatio(Math.min(window.devicePixelRatio || 1, 2)); } catch (e) { /* 무시 */ }

		function degPerPx() { return 57.3 / Math.max(120, Math.min(el.clientWidth, el.clientHeight) * 0.4); }

		// 카메라 방향 기준 좌표: 앞(forward) = 지구 중심 쪽, right = 화면 오른쪽
		function frameAxes() {
			var f = norm(scale(pos, -1));
			var right = norm(cross(f, up));
			return { f: f, right: right, up: cross(right, f) };
		}

		// 회전 벡터 rv(라디안)만큼 카메라를 돌린다. 오차가 쌓이지 않게 거리와 직각을 다시 맞춘다.
		function applyRotation(rv) {
			var ang = len(rv);
			if (ang < 1e-9) { return; }
			var ax = scale(rv, 1 / ang);
			pos = rotate(pos, ax, ang);
			up = rotate(up, ax, ang);
			pos = scale(norm(pos), dist);
			var f = norm(scale(pos, -1));
			up = norm(add(up, scale(f, -dot(up, f))));
		}

		el.addEventListener('pointerdown', function (e) {
			if (e.pointerType === 'mouse' && e.button !== 0) { return; }
			drag = { id: e.pointerId, x: e.clientX, y: e.clientY, t: performance.now(), w: [0, 0, 0] };
			try { el.setPointerCapture(e.pointerId); } catch (err) { /* 무시 */ }
			omega = [0, 0, 0];             // 잡고 있는 동안은 멈춘다
			el.classList.add('is-grabbing');
		});
		el.addEventListener('pointermove', function (e) {
			if (!drag || e.pointerId !== drag.id) { return; }
			var now = performance.now();
			var dt = Math.max(1, now - drag.t) / 1000;
			var dx = e.clientX - drag.x, dy = e.clientY - drag.y, k = degPerPx() * RAD;
			var ax = frameAxes();
			// 오른쪽/아래로 끌면 지표면이 커서를 따라온다 → 카메라는 반대로 돈다. 가로·세로가 합쳐져 어느 축이든 가능하다.
			var rv = add(scale(ax.up, -dx * k), scale(ax.right, -dy * k));
			applyRotation(rv);
			drag.w = add(scale(drag.w, 0.6), scale(rv, 0.4 / dt));   // 마지막 움직임의 각속도(부드럽게)
			drag.x = e.clientX; drag.y = e.clientY; drag.t = now;
		});
		function release(e) {
			if (!drag || e.pointerId !== drag.id) { return; }
			var still = performance.now() - drag.t > 90;   // 멈춘 채로 놓으면 관성 없이 이전 평소 회전으로 돌아간다
			var w = drag.w, m = len(w);
			if (!still && m > 4 * RAD) {
				if (m > Math.PI) { w = scale(w, Math.PI / m); }   // 최대 180도/초
				omega = w;
				// 놓은 축과 방향을 새 평소 회전으로 삼는다(속도는 평소 속도로 안정).
				if (CRUISE > 0) { cruise = scale(norm(w), CRUISE); }
			} else {
				omega = [0, 0, 0];
			}
			drag = null;
			el.classList.remove('is-grabbing');
		}
		el.addEventListener('pointerup', release);
		el.addEventListener('pointercancel', release);

		function stepCamera(dt) {
			if (!drag) {
				// 회전 벡터가 평소 회전 벡터로 부드럽게 수렴한다. 축(방향)은 놓은 그대로 유지된다.
				var a = 1 - Math.exp(-dt / 1.6);
				omega = add(omega, scale(add(cruise, scale(omega, -1)), a));
				applyRotation(scale(omega, dt));
			}
			cam.position.set(pos[0], pos[1], pos[2]);
			cam.up.set(up[0], up[1], up[2]);
			cam.lookAt(0, 0, 0);
		}

		// 프레임 루프: 카메라 회전 → 비행기 이동
		var last = performance.now();
		function frame(now) {
			var dt = Math.min(0.1, (now - last) / 1000);
			last = now;
			stepCamera(dt);
			planes.forEach(function (p) {
				var duration = 7 + p.route.total * 3.4; // 초
				p.t += dt / duration;
				if (p.t >= 1) { p.route = pickRoute(); p.t = -Math.random() * 0.4; }
				if (p.t < 0) { p.el.classList.add('is-off'); return; }
				p.el.classList.remove('is-off');
				var cur = U.pointAt(p.route, p.t);
				var ahead = U.pointAt(p.route, Math.min(1, p.t + 0.012));
				p.lat = cur.lat; p.lng = cur.lng; p.alt = cur.alt;
				U.orient(globe, p, cur, ahead);
				var fade = Math.min(1, p.t * 14, (1 - p.t) * 14);
				var svg = p.el.firstChild;
				svg.style.transform = 'rotate(' + p.rot + 'deg) scale(' + (0.65 + 0.35 * fade) + ')';
				svg.style.opacity = String(fade);
			});
			globe.htmlElementsData(items);
			window.requestAnimationFrame(frame);
		}
		window.requestAnimationFrame(frame);

		// 크기 변경
		function resize() {
			var w = el.clientWidth, h = el.clientHeight;
			if (w && h) { globe.width(w).height(h); }
		}
		if (window.ResizeObserver) { new ResizeObserver(resize).observe(el); } else { window.addEventListener('resize', resize); }

		// 탭이 숨겨지면 렌더링을 멈춰 전력을 아낀다.
		document.addEventListener('visibilitychange', function () {
			if (document.hidden) { globe.pauseAnimation(); } else { globe.resumeAnimation(); last = performance.now(); }
		});
	}

	fetch('/api/globe/routes', { headers: { 'Accept': 'application/json' } })
		.then(function (r) { if (!r.ok) { throw new Error(r.status); } return r.json(); })
		.then(start)
		.catch(function () { start([]); });
})();
