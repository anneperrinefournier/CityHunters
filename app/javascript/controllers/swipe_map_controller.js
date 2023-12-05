import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="swipe-map"
export default class extends Controller {
  static targets = ["swipe", "unroll", "police", "showmap"]
  connect() {
    console.log("hello from the swipe controller")


    const bigContainer = document.querySelector('.big-container');
    const stickyElement = document.querySelector('.parent');
    const rectangle = document.querySelector('.rectangle-swipe');

    window.addEventListener('scroll', (event) => {

      const scrolly = window.scrollY
      console.log(scrolly)
        stickyElement.style.top = `${scrolly}px`;
      });
    }

  swipe() {
    console.log("ça marche?")
    if (this.unrollTarget.style.transform === "translateX(-100vw)") {
      this.unrollTarget.style.transform = "translateX(0vw)";
      this.policeTarget.style.marginLeft = "400px";
      this.showmapTarget.classList.remove("font-police");
      this.showmapTarget.style.marginLeft = "-14px";

    } else {
      this.unrollTarget.style.transform = "translateX(-100vw)";
      this.policeTarget.style.marginLeft = "-30px";
      this.showmapTarget.classList.add("font-police");
      this.showmapTarget.style.marginLeft = "14px";
    }
    // this.swipeTarget.style.transform = "translateX(100%)";
  };
}
