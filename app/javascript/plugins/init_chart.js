const initChart = () => {
  const chartElement    = document.getElementById('graph1');
  if (chartElement) {
    const userName      = chartElement.dataset.userFullname;
    const profileTitle    = chartElement.dataset.offerTitle;
    const userSkills    = JSON.parse(chartElement.dataset.userSkills);
    const profileSkills   = JSON.parse(chartElement.dataset.profileSkills);
    const skillNames    = JSON.parse(chartElement.dataset.skillNames);
    const ctx           = chartElement.getContext('2d');
    const data = {
        // The data for our dataset
            labels: skillNames,
            datasets: [
            {
                label: userName,
                //backgroundColor: 'rgb(255, 99, 132)',
                borderColor: '#2f97c1',
                //borderWidth:
                data: userSkills
            },
            {
                label: profileTitle,
                //backgroundColor: 'rgb(25, 99, 132)',
                borderColor: '#222222',
                data: profileSkills
            }
          ]
        };

        // Configuration options go here
    const options = {
      responsive: true,
      scale: {
        ticks: {
            beginAtZero: true,
            max: 5,
            min: 0,
            stepSize: 1
        }
      }
    }

    const config = {
      type: 'radar',
      data: data,
      options: options
    }
    const chart = new Chart(ctx, config)
  }
}

export { initChart };
