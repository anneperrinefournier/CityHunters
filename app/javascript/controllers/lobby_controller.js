import { Controller } from "@hotwired/stimulus";
import { createConsumer } from "@rails/actioncable";
import Swal from 'sweetalert2';

// Connects to data-controller="lobby"
export default class extends Controller {
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

  locateUser() {
    if (navigator.geolocation) {
      navigator.geolocation.watchPosition(
        (coordinates) => {
          this.channel.send({
            data_type: 'set_player_position',
            participation_id: this.participationIdValue,
            longitude: coordinates.coords.longitude,
            latitude: coordinates.coords.latitude,
          })
        },
        this.#showError,
      );
    } else {
      //Geolocation is not supported by this browser.
      Swal.fire({
        title: "Où êtes-vous?",
        text: "La localisation n'est pas supporté par ce navigateur",
        confirmButtonText: "Compris",
        customClass: {
          popup: 'swal-modal',
          confirmButton: 'btn-home'
        }
      })
    }
  }

  #showError(error) {
    switch(error.code) {
      case error.PERMISSION_DENIED:
        //User denied the request for Geolocation.
        Swal.fire({
          title: "Où êtes-vous?",
          text: "City Hunters ne peut pas savoir où vous êtes, assurez vous d'autoriser la localisation pour City Hunters dans les paramètres",
          confirmButtonText: "Compris",
          customClass: {
            popup: 'swal-modal',
            confirmButton: 'btn-home'
          }
        })
        break;
      case error.POSITION_UNAVAILABLE:
        // Localisation unavailable
        Swal.fire({
          title: "Où êtes-vous?",
          text: "La localisation est désactivée, assurez vous d'activer et d'autoriser la localisation pour City Hunters dans les paramètres",
          confirmButtonText: "Compris",
          customClass: {
            popup: 'swal-modal',
            confirmButton: 'btn-home'
          }
        })
        break;
      case error.TIMEOUT:
        // The request to get user location timed out.
        break;
      case error.UNKNOWN_ERROR:
        // An unknown error occurred.
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
