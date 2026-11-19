// 여행지 선택 화면: 권역 탭과 검색어로 카드를 거른다. (50곳을 한 번에 내려받아 화면에서 거른다)
(function () {
	'use strict';

	var cards = Array.prototype.slice.call(document.querySelectorAll('[data-dest]'));
	var tabs = Array.prototype.slice.call(document.querySelectorAll('[data-region-tab]'));
	var input = document.getElementById('dest-search');
	var count = document.getElementById('dest-count');
	var empty = document.getElementById('dest-empty');
	if (!cards.length) { return; }

	var region = 'ALL';

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
