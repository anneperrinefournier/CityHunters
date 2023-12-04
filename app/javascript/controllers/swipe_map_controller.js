import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="swipe-map"
export default class extends Controller {
  static targets = ["swipe", "unroll"]
  connect() {
    console.log("hello from the swipe controller")
  }

  swipe() {
    console.log("ça marche?")
    this.unrollTarget.style.transform = "translateX(-100%)";
    this.swipeTarget.style.transform = "translateX(100%)";
  }
}
