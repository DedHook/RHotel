import { Application } from "@hotwired/stimulus"

//= require moment
//= require daterangepicker

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application