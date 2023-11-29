import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="lobby"
export default class extends Controller {
  static values = { id: Number }

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "LobbyChannel", id: this.idValue },
      { received: data => console.log(data) }
    )

    console.log(`Subscribed to the chatroom with the id ${this.idValue}.`)
  }
}
