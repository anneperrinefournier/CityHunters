import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"
import mapboxgl from 'mapbox-gl' // Don't forget this!

// Connects to data-controller="game"
// Connects to data-controller="map"

export default class extends Controller {
  static values = {
    id: Number,
    apiKey: String,
    markers: Array
  }
  static targets = ['riddle', 'introduction', 'enigme', 'placeTabs', 'placeTab', 'placePanel', 'displayAnswerBtn'];

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "GameChannel", id: this.idValue },
      { received: data => #handleData(data) }
    )

    navigator.geolocation.watchPosition((coordinates) => {
      this.channel.send({
        participation_id: // participation_id,
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

  #handleData(data) {
    // if (data.action === 'update_participation') {
    //   this.playerMarkers
    //       .find(item => item.id == data.participation_id)
    //       .marker.setLngLat([data.longitude, data.latitude])

    //   return;
    // }
  }

  closeIntroduction() {
    this.riddleTarget.classList.remove('d-none')
    this.introductionTarget.classList.add('d-none')
    this.displayAnswerBtnTarget.classList.remove('d-none')
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
    console.log(tabIndex)

    this.placePanelTargets.forEach(panel => {
      panel.classList.add('d-none')
    })
    this.placePanelTargets.find( (panel) => {
      return panel.dataset.index == tabIndex
    }).classList.remove('d-none')
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
