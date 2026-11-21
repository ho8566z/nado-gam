// 투어 목록: 정렬 버튼(가격·조회수·인기·여행사 추천)으로 카드 순서를 바꾼다. 필터(테마·지역·대륙·국가·검색)는 서버가 거르므로 현재 목록 안에서만 정렬한다.
(function () {
	'use strict';
	var grid = document.getElementById('tour-grid');
	var cards = Array.prototype.slice.call(document.querySelectorAll('[data-tour]'));
	var btns = Array.prototype.slice.call(document.querySelectorAll('[data-sort]'));
	if (!grid || !cards.length || !btns.length) { return; }

	function num(c, key) {
		var v = c.getAttribute(key);
		return v === null || v === '' ? 0 : Number(v);
	}

	var SORTS = {
		'default': function (a, b) { return 0; },
		'price_asc': function (a, b) { return num(a, 'data-price') - num(b, 'data-price'); },
		'price_desc': function (a, b) { return num(b, 'data-price') - num(a, 'data-price'); },
		'views': function (a, b) { return num(b, 'data-views') - num(a, 'data-views'); },
		'popular': function (a, b) { return num(b, 'data-sales') - num(a, 'data-sales'); },
		'recommend': function (a, b) {
			var pa = num(a, 'data-pick'), pb = num(b, 'data-pick');
			if (pa && pb) { return pa - pb; }
			if (pa) { return -1; }
			if (pb) { return 1; }
			return 0;
		}
	};

	function statText(c, mode) {
		if (mode === 'views') { return '조회 ' + c.getAttribute('data-views-label'); }
		if (mode === 'popular') { return '판매 ' + c.getAttribute('data-sales-label') + '건'; }
		if (mode === 'recommend') {
			var p = num(c, 'data-pick');
			return p ? '여행사 추천 ' + p + '위' : '';
		}
		return '';
	}

	function apply(mode) {
		var cmp = SORTS[mode] || SORTS['default'];
		cards.slice().sort(function (a, b) {
			return cmp(a, b) || (num(a, 'data-order') - num(b, 'data-order'));
		}).forEach(function (c) {
			grid.appendChild(c);
			var stat = c.querySelector('[data-stat]');
			if (stat) {
				var t = statText(c, mode);
				stat.textContent = t;
				stat.hidden = !t;
			}
		});
		btns.forEach(function (b) {
			var on = b.getAttribute('data-sort') === mode;
			b.classList.toggle('is-active', on);
			b.setAttribute('aria-pressed', on ? 'true' : 'false');
		});
	}

	btns.forEach(function (b) {
		b.addEventListener('click', function () { apply(b.getAttribute('data-sort')); });
	});
})();
