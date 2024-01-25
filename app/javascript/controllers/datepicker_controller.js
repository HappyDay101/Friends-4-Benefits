import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

export default class extends Controller {
  connect() {
    flatpickr(this.element, {
      enableTime: false, // Set to true if you want to include time selection
      dateFormat: "Y-m-d", // Adjust the date format as needed
    });
  }
}
