const courseLevel = document.getElementById("dbCourseLevelsel").value;
console.log(courseLevel)
const maxUser = document.getElementById("dbMaxUsersel").value;
const cl = document.getElementById("courseLevelsel");
const mu = document.getElementById("maxUsersel");
for (let i = 0; i < cl.options.length; i++) {
	if (cl.options[i].value == courseLevel) {
		cl.options[i].selected = true;
	}
}
for (let i = 0; i < mu.options.length; i++) {
	if (mu.options[i].value == maxUser) {
		mu.options[i].selected = true;
	}
}

