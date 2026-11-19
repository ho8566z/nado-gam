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
