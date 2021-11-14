// TODO: React to a click on the button!
const button = document.querySelector('#clickme');
const audio = new Audio('sound.mp3');

button.addEventListener('click', (e) => {
  e.target.classList.add('disabled');
  e.target.innerText = 'Bingo!';
  audio.play();
});

// const salsaElement = () => {
//   // TODO 2: select the Salsa list item and return it!
//   const salsa = document.getElementById('salsa');
//   return salsa;
// };

// module.exports = salsaElement; // Do not remove.

// const monthString = "Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec";
// const months = monthString.split(",");
// // => [ 'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec' ]
// months.length;
// // => 12

const button = document.querySelector('#click-me');
button.addEventListener('click', (event) => {
  console.log(event);
});
