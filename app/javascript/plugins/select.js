// TODO: React to a click on the button!
const button = document.querySelector('#clickme');
const audio = new Audio('sound.mp3');

button.addEventListener('click', (e) => {
  e.target.classList.add('disabled');
  e.target.innerText = 'Bingo!';
  audio.play();
});



const franceElement = () => {
  // TODO 2: select the France list item and return it!
  const france = document.getElementById('france');
  return france;
};

module.exports = franceElement; // Do not remove.
