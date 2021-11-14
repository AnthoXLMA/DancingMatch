// const searchAlgoliaPlaces = (event) => {
//   fetch("https://places-dsn.algolia.net/1/places/query", {
//     method: "POST",
//     body: JSON.stringify({ query: event.currentTarget.value })
//   })
//     .then(response => response.json())
//     .then((data) => {
//       console.log(data.hits); // Look at local_names.default
//     });
// };

// const input = document.querySelector(".search1");
// input.addEventListener("keyup", searchAlgoliaPlaces);

// export { searchAlgoliaPlaces } ;

// var cats = [];
// for (var i = 0; i < geojson.length; i++) {
//     var cat = getCat(cats, geojson[i].properties.categorie2);
//     if (cat === undefined) {
//         cat = {
//             "interestPoints" : createInterestPoints(),
//             "id" : "cat" + i,
//             "label" : geojson[i].properties.categorie2
//         }
//         cats.push(cat);
//     }
//     cat["interestPoints"].addData(geojson[i]);
// }

// var stamen = new L.StamenTileLayer("toner-lite");

// var map = new L.Map("map", {
//     center: new L.LatLng(48.825, 2.27),
//     zoom: 15,
//     layers: [stamen],
// });

// var command = L.control({position: 'topright'});
// command.onAdd = function (map) {
//     var div = L.DomUtil.create('div', 'command');
//     div.innerHTML += '<div style="text-align:center;"><span style="font-size:18px;">Points d\'intérêt</span><br /><span style="color:grey;font-size:14px;">(ville d\'Issy-Les-Moulineaux)</span></div>';
//     for (var i = 0; i < cats.length; i++) {
//         div.innerHTML += '<form><input id="' + cats[i]["id"] + '" type="checkbox"/>' + cats[i]["label"] + '</form>';
//     }
//     return div;
// };
// command.addTo(map);


// for (var i = 0; i < cats.length; i++) {
//     document.getElementById(cats[i]["id"]).addEventListener("click", handleCommand, false);
// }

// function handleCommand() {
//     var selectedCat;
//     for (var i = 0; i < cats.length; i++) {
//         if (cats[i]["id"] === this.id) {
//             selectedCat = cats[i];
//             break;
//         }
//     }
//     if (this.checked) {
//         selectedCat["interestPoints"].addTo(map);
//     } else {
//         map.removeLayer(selectedCat["interestPoints"]);
//     }
// }
