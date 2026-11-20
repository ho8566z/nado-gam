// 카드를 누르면 화면이 커지며 사라진 뒤 해당 페이지로 넘어가는 전환 효과
(function () {
	'use strict';
	var reduce = window.matchMedia && window.matchMedia('(prefers-reduced-motion: reduce)').matches;

	// 뒤로가기(bfcache)로 돌아왔을 때 사라진 상태가 남지 않게 한다.
	window.addEventListener('pageshow', function () {
		document.body.classList.remove('is-leaving');
		document.querySelectorAll('.is-opening').forEach(function (el) { el.classList.remove('is-opening'); });
	});

	document.addEventListener('click', function (e) {
		var a = e.target.closest ? e.target.closest('a[data-transition]') : null;
		if (!a || e.defaultPrevented || e.button !== 0 || e.metaKey || e.ctrlKey || e.shiftKey || e.altKey || a.target === '_blank' || reduce) {
			return;
		}
		e.preventDefault();
		var href = a.href;
		a.classList.add('is-opening');
		document.body.classList.add('is-leaving');
		window.setTimeout(function () { window.location.href = href; }, 340);
	});
})();

// 모바일 하단 탭 바: 현재 주소에 맞는 탭을 강조한다.
(function () {
	'use strict';
	var path = window.location.pathname;
	document.querySelectorAll('.tabbar a[data-tab]').forEach(function (a) {
		var base = a.getAttribute('data-tab');
		var on = a.hasAttribute('data-tab-exact') ? path === base : (path === base || path.indexOf(base + '/') === 0);
		if (on) {
			a.classList.add('is-active');
			a.setAttribute('aria-current', 'page');
		}
	});
	// 로그인·가입 화면은 '내 정보' 탭에 속한다.
	if (path === '/login' || path === '/signup') {
		var acc = document.querySelector('.tabbar a[data-tab="/account"]');
		if (acc) { acc.classList.add('is-active'); acc.setAttribute('aria-current', 'page'); }
	}
})();

// 푸터의 '휴대폰으로 보기': 펼칠 때 현재 화면 주소로 QR 이미지를 불러온다.
(function () {
	'use strict';
	var box = document.querySelector('details.mobile-qr');
	var img = box ? box.querySelector('img[data-qr-self]') : null;
	if (!box || !img) { return; }
	box.addEventListener('toggle', function () {
		if (box.open && !img.getAttribute('src')) {
			img.setAttribute('src', '/qr?target=' + encodeURIComponent(window.location.pathname + window.location.search));
		}
	});
})();

// 화면에 나오는 마스코트 이름 '거코'는 항상 오렌지색으로 보여 준다. (템플릿·DB 문구 모두 같은 방식으로 처리)
(function () {
	'use strict';
	var NAME = '거코';
	var skip = { SCRIPT: 1, STYLE: 1, TEXTAREA: 1, INPUT: 1, NOSCRIPT: 1, TITLE: 1 };
	var walker = document.createTreeWalker(document.body, NodeFilter.SHOW_TEXT, {
		acceptNode: function (n) {
			var p = n.parentNode;
			if (!n.nodeValue || n.nodeValue.indexOf(NAME) < 0) { return NodeFilter.FILTER_REJECT; }
			if (!p || skip[p.nodeName] || (p.classList && p.classList.contains('name-geoko'))) { return NodeFilter.FILTER_REJECT; }
			return NodeFilter.FILTER_ACCEPT;
		}
	});
	var nodes = [];
	while (walker.nextNode()) { nodes.push(walker.currentNode); }
	nodes.forEach(function (n) {
		var parts = n.nodeValue.split(NAME);
		var frag = document.createDocumentFragment();
		parts.forEach(function (text, i) {
			if (i > 0) {
				var span = document.createElement('span');
				span.className = 'name-geoko';
				span.textContent = NAME;
				frag.appendChild(span);
			}
			if (text) { frag.appendChild(document.createTextNode(text)); }
		});
		n.parentNode.replaceChild(frag, n);
	});
})();
