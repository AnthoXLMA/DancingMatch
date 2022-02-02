const initClickMe = () => {
  const button = document.getElementById('click-participate');
  button.addEventListener('click', (event) => {
    const appointment_selected = document.getElementById('event-uptitle h3');
    button.insertAdjacentHTML("beforeend", appointment_selected);
  })
};
export { initClickMe } ;
