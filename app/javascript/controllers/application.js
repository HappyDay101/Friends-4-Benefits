import { Application } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Start Stimulus application
const application = Application.start();

import DatepickerController from "./datepicker_controller";
import TimepickerController from "./timepicker_controller";

application.register("datepicker", DatepickerController);
application.register("timepicker", TimepickerController);

application.debug = false;
window.Stimulus = application;

export { application };
