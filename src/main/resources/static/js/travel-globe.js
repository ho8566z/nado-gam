// 해외 여행 화면의 지구본: 출발지에서 도착지로 가는 항공편 경로를 그리고 비행기가 날아간다.
// 항공편 카드([data-flight-id])나 출발지 카드([data-origin-code])에 마우스를 올리면 그 경로가 강조되고 카메라가 따라간다.
(function () {
	'use strict';

	var el = document.getElementById('travel-globe');
	if (!el) { return; }

	var U = window.NadoGlobe;
	var reduce = U ? U.reduce : false;

	function fallback() {
		el.innerHTML = '<div class="globe-fallback"><p>지구본을 불러오지 못했어요. 인터넷 연결을 확인해 주세요.</p></div>';
	}
	if (typeof Globe !== 'function' || !U) { fallback(); return; }

	function start(routes) {
		if (!routes.length) { fallback(); return; }

		var paths = routes.map(function (r) {
			var built = U.buildPath(r.points);
			return { id: r.flightId, type: r.flightType, pts: built.pts, total: built.total, points: r.points, active: false };
		});

		var globe = Globe()(el)
			.width(el.clientWidth || 480).height(el.clientHeight || 440)
			.backgroundColor('rgba(0,0,0,0)')
			.globeImageUrl(U.IMG + 'earth-blue-marble.jpg')
			.bumpImageUrl(U.IMG + 'earth-topology.png')
			.showAtmosphere(true).atmosphereColor('#6ec1ff').atmosphereAltitude(0.2)
			.pathsData(paths)
			.pathPoints('pts').pathPointLat(function (p) { return p[0]; }).pathPointLng(function (p) { return p[1]; }).pathPointAlt(function (p) { return p[2]; })
			.pathColor(function (d) { return d.active ? ['rgba(255,209,102,0.3)', 'rgba(255,209,102,1)'] : ['rgba(92,200,255,0.04)', 'rgba(92,200,255,0.42)']; })
			.pathStroke(function (d) { return d.active ? 1.2 : 0.35; })
			.pathDashLength(function (d) { return d.active ? 0.3 : 0.15; }).pathDashGap(0.1)
			.pathDashAnimateTime(function (d) { return reduce ? 0 : (d.active ? 3500 : 7000); })
			.pathTransitionDuration(0);

		// 도시 점: 출발지(파랑), 도착지(노랑), 경유지(흰색)
		var origins = {}, arrivals = {}, hubs = {};
		paths.forEach(function (p) {
			var first = p.points[0], last = p.points[p.points.length - 1];
			origins[first.code] = first;
			arrivals[last.code] = last;
			for (var i = 1; i < p.points.length - 1; i++) { hubs[p.points[i].code] = p.points[i]; }
		});
		var dots = [];
		Object.keys(origins).forEach(function (k) { dots.push({ lat: origins[k].lat, lng: origins[k].lng, kind: 'origin' }); });
		Object.keys(arrivals).forEach(function (k) { dots.push({ lat: arrivals[k].lat, lng: arrivals[k].lng, kind: 'arrival' }); });
		Object.keys(hubs).forEach(function (k) { dots.push({ lat: hubs[k].lat, lng: hubs[k].lng, kind: 'hub', code: k }); });
		globe.pointsData(dots).pointAltitude(0.004)
			.pointRadius(function (d) { return d.kind === 'hub' ? 0.25 : 0.55; })
			.pointColor(function (d) { return d.kind === 'origin' ? '#5cc8ff' : (d.kind === 'arrival' ? '#ffd166' : 'rgba(255,255,255,0.9)'); })
			.ringsData(dots.filter(function (d) { return d.kind !== 'hub'; }))
			.ringColor(function (d) { return d.kind === 'origin' ? function (t) { return 'rgba(92,200,255,' + (1 - t) + ')'; } : function (t) { return 'rgba(255,209,102,' + (1 - t) + ')'; }; })
			.ringMaxRadius(4).ringPropagationSpeed(2).ringRepeatPeriod(1800);

		// HTML 레이어: 도시 이름표(출발·도착은 항상, 경유지는 강조된 경로일 때만)와 비행기
		var items = [];
		var hubLabels = {};
		Object.keys(origins).forEach(function (k) { items.push({ lat: origins[k].lat, lng: origins[k].lng, alt: 0.01, el: U.makeLabel(origins[k].city, 'city-label--home') }); });
		Object.keys(arrivals).forEach(function (k) { items.push({ lat: arrivals[k].lat, lng: arrivals[k].lng, alt: 0.01, el: U.makeLabel(arrivals[k].city) }); });
		Object.keys(hubs).forEach(function (k) {
			var label = U.makeLabel(hubs[k].city, 'city-label--hub');
			label.classList.add('is-off');
			hubLabels[k] = label;
			items.push({ lat: hubs[k].lat, lng: hubs[k].lng, alt: 0.01, el: label });
		});

		var planes = [];
		var MAX_PLANES = 4;
		for (var i = 0; i < MAX_PLANES && !reduce; i++) {
			var plane = { el: U.makePlane(), route: null, t: 0, lat: 0, lng: 0, alt: 0, rot: 0 };
			plane.el.classList.add('is-off');
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

		var controls = globe.controls();
		controls.autoRotate = false;
		controls.enableZoom = false;
		controls.enablePan = false;
		controls.minPolarAngle = Math.PI * 0.2;
		controls.maxPolarAngle = Math.PI * 0.8;
		try { globe.renderer().setPixelRatio(Math.min(window.devicePixelRatio || 1, 2)); } catch (e) { /* 무시 */ }

		// 조건에 맞는 경로를 강조하고, 비행기를 그 경로에 태우고, 카메라를 맞춘다.
		function setActive(pred) {
			paths.forEach(function (p) { p.active = !!pred(p); });
			globe.pathsData(paths.slice());   // 같은 배열을 다시 넘기면 갱신되지 않으므로 복사본을 넘긴다
			var active = paths.filter(function (p) { return p.active; });
			Object.keys(hubLabels).forEach(function (k) {
				hubLabels[k].classList.toggle('is-off', !active.some(function (p) { return p.points.some(function (pt, idx) { return idx > 0 && idx < p.points.length - 1 && pt.code === k; }); }));
			});
			planes.forEach(function (pl, idx) {
				pl.route = active.length ? active[idx % active.length] : null;
				pl.t = -idx * 0.25 - 0.05;
				if (!pl.route || idx >= Math.max(1, Math.min(MAX_PLANES, active.length))) { pl.route = null; pl.el.classList.add('is-off'); }
			});
			if (active.length) {
				var p0 = active[0];
				var mid = U.midpoint(p0.points[0], p0.points[p0.points.length - 1]);
				// 가까운 경로는 가까이, 먼 경로는 멀리서 본다.
				globe.pointOfView({ lat: mid.lat, lng: mid.lng, altitude: Math.min(3.2, 1.0 + mid.angle * 0.75) }, reduce ? 0 : 1100);
			}
		}

		var flightNodes = document.querySelectorAll('[data-flight-id]');
		var originNodes = document.querySelectorAll('[data-origin-code]');
		flightNodes.forEach(function (node) {
			var id = Number(node.getAttribute('data-flight-id'));
			['mouseenter', 'focusin'].forEach(function (ev) {
				node.addEventListener(ev, function () { setActive(function (p) { return p.id === id; }); });
			});
		});
		originNodes.forEach(function (node) {
			var code = node.getAttribute('data-origin-code');
			['mouseenter', 'focusin'].forEach(function (ev) {
				node.addEventListener(ev, function () { setActive(function (p) { return p.points[0].code === code; }); });
			});
		});

		// 처음에는 목록의 첫 항공편(또는 첫 출발지)을 강조한다. 상세 화면에서는 모든 경로(1편)를 강조한다.
		if (flightNodes.length) {
			var firstId = Number(flightNodes[0].getAttribute('data-flight-id'));
			setActive(function (p) { return p.id === firstId; });
		} else if (originNodes.length) {
			var firstCode = originNodes[0].getAttribute('data-origin-code');
			setActive(function (p) { return p.points[0].code === firstCode; });
		} else {
			setActive(function () { return true; });
		}

		// 비행기 이동: 강조된 경로 위를 반복해서 날아간다.
		var last = performance.now();
		function frame(now) {
			var dt = Math.min(0.1, (now - last) / 1000);
			last = now;
			planes.forEach(function (p) {
				if (!p.route) { return; }
				p.t += dt / (4 + p.route.total * 2.6);
				if (p.t >= 1.15) { p.t = -0.1; } // 도착 후 잠시 쉬었다가 다시 출발
				if (p.t < 0 || p.t > 1) { p.el.classList.add('is-off'); return; }
				p.el.classList.remove('is-off');
				var cur = U.pointAt(p.route, p.t);
				var ahead = U.pointAt(p.route, Math.min(1, p.t + 0.012));
				p.lat = cur.lat; p.lng = cur.lng; p.alt = cur.alt;
				U.orient(globe, p, cur, ahead);
				var fade = Math.min(1, p.t * 14, (1 - p.t) * 14);
				var svg = p.el.firstChild;
				svg.style.transform = 'rotate(' + p.rot + 'deg) scale(' + (0.7 + 0.3 * fade) + ')';
				svg.style.opacity = String(fade);
			});
			globe.htmlElementsData(items);
			window.requestAnimationFrame(frame);
		}
		if (!reduce) { window.requestAnimationFrame(frame); }

		function resize() {
			var w = el.clientWidth, h = el.clientHeight;
			if (w && h) { globe.width(w).height(h); }
		}
		if (window.ResizeObserver) { new ResizeObserver(resize).observe(el); } else { window.addEventListener('resize', resize); }
		document.addEventListener('visibilitychange', function () {
			if (document.hidden) { globe.pauseAnimation(); } else { globe.resumeAnimation(); last = performance.now(); }
		});
	}

	fetch(el.getAttribute('data-routes-url'), { headers: { 'Accept': 'application/json' } })
		.then(function (r) { if (!r.ok) { throw new Error(r.status); } return r.json(); })
		.then(start)
		.catch(fallback);
})();
