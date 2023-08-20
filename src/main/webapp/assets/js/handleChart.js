window.addEventListener("DOMContentLoaded", () => {
    const data = {
        labels: ["Red", "Orange", "Yellow"],
        datasets: [
            {
                label: "Dataset 1",
                data: [4.9, 82.1, 13],
                backgroundColor: ["#7bb31a", "#00a2ff", "#ff9800"],
            },
        ],
    };
    const config = {
        type: "doughnut",
        data: data,
        options: {
            responsive: false,
            tooltips: false,
            plugins: {
                legend: {
                    position: "top",
                    display: false,
                },
                tooltip: {
                    enabled: false,
                },
            },
        },
    };

    const ctx = document.getElementById("chart_1");

    new Chart(ctx, config);
});
