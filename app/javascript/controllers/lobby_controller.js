import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="lobby"
export default class extends Controller {
  static values = { id: Number, participationId: Number }
  static targets = ['players']

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "LobbyChannel", id: this.idValue },
      { received: data => this.#addPlayerLobby(data) }
    )

    navigator.geolocation.getCurrentPosition((data) => {
      console.log({
        longitude: data.coords.longitude,
        latitude: data.coords.latitude,
        participation_id: this.participationIdValue
      })
    })
  }

  #addPlayerLobby(data) {
    this.playersTarget.innerText = ""
    this.playersTarget.insertAdjacentHTML("beforeend", data)
  }
}
