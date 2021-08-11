import mapboxgl from 'mapbox-gl';
mapboxgl.workerClass = require('worker-loader!mapbox-gl/dist/mapbox-gl-csp-worker').default;

const initMapbox = () => {
  const mapElement = document.getElementById('map');
  if (mapElement) {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/anthoxlma/ckda6nvtt0wzd1io6jwb62iau',
      center: [2.3522219, 48.856614],
      zoom: 3,
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

export { initMapbox };
