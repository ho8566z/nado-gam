// 메인 지구본: 천천히 돌아가는 지구 위로 인천에서 세계 각지로 비행기가 날아간다.
// 경로는 /api/globe/routes 에서 받는다(직항 1구간, 경유 2구간). 기획전·베스트셀러 여행지는 노란색으로 강조한다.
(function () {
	'use strict';

	var el = document.getElementById('globe');
	if (!el) { return; }

	var IMG = 'https://cdn.jsdelivr.net/npm/three-globe/example/img/';
	var reduce = window.matchMedia && window.matchMedia('(prefers-reduced-motion: reduce)').matches;
	var RAD = Math.PI / 180;

	function fallback() {
		el.innerHTML = '<div class="globe-fallback"><p>지구본을 불러오지 못했어요. 인터넷 연결을 확인해 주세요.</p></div>';
	}

	if (typeof Globe !== 'function') { fallback(); return; }

	// ---------- 구면 보간 ----------
	function toVec(lat, lng) {
		var a = lat * RAD, b = lng * RAD;
		return [Math.cos(a) * Math.cos(b), Math.cos(a) * Math.sin(b), Math.sin(a)];
	}
	function toLatLng(v) {
		return [Math.asin(Math.max(-1, Math.min(1, v[2]))) / RAD, Math.atan2(v[1], v[0]) / RAD];
	}
	function angle(a, b) {
		return Math.acos(Math.max(-1, Math.min(1, a[0] * b[0] + a[1] * b[1] + a[2] * b[2])));
	}
	function slerp(a, b, t, omega) {
		if (omega < 1e-6) { return a; }
		var s = Math.sin(omega), k1 = Math.sin((1 - t) * omega) / s, k2 = Math.sin(t * omega) / s;
		return [a[0] * k1 + b[0] * k2, a[1] * k1 + b[1] * k2, a[2] * k1 + b[2] * k2];
	}

	// 경로(공항 목록)를 [lat, lng, 고도] 점 목록으로 바꾼다. 구간마다 포물선 모양으로 떠올랐다 내려온다.
	function buildPath(points) {
		var pts = [];
		var total = 0;
		for (var s = 0; s < points.length - 1; s++) {
			var a = toVec(points[s].lat, points[s].lng), b = toVec(points[s + 1].lat, points[s + 1].lng);
			var omega = angle(a, b);
			total += omega;
			var h = 0.02 + 0.075 * omega;
			var steps = Math.max(24, Math.ceil(omega / RAD / 2));
			for (var i = (s === 0 ? 0 : 1); i <= steps; i++) {
				var t = i / steps;
				var ll = toLatLng(slerp(a, b, t, omega));
				pts.push([ll[0], ll[1], h * Math.sin(Math.PI * t)]);
			}
		}
		return { pts: pts, total: total };
	}

	function lerpAngle(a, b, f) {
		var d = ((b - a + 540) % 360) - 180; // 날짜변경선을 넘는 경우에도 짧은 쪽으로 보간
		return a + d * f;
	}
	function pointAt(route, t) {
		var n = route.pts.length - 1;
		var f = Math.max(0, Math.min(1, t)) * n;
		var i = Math.min(n - 1, Math.floor(f));
		var k = f - i;
		var p = route.pts[i], q = route.pts[i + 1];
		return { lat: lerpAngle(p[0], q[0], k), lng: lerpAngle(p[1], q[1], k), alt: p[2] + (q[2] - p[2]) * k };
	}

	// ---------- HTML 요소 (비행기, 도시 이름) ----------
	var PLANE_SVG = '<svg viewBox="0 0 24 24" aria-hidden="true"><path d="M21 16v-2l-8-5V3.5c0-.83-.67-1.5-1.5-1.5S10 2.67 10 3.5V9l-8 5v2l8-2.5V19l-2 1.5V22l3.5-1 3.5 1v-1.5L13 19v-5.5l8 2.5z"/></svg>';
	function makePlane() {
		var d = document.createElement('div');
		d.className = 'plane';
		d.innerHTML = PLANE_SVG;
		return d;
	}
	function makeLabel(text, home) {
		var d = document.createElement('div');
		d.className = 'city-label' + (home ? ' city-label--home' : '');
		d.textContent = text;
		return d;
	}

	function start(routes) {
		var width = el.clientWidth || 640;
		var height = el.clientHeight || 520;

		var paths = routes.map(function (r) {
			var built = buildPath(r.points);
			return { pts: built.pts, total: built.total, featured: r.featured, name: r.name, points: r.points };
		}).filter(function (p) { return p.pts.length > 1; });

		var globe = Globe()(el)
			.width(width).height(height)
			.backgroundColor('rgba(0,0,0,0)')
			.globeImageUrl(IMG + 'earth-blue-marble.jpg')
			.bumpImageUrl(IMG + 'earth-topology.png')
			.showAtmosphere(true).atmosphereColor('#6ec1ff').atmosphereAltitude(0.2)
			// 비행 경로: 흐르는 점선으로 그린다
			.pathsData(paths)
			.pathPoints('pts').pathPointLat(function (p) { return p[0]; }).pathPointLng(function (p) { return p[1]; }).pathPointAlt(function (p) { return p[2]; })
			.pathColor(function (d) { return d.featured ? ['rgba(255,209,102,0.15)', 'rgba(255,209,102,0.95)'] : ['rgba(92,200,255,0.05)', 'rgba(92,200,255,0.6)']; })
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
			.pointColor(function (d) { return d.home ? '#5cc8ff' : (d.featured ? '#ffd166' : 'rgba(255,255,255,0.85)'); })
			.ringsData(cityList.filter(function (c) { return c.featured; }).concat([{ lat: home.lat, lng: home.lng, home: true }]))
			.ringColor(function (d) { return d.home ? function (t) { return 'rgba(92,200,255,' + (1 - t) + ')'; } : function (t) { return 'rgba(255,209,102,' + (1 - t) + ')'; }; })
			.ringMaxRadius(function (d) { return d.home ? 5 : 3; }).ringPropagationSpeed(2).ringRepeatPeriod(1800);

		// 비행기와 도시 이름은 같은 HTML 레이어에 올린다. (지구본 글자 레이어는 한글을 그리지 못한다)
		var items = [];
		cityList.filter(function (c) { return c.featured; }).forEach(function (c) {
			items.push({ type: 'label', lat: c.lat, lng: c.lng, alt: 0.01, el: makeLabel(c.name, false) });
		});
		items.push({ type: 'label', lat: home.lat, lng: home.lng, alt: 0.01, el: makeLabel('인천', true) });

		var planes = [];
		var PLANE_COUNT = reduce ? 0 : Math.min(7, Math.max(3, paths.length));
		function pickRoute() {
			// 기획전·베스트셀러 여행지가 더 자주 뽑히게 한다.
			var featured = paths.filter(function (p) { return p.featured; });
			var pool = (featured.length && Math.random() < 0.55) ? featured : paths;
			return pool[Math.floor(Math.random() * pool.length)];
		}
		for (var i = 0; i < PLANE_COUNT && paths.length; i++) {
			var route = pickRoute();
			var plane = { type: 'plane', el: makePlane(), route: route, t: -Math.random() * 0.9, lat: 0, lng: 0, alt: 0, rot: 0, hidden: true };
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

		// 카메라와 자동 회전
		globe.pointOfView({ lat: 30, lng: 120, altitude: 2.15 }, 0);
		var controls = globe.controls();
		controls.autoRotate = !reduce;
		controls.autoRotateSpeed = 0.55;
		controls.enableZoom = false;
		controls.enablePan = false;
		controls.minPolarAngle = Math.PI * 0.25;
		controls.maxPolarAngle = Math.PI * 0.75;
		try { globe.renderer().setPixelRatio(Math.min(window.devicePixelRatio || 1, 2)); } catch (e) { /* 무시 */ }

		// 비행기 이동
		var last = performance.now();
		function frame(now) {
			var dt = Math.min(0.1, (now - last) / 1000);
			last = now;
			planes.forEach(function (p) {
				var duration = 7 + p.route.total * 3.4; // 초
				p.t += dt / duration;
				if (p.t >= 1) { p.route = pickRoute(); p.t = -Math.random() * 0.4; }
				if (p.t < 0) { p.hidden = true; p.el.style.display = 'none'; return; }
				p.el.style.display = '';
				var cur = pointAt(p.route, p.t);
				var ahead = pointAt(p.route, Math.min(1, p.t + 0.012));
				p.lat = cur.lat; p.lng = cur.lng; p.alt = cur.alt;
				// 화면에서 본 진행 방향으로 아이콘을 돌린다.
				var a = globe.getScreenCoords(cur.lat, cur.lng, cur.alt);
				var b = globe.getScreenCoords(ahead.lat, ahead.lng, ahead.alt);
				if (a && b && (Math.abs(b.x - a.x) + Math.abs(b.y - a.y)) > 0.05) {
					p.rot = Math.atan2(b.y - a.y, b.x - a.x) / RAD + 90;
				}
				var fade = Math.min(1, p.t * 14, (1 - p.t) * 14);
				var svg = p.el.firstChild;
				svg.style.transform = 'rotate(' + p.rot + 'deg) scale(' + (0.65 + 0.35 * fade) + ')';
				svg.style.opacity = String(fade);
			});
			globe.htmlElementsData(items);
			window.requestAnimationFrame(frame);
		}
		if (planes.length) { window.requestAnimationFrame(frame); }

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
