import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { id: Number }
  static targets = ['riddle', 'introduction', 'enigme', 'placeTabs', 'placeTab', 'placePanel', 'displayAnswerBtn', 'map', 'endGameButton', 'endGame'];

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "GameChannel", id: this.idValue },
      { received: data => console.log(data) }
    )
  }

  closeIntroduction() {
    this.riddleTarget.classList.remove('d-none')
    this.introductionTarget.classList.add('d-none')
    this.mapTarget.classList.remove('d-none')
    this.endGameButtonTarget.classList.remove("d-none")
    if (this.displayAnswerBtnTarget) {
      this.displayAnswerBtnTarget.classList.remove('d-none')
    }
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

  endGame() {
    console.log("End game method called")
    console.log("End game button target:", this.endGameButtonTarget)
    console.log("endGame target:", this.endGameTarget)

    // Add logic for handling the end of the game
    // For example, hide other elements and display the endGame
    this.introductionTarget.classList.add('d-none')
    this.displayAnswerBtnTarget.classList.add('d-none')
    this.endGameButtonTarget.classList.add("d-none")
    this.endGameTarget.classList.remove('d-none')
    this.riddleTarget.classList.add('d-none')
    this.mapTarget.classList.add('d-none')
    if (this.displayAnswerBtnTarget) {
      this.displayAnswerBtnTarget.classList.add('d-none')
    }

  }
}
