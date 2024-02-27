import { Controller } from "@hotwired/stimulus";
import { createConsumer } from "@rails/actioncable";
import Swal from 'sweetalert2';


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

    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(
        (dataUser) => {
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
        },
        this.#showError,
      );
    } else {
      console.log("Geolocation is not supported by this browser.");
    }
  }

  #showError(error) {
    switch(error.code) {
      case error.PERMISSION_DENIED:
        console.log("User denied the request for Geolocation.");
        Swal.fire({
          title: "Où êtes-vous?",
          text: "La localisation est désactivée, assurez vous d'activer la localisation pour city hunters dans les paramètres",
          confirmButtonText: "Compris",
          customClass: {
            popup: 'swal-modal',
            confirmButton: 'btn-home'
          }
        })
        break;
      case error.POSITION_UNAVAILABLE:
        console.log("Location information is unavailable.");
        break;
      case error.TIMEOUT:
        console.log("The request to get user location timed out.");
        break;
      case error.UNKNOWN_ERROR:
        console.log("An unknown error occurred.");
        break;
    }
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
