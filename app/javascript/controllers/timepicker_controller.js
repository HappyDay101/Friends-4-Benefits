import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="timepicker"
export default class extends Controller {
  connect() {
    flatpickr(this.element, {
      enableTime: true,
      noCalendar: true,
      dateFormat: "H:i",
      time_24hr: true,
      minuteIncrement: 15,
    })
  }
}
