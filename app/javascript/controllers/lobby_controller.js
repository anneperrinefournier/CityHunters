import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="lobby"
export default class extends Controller {
  static values = { id: Number, participationId: Number }

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "LobbyChannel", id: this.idValue },
      { received: data => console.log(data) }
    )

    navigator.geolocation.getCurrentPosition((data) => {
      console.log({
        longitude: data.coords.longitude,
        latitude: data.coords.latitude,
        participation_id: this.participationIdValue
      })
    })
  }
}
