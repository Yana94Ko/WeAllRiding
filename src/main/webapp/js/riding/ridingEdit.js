const courseLevel = document.getElementById("dbCourseLevelsel").value.substr(0, document.getElementById("dbCourseLevelsel").value.length - 1);
console.log(courseLevel+"누구냐");
const maxUser = document.getElementById("dbMaxUsersel").value;
console.log(maxUser);
const cl = document.getElementById("courseLevelsel");
const mu = document.getElementById("maxUsersel");
for (let i = 0; i < cl.options.length; i++) {
	if (cl.options[i].value == courseLevel) {
		cl.options[i].selected = true;
		console.log(cl.options[i].value);
	}
}
for (let i = 0; i < mu.options.length; i++) {
	if (mu.options[i].value == maxUser) {
		mu.options[i].selected = true;
	}
}
$('#ridingKeyword').on("keyup", function(event) {
	let keyword = document.getElementById("ridingKeyword").value;
	if (window.event.keyCode == 32) {
		$('input[id=ridingKeyword]').val(keyword.substr(0, keyword.length - 1)+"#");
	}
	if(window.event.keyCode == 8){
		if(keyword==""){
			keyword.value="#"
		}
	}
});
$('#ridingKeyword').on("keyup", function(event) {
	let keyword = document.getElementById("ridingKeyword").value;
	if (keyword.substring(0,0)!="#" && keyword.length==0) {
		$('input[id=ridingKeyword]').val("#");
	}
});
$('#ridingKeyword').on("focus", function(event) {
	if($('input[id=ridingKeyword]').val()!="#"){
		$('input[id=ridingKeyword]').val($('input[id=ridingKeyword]').val( )+"#");
	}
});
$('#ridingKeyword').on("focusout", function(event) {
	let keyword = document.getElementById("ridingKeyword").value;
	if($('input[id=ridingKeyword]').val()=="#"){
		$('input[id=ridingKeyword]').val("");
	}
	if(keyword.substring(keyword.length-1)=='#'){
		$('#ridingKeyword').val(keyword.substring(0,keyword.length-1));
	}
})
