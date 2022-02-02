// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

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
// internal imports
// import { initMapbox } from '../plugins/init_mapbox';
import { initClickMe } from '../plugins/init_click_me';
import { selectEvent } from '../plugins/select_event';
import { addElement } from '../plugins/text';
// import { initChart } from '../plugins/init_chart';
import { initSiema } from '../plugins/init_siema';
import { iniCompare } from '../plugins/init_compare';
import {initFlatpickr} from '../plugins/flatpickr';
// import flatpickr from "flatpickr"
// import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

// SUPPRIME LA MAP QUAND EST ACTIVE : FLATPICKR //
// import { initFlatpickr } from '../plugins/initFlatpickr';
// SUPPRIME LA MAP QUAND EST ACTIVE : FLATPICKR //

document.addEventListener('turbolinks:load', () => {
  // initMapbox();
  // initFlatpickr();
  initClickMe();
  // ChangeSlide();
  // initCalendar();
  // initCompare();
  // selectEvent();
});

// External imports
import "bootstrap";
// import swal from 'sweetalert';

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

// import "fichier js "
// import initNavTabs from '../components/init_nav_tabs';

