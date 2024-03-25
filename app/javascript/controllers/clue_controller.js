import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  static targets = [
    'displayClueBtn',
    'clueContent']

  connect() {
    console.log("Hello from clues_controller.js")
  }

  displayClueContent() {
    // this.clueContentTarget.classList.remove('d-none');
    this.displayClueBtnTarget.classList.add('d-none');
  }
}
