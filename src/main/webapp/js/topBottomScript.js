var nav = document.getElementsByClassName("nav");
//스크롤 시 로고 표시
$(window).on('scroll', function() {
	if ($(window).scrollTop() > 47) {
		$('.top').addClass('active');
		$('.navBar').addClass('active');
		$('#app').addClass('active');
	} else {
		$('.top').removeClass('active');
		$('.navBar').removeClass('active');
		$('#app').removeClass('active');
	}
});

//상단메뉴 마우스 오버 아웃시 하위 메뉴 보이게
function topMenuOver(n){
	document.getElementById("topMenu"+n).style.display="block";
}
function topMenuOut(n){
	document.getElementById("topMenu"+n).style.display="none";
}