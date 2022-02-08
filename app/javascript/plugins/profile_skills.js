function initSkills () {
  //SELECTIONNER TOUS LES ELEMENTS TABLEAUX
    let allGraphs = document.querySelectorAll('#graph1');
    // SEPARER CHAQUE ELEMENT DE l'ARRAY ALLGRAPHS
    const graph = allGraphs.forEach(array => {
      // PARSER LES DONNEES COMPETENCES ENONCEES DANS LA VUE
      const mySkills   = JSON.parse(array.dataset.userSkills);
      //
      const skillsnaming    = JSON.parse(array.dataset.skillsName);
      const graph = new Chart(array, {
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
    }
  )}
)};

export { initSkills };
