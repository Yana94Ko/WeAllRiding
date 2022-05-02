document.addEventListener("DOMContentLoaded", function(){
    const gentx = document.getElementById('genderChart').getContext('2d');
    const gendata = {
        labels: ['남','여'],
        datasets: [
            {
                label: '성별 분포',
                data: [],
                backgroundColor: ['#0067a3','#ff0000']
            }
        ]
    };
    axios.post("genderCount")
        .then((res) => {
            gendata.datasets[0].data.push(res.data[1].count);
            gendata.datasets[0].data.push(res.data[0].count);
            MakeGenderChart();
        })
        .catch((res) => {
            console.log(res);
        })
    function MakeGenderChart() {
        const genChart = new Chart(gentx, {
            type: 'pie',
            data: gendata,
            options: {
                responsive: false,
                plugins: {
                    legend: {
                        position: 'top',
                    },
                    title: {
                        display: true,
                        text: 'WeAllRding 회원 성별'
                    }
                }
            },
        });
    }

    const agetx = document.getElementById('ageChart').getContext('2d');
    const agedata = {
        labels: ['20세 미만','20대','30대','40대','50대','60세 이상'],
        datasets: [
            {
                label: '연령 분포',
                data: [],
                backgroundColor: ['#006cb7','#0081cc','#0067a3','#005282','#106393',"#4682b4"]
            }
        ]
    };
    axios.post("ageCount")
        .then((res) => {
            agedata.datasets[0].data.push(res.data.under_20);
            agedata.datasets[0].data.push(res.data.age_20);
            agedata.datasets[0].data.push(res.data.age_30);
            agedata.datasets[0].data.push(res.data.age_40);
            agedata.datasets[0].data.push(res.data.age_50);
            agedata.datasets[0].data.push(res.data.over_60);
            MakeAgeChart();
        })
        .catch((res) => {
            console.log(res);
        })
    function MakeAgeChart() {
        const ageChart = new Chart(agetx, {
            type: 'doughnut',
            data: agedata,
            options: {
                responsive: false,
                plugins: {
                    legend: {
                        position: 'top',
                    },
                    title: {
                        display: true,
                        text: '이용자 연령대 분포'
                    }
                }
            },
        });
    }
    axios.get("availableRiding")
        .then((res) => {
            document.getElementById("ridingCount").innerText = `참여 가능한 라이딩 : ${res.data}`
        })
        .catch((error) => {
            console.log(error);
        });
    axios.get("todayRiding")
        .then((res) => {
            document.getElementById("todayRiding").innerText = `오늘 개설된 라이딩 : ${res.data}`
        })
        .catch((error) => {
            console.log(error);
        })
    axios.get("availableCourse")
        .then((res) => {
            document.getElementById("courseCount").innerText = `경험 가능한 추천 코스 : ${res.data}`
        })
        .catch((error) => {
            console.log(error);
        })
});
