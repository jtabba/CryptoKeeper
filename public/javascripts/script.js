
let labels1 = ['Price', 'Time'];
let data1 = ['100', '1'];
let colors1 = ['green', 'red'];

let myChart1 = document.getElementById("myChart").getContext('2d');

let chart1 = new Chart1(myChart1, {
    type: 'line',
    data: {
        labels: labels1,
        datasets: [ {
            data: data1,
            backgroundColor: colors1
        }]
    },
    options: {
        title: {
            text: "Price",
            display: "$1"
        }
    }
});