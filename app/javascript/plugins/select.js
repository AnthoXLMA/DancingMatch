// TODO: React to a click on the button!
const button = document.querySelector('#clickme');
const audio = new Audio('sound.mp3');

button.addEventListener('click', (e) => {
  e.target.classList.add('disabled');
  e.target.innerText = 'Bingo!';
  audio.play();
});



const salsaElement = () => {
  // TODO 2: select the France list item and return it!
  const salsa = document.getElementById('salsa');
  return salsa;
};

module.exports = salsaElement; // Do not remove.
