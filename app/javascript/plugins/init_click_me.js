// const initClickMe = () => {
//   var buttons = document.querySelectorAll('#click-participate');
//   var button = buttons.forEach(button => {
//     let callajax = button.addEventListener('submit', (event) => {
//     function xclix () {
//       console.log(this.responseText);
//       var json  = JSON.parse(this.response);
//       var eur   = parseInt(json.EUR);
//       var dt    = new Date();
//       document.getElementById("cours").innerHTML=eur+ "&euro;";
//       document.querySelector("#resultats").innerHTML="Maj "+dt.toLocaleString();
//       const appointment_selected = document.getElementById('event-uptitle h3');
//       button.insertAdjacentHTML("beforeend", appointment_selected);
//       }
//       var oReq    = new XMLHttpRequest();
//       oReq.addEventListener("load", reqListener);
//       oReq.open("GET", "https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms=EUR");
//       oReq.send();
//     })
//   });
// };
// export { initClickMe } ;

// DEMONSTRATION APPELS ASYNCRHONES
// const initClickMe = () => {
//   var buttons = document.querySelectorAll('#click-participate');
//   // const results = document.querySelector("#results")
//   var button  = buttons.forEach(button => {
//     var callajax = button.addEventListener('click', (event) => {
//     function reqListener () {
//       console.log(this.responseText);
//       var json  = JSON.parse(this.response);
//       var eur   = parseInt(json.EUR);
//       var dt    = new Date();
//       document.getElementById("cours").innerHTML=eur+ "&euro;";
//       document.querySelector("#resultats").innerHTML="Maj "+dt.toLocaleString();
//     }
//     var oReq    = new XMLHttpRequest();
//     oReq.addEventListener("load", reqListener);
//     oReq.open("GET", "https://min-api.cryptocompare.com/data/price?fsym=BTC&tsyms=EUR");
//     oReq.send();
//       })
//   });
// };
// export { initClickMe } ;
