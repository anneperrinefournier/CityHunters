import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"
import mapboxgl from 'mapbox-gl' // Don't forget this!

export default class extends Controller {
  static values = {
    id: Number,
    apiKey: String,
    markers: Array
  }
  static targets = ['pageHandle', 'riddlesHandle', 'introduction', 'enigme', 'placeTabs', 'placeTab', 'placePanel', 'displayAnswerBtn', 'map', 'endGameButton', 'endGame'];

  connect() {
    console.log('Game controller connected')
    this.token = document.querySelector('meta[name="csrf-token"]').content
    this.channel = createConsumer().subscriptions.create(
      { channel: "GameChannel", id: this.idValue },
      { received: data => this.#handleData(data) }
    )

    navigator.geolocation.watchPosition((coordinates) => {
      this.channel.send({
        participation_id: 1, // participation_id,
        longitude: coordinates.coords.longitude,
        latitude: coordinates.coords.latitude,
      })
    })

    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10"
    })

    this.#addMarkersToMap()
    this.#fitMapToMarkers()
  }

  handleData(data) {
    if (data.type === 'redirect') {
      window.location.href = data.url;
    }
  }

  closeIntroduction() {
    this.riddlesHandleTarget.classList.remove('d-none')
    this.introductionTarget.classList.add('d-none')
    this.mapTarget.classList.remove('d-none')
    this.endGameButtonTarget.classList.remove("d-none")

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

    this.placePanelTargets.forEach(panel => {
      panel.classList.add('d-none')
    })
    this.placePanelTargets.find( (panel) => {
      return panel.dataset.index == tabIndex
    }).classList.remove('d-none')
  }

  #handleData(data) {
    if (data.type === 'redirect') {
      window.location.href = data.url;
    }

    if (data.game_status == 'ended') {
      this.pageHandleTarget.innerHTML = data.content;
    } else if (data.game_status == 'running') {
      this.riddlesHandleTarget.innerHTML = data.content;
      this.displayAnswerBtnTarget.classList.remove('d-none');
      this.displayAnswerBtnTarget.scrollIntoView(true)
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

    const response = await fetch(`/games/${this.idValue}/end`, options);
  }

  #addMarkersToMap() {
    this.markersValue.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)

      const customMarker = document.createElement('div');
      customMarker.className = `marker ${marker.marker_class}`;


      customMarker.innerHTML = marker.marker_html

      new mapboxgl.Marker(customMarker)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup)
        .addTo(this.map)
    })
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 0 })
  }
}
