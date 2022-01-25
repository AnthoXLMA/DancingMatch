import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';
mapboxgl.workerClass = require('worker-loader!mapbox-gl/dist/mapbox-gl-csp-worker').default;

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  if (mapElement) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/anthoxlma/ckda6nvtt0wzd1io6jwb62iau',
      center: [2.351523670379514, 48.85222877948316],
      zoom: 10,
    });

    const markers = JSON.parse(mapElement.dataset.markers);

      markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
    const element = document.createElement('div');
      element.className = 'marker';
      element.style.backgroundImage = `url('${marker.image_url}')`;
      element.style.backgroundSize = 'no-repeat';
      element.style.width = '25px';
      element.style.height = '60px';
    new mapboxgl.Marker(element)
    .setLngLat([marker.lng, marker.lat])
    .setPopup(popup)
    .addTo(map);
    });

    // dancers_location
    const dancers = JSON.parse(mapElement.dataset.dancers);
      dancers.forEach((dancer) => {
    const popup = new mapboxgl.Popup().setHTML(dancer.infoWindow);
    const element = document.createElement('div');
      element.className = 'marker';
      element.style.backgroundImage = `url('${dancer.image_url}')`;
      element.style.backgroundSize = 'no-repeat';
      element.style.width = '25px';
      element.style.height = '60px';

  new mapboxgl.Marker(element)
    .setLngLat([dancer.lng, dancer.lat])
    .setPopup(popup)
    .addTo(map);
    });
      // events_dance_id_location
    const events = JSON.parse(mapElement.dataset.events);
      events.forEach((event) => {
    const popup = new mapboxgl.Popup().setHTML(event.infoWindow);
    const element = document.createElement('div');
      element.className = 'marker';
      element.style.backgroundImage = `url('${event.image_url}')`;
      element.style.backgroundSize = 'no-repeat';
      element.style.width = '25px';
      element.style.height = '60px';

  new mapboxgl.Marker(element)
    .setLngLat([event.lng, event.lat])
    .setPopup(popup)
    .addTo(map);
    });
  };
}

export { initMapbox } ;


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
