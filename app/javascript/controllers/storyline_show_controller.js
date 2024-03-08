import { Controller } from "@hotwired/stimulus";
import Map from './map_controller.js'

export default class extends Map {
  static values = {
    apiKey: String,
    markers: Array,
  };

  static targets = [
    'map'
  ];

  connect() {
    this.test()

    this._initMap()

    this.addAllPlacesMarkersToMap(this.markersValue)
    this.fitMapToMarkers(this.markersValue)
  }
}
