// const form = document.querySelector(".form-control");

const searchAlgoliaPlaces = (event) => {
  fetch("https://places-dsn.algolia.net/1/places/query", {
    method: "POST",
    body: JSON.stringify({ query: event.currentTarget.value })
  })
    .then(response => response.json())
    .then((data) => {
      console.log(data.hits); // Look at local_names.default
    });
};

const input = document.querySelector(".form-control");
input.addEventListener("keyup", searchAlgoliaPlaces);


const form = document.querySelector(".form-control");
form.addEventListener('click', (action) => {
  form.documentquerySelector(".information-event h3");
console.log(action)
});

// if (!document.monForm.gender.checked) {
//   alert("Vous avez choisi votre genre");
//   return false ;
// }

export { searchAlgoliaPlaces } ;
export { input } ;
