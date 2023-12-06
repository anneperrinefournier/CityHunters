import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["swipe", "unroll", "police", "showmap"]
  connect() {
    const bigContainer = document.querySelector('.big-container');
    const stickyElement = document.querySelector('.parent');
    const rectangle = document.querySelector('.rectangle-swipe');

    window.addEventListener('scroll', (event) => {
      const scrolly = window.scrollY
        stickyElement.style.top = `${scrolly}px`;
      });
    }

  swipe() {
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
  };
}