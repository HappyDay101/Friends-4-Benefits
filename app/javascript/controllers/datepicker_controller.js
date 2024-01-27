import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

export default class extends Controller {
  connect() {
    console.log("Flatpickr being initialized on:", this.element);
    flatpickr(this.element);
  }
}
