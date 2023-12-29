import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['description', 'introduction'];

  connect() {
    this.descriptionTarget.style.height = this.descriptionTarget.scrollHeight + 'px';
    this.introductionTarget.style.height = this.introductionTarget.scrollHeight + 'px';
  }

  adjustHeight(event) {
    event.currentTarget.style.height = event.currentTarget.scrollHeight + 'px';
  }
}
