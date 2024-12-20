// const button = document.querySelector(".btn-warning");
const initGraphix = () => {
  const allgraphs    = document.querySelectorAll('#graph1');
  const graphics     = allgraphs.forEach(graphique => {
    // const uName     = JSON.parse(graph1.dataset.userFullname);
    const mySkills   = JSON.parse(graphique.dataset.userSkills);
    // const pSkills   = JSON.parse(graph1.dataset.profileSkills);
    const skillsnaming = JSON.parse(graphique.dataset.skillsName);
    const graph = new Chart(graphique, {
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
    })
  })
};
export { initGraphix };
