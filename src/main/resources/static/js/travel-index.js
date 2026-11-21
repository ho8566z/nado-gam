// 여행지 선택 화면: 권역 탭·검색어로 카드를 거르고, 정렬 버튼(가격·조회수·인기·여행사 추천)으로 순서를 바꾼다. (여행지를 한 번에 내려받아 화면에서 처리한다)
(function () {
	'use strict';

	var cards = Array.prototype.slice.call(document.querySelectorAll('[data-dest]'));
	var tabs = Array.prototype.slice.call(document.querySelectorAll('[data-region-tab]'));
	var input = document.getElementById('dest-search');
	var count = document.getElementById('dest-count');
	var empty = document.getElementById('dest-empty');
	if (!cards.length) { return; }

	var region = 'ALL';
	var sortBtns = Array.prototype.slice.call(document.querySelectorAll('[data-sort]'));
	var grid = document.getElementById('dest-grid');

	function num(c, key) {
		var v = c.getAttribute(key);
		return v === null || v === '' ? null : Number(v);
	}

	// 정렬 기준: 값이 같거나 없으면 기본 순서(data-order)를 따른다. 가격이 없는 카드(운항 불가)는 항상 맨 뒤.
	var SORTS = {
		'default': function (a, b) { return num(a, 'data-order') - num(b, 'data-order'); },
		'price_asc': function (a, b) { return cmpPrice(a, b, 1); },
		'price_desc': function (a, b) { return cmpPrice(a, b, -1); },
		'views': function (a, b) { return (num(b, 'data-views') || 0) - (num(a, 'data-views') || 0); },
		'popular': function (a, b) { return (num(b, 'data-sales') || 0) - (num(a, 'data-sales') || 0); },
		'recommend': function (a, b) {
			var pa = num(a, 'data-pick') || 0, pb = num(b, 'data-pick') || 0;
			if (pa && pb) { return pa - pb; }
			if (pa) { return -1; }
			if (pb) { return 1; }
			return 0;
		}
	};

	function cmpPrice(a, b, dir) {
		var pa = num(a, 'data-price'), pb = num(b, 'data-price');
		if (pa === null && pb === null) { return 0; }
		if (pa === null) { return 1; }
		if (pb === null) { return -1; }
		return (pa - pb) * dir;
	}

	function statText(c, mode) {
		if (mode === 'views') { return '조회 ' + c.getAttribute('data-views-label'); }
		if (mode === 'popular') { return '판매 ' + c.getAttribute('data-sales-label') + '건'; }
		if (mode === 'recommend') {
			var p = num(c, 'data-pick');
			return p ? '여행사 추천 ' + p + '위' : '';
		}
		return '';
	}

	function applySort(mode) {
		if (!grid) { return; }
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
		sortBtns.forEach(function (b) {
			var on = b.getAttribute('data-sort') === mode;
			b.classList.toggle('is-active', on);
			b.setAttribute('aria-pressed', on ? 'true' : 'false');
		});
	}

	sortBtns.forEach(function (b) {
		b.addEventListener('click', function () { applySort(b.getAttribute('data-sort')); });
	});

	function apply() {
		var q = (input ? input.value : '').trim().toLowerCase();
		var shown = 0;
		cards.forEach(function (c) {
			var ok = (region === 'ALL' || c.getAttribute('data-region') === region)
				&& (!q || c.getAttribute('data-name').toLowerCase().indexOf(q) !== -1);
			c.hidden = !ok;
			if (ok) { shown++; }
		});
		if (count) { count.textContent = shown; }
		if (empty) { empty.hidden = shown !== 0; }
	}

	tabs.forEach(function (t) {
		t.addEventListener('click', function () {
			region = t.getAttribute('data-region-tab');
			tabs.forEach(function (o) {
				var on = o === t;
				o.classList.toggle('is-active', on);
				o.setAttribute('aria-selected', on ? 'true' : 'false');
			});
			apply();
		});
	});
	if (input) { input.addEventListener('input', apply); }
	apply();
})();
