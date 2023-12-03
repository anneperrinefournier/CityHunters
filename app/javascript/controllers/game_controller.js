import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="game"
export default class extends Controller {
  static values = { id: Number }
  static targets = ['pageHandle', 'riddlesHandle', 'introduction', 'enigme', 'placeTabs', 'placeTab', 'placePanel', 'displayAnswerBtn'];

  connect() {
    console.log('Game controller connected')
    this.channel = createConsumer().subscriptions.create(
      { channel: "GameChannel", id: this.idValue },
      { received: data => this.#updateView(data) }
    )
  }

  closeIntroduction() {
    this.riddlesHandleTarget.classList.remove('d-none')
    this.introductionTarget.classList.add('d-none')
    this.displayAnswerBtnTarget.classList.remove('d-none')
  }

  activate(event) {
    event.preventDefault()
    this.placeTabTargets.forEach(tab => {
      tab.classList.remove('active')
    });
    event.currentTarget.classList.add('active');
  }

  switchPanel(event) {
    const tabIndex = event.target.dataset.index

    this.placePanelTargets.forEach(panel => {
      panel.classList.add('d-none')
    })
    this.placePanelTargets.find( (panel) => {
      return panel.dataset.index == tabIndex
    }).classList.remove('d-none')
  }

  #updateView(data) {
    if (data.game_status == 'over') {
      this.pageHandleTarget.innerHTML = data.content;
    } else if (data.game_status == 'running') {
      this.riddlesHandleTarget.innerHTML = data.content;
      this.displayAnswerBtnTarget.classList.remove('d-none');
      this.pageHandle.scrollTo({
        top: this.pageHandleTarget.scrollHeight,
        behavior: 'smooth'
      })
    }
  }
}
