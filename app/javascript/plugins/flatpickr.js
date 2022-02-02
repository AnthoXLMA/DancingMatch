import flatpickr from "flatpickr"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"
const initFlatpickr = () => {
  const appointmentForm = document.getElementById('appointment-form-div');
  if (appointmentForm) {
    const appointments = JSON.parse(appointmentForm.dataset.appointmentsDate);
    flatpickr("#range_start", {
      plugins: [new rangePlugin({ input: "#range_end"})],
      minDate: "today",
      inline: true,
      dateFormat: "Y-m-d",
      "disable": appointments,
    })
  }
};

export { initFlatpickr };
