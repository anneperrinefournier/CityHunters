import { Controller } from "@hotwired/stimulus";
import { createConsumer } from "@rails/actioncable";
import mapboxgl from 'mapbox-gl';
import Swal from 'sweetalert2';
// import { Map } from './map'

// export default class extends Map(Controller) {
export default class extends Controller {
  static values = {
    gameId: Number,
    apiKey: String,
    placesMarkers: Array,
    participationsMarkers: Array,
    participationId: Number,
    stateMessageIndex: Number
  }

  static targets = [
    'pageHandle',
    'riddlesHandle',
    'introduction',
    'placeTab',
    'placePanel',
    'displayAnswerBtn',
    'positionButton',
    'riddleContainer'
  ];

  initialize() {
    this.token = document.querySelector('meta[name="csrf-token"]').content
    this.channel = createConsumer().subscriptions.create(
      { channel: "GameChannel", id: this.gameIdValue },
      { received: data => this.#handleData(data) }
    );
    this.channel.connected = () => {
      this.channel.send({
          data_type: 'fetch_missed_messages',
          game_id: this.gameIdValue,
          participation_id: this.participationIdValue,
          state_message_index: this.stateMessageIndexValue
      });
    };
  }

  connect() {
    this.locateUser();

    this.addAllMarkersToMap(this.placesMarkersValue)
    this.addPlayerMarkersToMap(this.participationMarkersValue)
    this.fitMapToMarkers()
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

  #handleData(data) {
    if (data.data_type === 'redirect') {
      window.location.href = data.url;
      return;
    }

    if (data.data_type === "update_position") {
      const player = this.playerMarkers.find(item => item.participation_id === data.participation_id)
      player.marker.setLngLat([data.longitude, data.latitude])
      return;
    }

    if (data.data_type == 'update_riddle' &&
        data.state_message_index > this.stateMessageIndexValue) {

      this.stateMessageIndexValue = data.state_message_index;
      this.riddlesHandleTarget.innerHTML = data.content;
      this.displayAnswerBtnTarget.classList.remove('d-none');
      const lastItem = this.riddleContainerTargets[this.riddleContainerTargets.length - 1];
      lastItem.scrollIntoView(true)
      return;
    }

    if (data.data_type == 'new_marker') {
      this.addMarkerToMap(data.content)
      return
    }

    if (data.data_type == 'update_game_content') {
      this.pageHandleTarget.innerHTML = data.content;
      return;
    }

    if (data.data_type === 'toast') {
      this.#showToast(data.text);
      return;
    }
  }

  #showToast(text) {
    Toastify({
      text: text,
      duration: 3000,
      style: {
        background: '#1d2b48'
      }
    }).showToast()
  }

  async verifyPosition(event) {
    event.preventDefault();
    event.stopPropagation();

    const player = this.playerMarkers.find(item => item.participation_id === this.participationIdValue)

    let userResponse = new FormData();
    userResponse.append('answer_type', 'new_shifting_answer');
    userResponse.append('game_id', this.gameIdValue);
    userResponse.append('riddle_id', this.positionButtonTarget.dataset.riddleId);
    userResponse.append('participation_id', this.participationIdValue);
    userResponse.append('longitude:', player.marker._lngLat.lng);
    userResponse.append('latitude:', player.marker._lngLat.lat);

    const options = {
      method: 'POST',
      headers: {
        "Accept": "application/json",
        "X-CSRF-TOKEN": this.token
      },
      body: userResponse
    }

    const response = await fetch(`/verify`, options);
    const data = await response.json()

    if (data.status != 'ok') {
      Swal.fire({
        title: data.title,
        text: data.message,
        confirmButtonText: data.button_text,
        customClass: {
          popup: 'swal-modal',
          confirmButton: 'btn-home'
        }
      })
    };
  }

  closeIntroduction() {
    this.riddlesHandleTarget.classList.remove('d-none')
    this.riddlesHandleTarget.scrollIntoView(true);
    this.introductionTarget.classList.add('d-none')
    this.mapTarget.classList.remove('d-none')

    if (this.displayAnswerBtnTarget) {
      this.displayAnswerBtnTarget.classList.remove('d-none')
    }
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
    if (tabIndex != undefined) {
      this.placePanelTargets.forEach(panel => {
        panel.classList.add('d-none')
      })
      this.placePanelTargets.find(panel => {
        return panel.dataset.index == tabIndex
      }).classList.remove('d-none')
    }
  }

  async endGame() {
    const options = {
      method: 'GET',
      headers: {
        "Accept": "application/json",
        "X-CSRF-TOKEN": this.token
      },
    };

    const response = await fetch(`/games/${this.gameIdValue}/end`, options);
  }
}
