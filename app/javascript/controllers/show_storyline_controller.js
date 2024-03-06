import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl';

// Connects to data-controller="show-storyline"
export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array,
  }

  static targets = [
    'map',
  ]

  connect() {
    this._initMap();
  }

  _initMap() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.mapTarget,
      style: "mapbox://styles/anneperrine/clpqvu9za014201pke2o7alpm"
    })

    this.#addAllMarkersToMap()
    this.#fitMapToMarkers()
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
    this.markersValue.forEach( (marker) => bounds.extend([ marker.lng, marker.lat ]) );
    this.map.fitBounds(bounds, { padding: 80, maxZoom: 15, duration: 0 })
  }
}
