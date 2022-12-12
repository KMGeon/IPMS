/*=========================================================================================
    File Name: doughnut.js
    Description: Chartjs simple doughnut chart
    ----------------------------------------------------------------------------------------
    Item Name: Stack - Responsive Admin Theme
    Author: PIXINVENT
    Author URL: http://www.themeforest.net/user/pixinvent
==========================================================================================*/

// Doughnut chart
// ------------------------------
$(window).on("load", function(){

    //Get the context of the Chart canvas element we want to select
    var ctx = $("#doughnut-chart");

    // Chart Options
    var chartOptions = {
        responsive: true,
        maintainAspectRatio: false,
        responsiveAnimationDuration:500,
    };

    // Chart Data
    var chartData = {
        labels: ["123", "123", "123", "123", "123"],
        datasets: [{
            label: "My First dataset",
            data: [65, 59, 80, 81, 56],
            backgroundColor: ['#00A5A8', '#626E82', '#FF7D4D','#FF4558', '#16D39A'],
        }, {
            label: "My Second dataset",
            data: [28, 48, 40, 19, 86],
            backgroundColor: ['#00A5A8', '#626E82', '#FF7D4D','#FF4558', '#16D39A'],
        }, {
            label: "My Third dataset - No bezier",
            data: [45, 25, 16, 36, 67],
            backgroundColor: ['#00A5A8', '#626E82', '#FF7D4D','#FF4558', '#16D39A'],
        }, {
            label: "My Fourth dataset",
            data: [17, 62, 78, 88, 26],
            backgroundColor: ['#00A5A8', '#626E82', '#FF7D4D','#FF4558', '#16D39A'],
        }]
    };

    var config = {
        type: 'doughnut',

        // Chart Options
        options : chartOptions,

        data : chartData
    };

    // Create the chart
    var doughnutChart = new Chart(ctx, config);

});