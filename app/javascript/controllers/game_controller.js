import { Controller } from "@hotwired/stimulus";
import { createConsumer } from "@rails/actioncable";
import mapboxgl from 'mapbox-gl';
import UserGeolocation from "./user_geolocation.js";
import Swal from 'sweetalert2';

export default class extends UserGeolocation(Controller) {
  static values = {
    gameId: Number,
    apiKey: String,
    markers: Array,
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
    'map',
    'mapForm',
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
    this._initMap();
  }

  _initMap() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.mapTarget,
      style: "mapbox://styles/anneperrine/clpqvu9za014201pke2o7alpm"
    })

    this.#addAllMarkersToMap()
    this.#addPlayerMarkersToMap()
    this.#fitMapToMarkers()
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
      this.#addMarkerToMap(data.content)
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
    userResponse.append('riddle_id', this.mapFormTarget.dataset.riddleId);
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

  #addPlayerMarkersToMap() {
    this.playerMarkers = []

    this.participationsMarkersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)

      const customMarker = document.createElement('div');
      customMarker.className = `marker ${marker.marker_class}`;
      customMarker.innerHTML = marker.participation_marker_html

      this.playerMarkers.push({
        participation_id: marker.participation_id,
        marker: new mapboxgl.Marker(customMarker)
                            .setLngLat([ marker.lng, marker.lat ])
                            .setPopup(popup)
                            .addTo(this.map)
      })
    })
  }

  #addAllMarkersToMap() {
    this.markersValue.forEach((marker) => {
      this.#addMarkerToMap(marker)
    })
  }

  #addMarkerToMap(marker) {
    const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)

    const customMarker = document.createElement('div');
    customMarker.className = `marker ${marker.marker_class}`;
    customMarker.innerHTML = marker.marker_html

    new mapboxgl.Marker(customMarker)
                .setLngLat([ marker.lng, marker.lat ])
                .setPopup(popup)
                .addTo(this.map)
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.concat(this.participationsMarkersValue).forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 80, maxZoom: 15, duration: 0 })
  }
}
