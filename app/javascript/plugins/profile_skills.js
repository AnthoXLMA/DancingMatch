function initSkills () {
    let allGraphs = document.querySelectorAll('#graph1');
    const graph = allGraphs.forEach(x => {
      const mySkills   = JSON.parse(x.dataset.userSkills);
      const skillsnaming    = JSON.parse(x.dataset.skillsName);
      const graph = new Chart(x, {
      type: 'line',
      data: {
      labels: skillsnaming,
        datasets: [{
          label: skillsnaming,
          data: mySkills,
          backgroundColor: [
          'red',
          'red',
          'red',
          'red',
          'red',
          'red'
          ]
        }]
      },
      options: {
    scales: {
        y: {
            beginAtZero: true
          }
        }
      }
    });
  }
)};

export { initSkills };
