export { initClickMe } ;

const initClickMe = () => {
  const subscription = document.querySelector("#click-participate");
    subscription.addEventListener('click', (event) => {
  event = document.querySelector(".information-event h3");
  event.insertAdjacentHTML('beforeend', 'U.Connexion');
  console.log(event)
  });
};
