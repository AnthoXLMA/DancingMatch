// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require ("jquery2").start()


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)
// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// CSS
import 'mapbox-gl/dist/mapbox-gl.css';
import { initChart } from '../plugins/init_chart';
import { initSiema } from '../plugins/init_siema';
// internal imports
import { initMapbox } from '../plugins/init_mapbox';
import { initClickMe } from '../plugins/init_click_me';
import { searchAlgoliaPlaces } from '../plugins/init_autocomplete';
import { input } from '../plugins/form';
import { createInterestPoints } from '../plugins/geojson-data';
import { cats } from '../plugins/geojson-data';
import { formControl } from '../plugins/form';
import { initCompare } from '../plugins/init_compare';
import { appointmentsId } from '../components/appointment';
// import { initProgressBar } from '../plugins/init_progressbar';
import { ChangeSlide } from '../plugins/slider';
import { slide } from '../plugins/slider';
import { numero }from '../plugins/slider';
import { initCalendar } from '../components/calendrier';

document.addEventListener('turbolinks:load', () => {
  // initMapbox();
  // ChangeSlide();
  // initCalendar();
  // initCompare();
});

// External imports
import "bootstrap";
// import swal from 'sweetalert';

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

// import "fichier js "
// import initNavTabs from '../components/init_nav_tabs';

