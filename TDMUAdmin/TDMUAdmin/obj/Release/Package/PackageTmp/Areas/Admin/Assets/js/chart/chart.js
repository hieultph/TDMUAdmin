

// Referral

var d_1options4 = {
    chart: {
        id: 'sparkline1',
        type: 'area',
        height: 50,
        sparkline: {
            enabled: true
        },
    },
    stroke: {
        curve: 'smooth',
        width: 0,
    },
    series: [{
        name: 'Sales',
        data: [60, 28, 52, 38, 40, 36, 38]
    }],
    labels: ['1', '2', '3', '4', '5', '6', '7'],
    yaxis: {
        min: 0
    },
    colors: ['#fff'],
    tooltip: {
        x: {
            show: false,
        }
    },
    fill: {
        type: "gradient",
        gradient: {
            type: "vertical",
            shadeIntensity: 1,
            inverseCollors: !1,
            opacityFrom: .60,
            opacityTo: .05,
            stops: [100, 100]
        }
    }
}

var d_1C_7 = new ApexCharts(document.querySelector("#hybrid_followers1"), d_1options4);
d_1C_7.render()