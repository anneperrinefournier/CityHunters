import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="game"
export default class extends Controller {
  static targets = ['riddle', 'introduction'];

  connect() {
    console.log("Hi from game controller")
  }

  closeIntroduction() {
    this.riddleTarget.classList.remove('d-none')
    this.introductionTarget.classList.add('d-none')
  }
}
