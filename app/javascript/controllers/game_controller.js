import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="game"
export default class extends Controller {
  static values = { id: Number }
  static targets = ['riddle', 'introduction', 'enigme'];

  connect() {
    console.log("Hi from game controller")

    this.channel = createConsumer().subscriptions.create(
      { channel: "GameChannel", id: this.idValue },
      { recieved: data => console.log(data) }
    )
  }

  closeIntroduction() {
    this.riddleTarget.classList.remove('d-none')
    this.introductionTarget.classList.add('d-none')
  }
}
