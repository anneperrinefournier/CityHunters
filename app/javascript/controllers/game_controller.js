import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="game"
export default class extends Controller {
  static values = { id: Number }
  static targets = ['riddle', 'introduction', 'enigme', 'placeTabs', 'placeTab', 'placePanel', 'displayAnswerBtn'];

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "GameChannel", id: this.idValue },
      { received: data => console.log(data) }
    )
  }

  closeIntroduction() {
    this.riddleTarget.classList.remove('d-none')
    this.introductionTarget.classList.add('d-none')
    this.displayAnswerBtnTarget.classList.remove('d-none')
  }

  activate(event) {
    event.preventDefault()
    console.log(this.placeTabTargets)
    this.placeTabTargets.forEach(tab => {
      tab.classList.remove('active')
    });
    event.currentTarget.classList.add('active');
  }

  switchPanel(event) {
    const tabIndex = event.target.dataset.index
    console.log(tabIndex)

    this.placePanelTargets.forEach(panel => {
      panel.classList.add('d-none')
    })
    this.placePanelTargets.find( (panel) => {
      return panel.dataset.index == tabIndex
    }).classList.remove('d-none')
  }
}
