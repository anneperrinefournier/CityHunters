import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['description', 'introduction', 'placesContainer', 'placeTemplate'];

  connect() {
    this.descriptionTarget.style.height = this.descriptionTarget.scrollHeight + 'px';
    this.introductionTarget.style.height = this.introductionTarget.scrollHeight + 'px';
  }

  adjustHeight(event) {
    event.currentTarget.style.height = event.currentTarget.scrollHeight + 'px';
  }

  addPlace(event) {
    event.preventDefault();
    console.log("Adding place");
    const clone = this.placeTemplateTarget.content.cloneNode(true)
    console.log(clone)
    // clone.classList.remove('d-none')
    this.placesContainerTarget.insertAdjacentHTML('beforeend', this.placeTemplateTarget.innerHTML);
  }
}
