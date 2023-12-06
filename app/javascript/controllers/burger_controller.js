import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="burger"
export default class extends Controller {
  connect() {
    console.log("Happy meal or maxi best of?")
  }
}
