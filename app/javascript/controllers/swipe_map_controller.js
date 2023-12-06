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
      this.policeTarget.classList.remove("swipe-left");
      this.policeTarget.classList.add("swipe-right");
      this.showmapTarget.classList.remove("font-police");
      this.showmapTarget.style.marginLeft = "-14px";
      this.showmapTarget.innerText = "MAP"
      this.showmapTarget.style.letterSpacing = "8px";


    } else {
      this.unrollTarget.style.transform = "translateX(-100vw)";
      // this.policeTarget.style.marginLeft = "-30px";
      //this.policeTarget.style.left = "";
      this.policeTarget.classList.remove("swipe-right");
      this.policeTarget.classList.add("swipe-left");
      this.showmapTarget.classList.add("font-police");
      this.showmapTarget.style.marginLeft = "14px";
      this.showmapTarget.innerText = "ENIGMES"
      this.showmapTarget.style.letterSpacing = "2px";
    }
  };
}
