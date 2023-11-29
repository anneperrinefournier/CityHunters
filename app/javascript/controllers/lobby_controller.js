import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="lobby"
export default class extends Controller {
  static targets = ['players']
  static values = { id: Number }

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "LobbyChannel", id: this.idValue },
      { received: data => this.#addPlayerLobby(data) }
    )

    console.log(`Subscribed to the chatroom with the id ${this.idValue}.`)
  }

  #addPlayerLobby(data) {
    this.playersTarget.innerText = ""
    this.playersTarget.insertAdjacentHTML("beforeend", data)
  }
}
