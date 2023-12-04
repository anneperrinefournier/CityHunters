import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"
import mapboxgl from 'mapbox-gl' // Don't forget this!

export default class extends Controller {
  static values = {
    id: Number,
    participationId: Number,
    apiKey: String,
    markers: Array,
    participationsMarkers: Array
  }

  static targets = [
    'pageHandle',
    'riddlesHandle',
    'introduction',
    'enigme',
    'placeTabs',
    'placeTab',
    'placePanel',
    'displayAnswerBtn',
    'map',
    'endGameButton',
    'endGame'
  ];

  initialize() {
    this.token = document.querySelector('meta[name="csrf-token"]').content
    this.channel = createConsumer().subscriptions.create(
      { channel: "GameChannel", id: this.idValue },
      { received: data => this.#handleData(data) }
    )
  }

  connect() {
    navigator.geolocation.watchPosition((coordinates) => {
      this.channel.send({
        participation_id: participation_id,
        longitude: coordinates.coords.longitude,
        latitude: coordinates.coords.latitude,
      })
    })

    this._initMap();
    console.log(this.participationsMarkersValue);
  }

  _initMap() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.mapTarget,
      style: "mapbox://styles/mapbox/streets-v10"
    })

    this.#addMarkersToMap()
    this.#addPlayerMakersToMap()
    this.#fitMapToMarkers()
  }

  #handleData(data) {
    if (data.type === 'redirect') {
      window.location.href = data.url;
    }

    if (data.type === "update_position") {
      this.playerMarkers
        .filter(item => item.participation_id === data.participation_id)
        .setLngLat([ data.lng, data.lat ])

      if (data.game_status == 'ended') {
        this.pageHandleTarget.innerHTML = data.content;
      } else if (data.game_status == 'running') {
        this.riddlesHandleTarget.innerHTML = data.content;
        this.displayAnswerBtnTarget.classList.remove('d-none');
        this.displayAnswerBtnTarget.scrollIntoView(true)
      }
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

  #addPlayerMakersToMap() {
    this.playerMarkers = []

    this.participationsMarkersValue.forEach((marker) => {
      this.playerMarkers.push({
        participation_id: marker.participation_id,
        marker: new mapboxgl.Marker()
                            .setLngLat([ marker.lng, marker.lat ])
                            .addTo(this.map)
      })
    })
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
