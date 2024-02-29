import { Controller } from "@hotwired/stimulus";
import { createConsumer } from "@rails/actioncable";
import UserGeolocation from "./user_geolocation";

// Connects to data-controller="lobby"
export default class extends UserGeolocation(Controller) {
  static values = {
    id: Number,
    participationId: Number
  }
  static targets = ['players']

  initialize() {
    this.token = document.querySelector('meta[name="csrf-token"]').content
    this.channel = createConsumer().subscriptions.create(
      { channel: "GameChannel", id: this.gameIdValue },
      { received: data => this.#handleData(data) }
    )

    this.channel = createConsumer().subscriptions.create(
      { channel: "LobbyChannel", id: this.idValue },
      { received: data => this.#handleData(data) }
    )
  }

  connect() {
    this.locateUser();
  }

  #addPlayerLobby(data) {
    this.playersTarget.innerText = ""
    this.playersTarget.insertAdjacentHTML("beforeend", data)
  }

  #handleData(data) {
    if (data.data_type == 'add_player') {
      this.#addPlayerLobby(data.html)
    }

    if (data.data_type == "redirect") {
      window.location.href = data.url
    }
  }
}
