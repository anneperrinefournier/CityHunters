import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="swipe-map"
export default class extends Controller {
  static targets = ["swipe", "unroll", "police"]
  connect() {
    console.log("hello from the swipe controller")
  }

  swipe() {
    console.log("ça marche?")
    if (this.unrollTarget.style.transform === "translateX(-100vw)") {
      this.unrollTarget.style.transform = "translateX(0vw)";
    } else {
      this.unrollTarget.style.transform = "translateX(-100vw)";
      this.policeTarget.style.paddingLeft = "15px";
    }
    // this.swipeTarget.style.transform = "translateX(100%)";
  }
}
