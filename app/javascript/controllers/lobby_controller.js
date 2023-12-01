import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

// Connects to data-controller="lobby"
export default class extends Controller {
  static values = { id: Number, participationId: Number }
  static targets = ['players']

  connect() {
    this.token = document.querySelector('meta[name="csrf-token"]').content
    this.channel = createConsumer().subscriptions.create(
      { channel: "LobbyChannel", id: this.idValue },
      { received: data => this.#handleData(data) }
    )

    navigator.geolocation.getCurrentPosition((dataUser) => {
      const latitude = dataUser.coords.latitude;
      const longitude = dataUser.coords.longitude;
      const participation_id = this.participationIdValue;
      const datas = {
        latitude: latitude,
        longitude: longitude,
        participation_id: participation_id
      }

      const form = new FormData
      form.append('longitude', datas.longitude)
      form.append('latitude', datas.latitude)
      form.append('participation_id', datas.participation_id)

      const options = {
        method: 'PATCH',
        headers: {
          "Accept": "application/json",
          "X-CSRF-TOKEN": this.token
        },
        body: form
      }

      const response = fetch(`/update`, options);
      // const data = response.json()
    })
  }

  #addPlayerLobby(data) {
    this.playersTarget.innerText = ""
    this.playersTarget.insertAdjacentHTML("beforeend", data)
  }

  #handleData(data) {
    if (data.type == 'html') {
      this.#addPlayerLobby(data.html)
    }

    if (data.type == "redirect") {
      window.location.href = data.url
    }
  }
}
