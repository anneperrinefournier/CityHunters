import { Controller } from "@hotwired/stimulus";
import mapboxgl from 'mapbox-gl';

// Connects to data-controller="show-storyline"
// const Map = (Base) => class extends Base {

// const Map = () => class extends Controller {
export default class Map extends Controller {
  _initMap() {
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.mapTarget,
      style: "mapbox://styles/anneperrine/clpqvu9za014201pke2o7alpm"
    })

    this.playerMarkers = [];
    this.placeMarkers = [];
  }

  test() {
    console.log('test ok')
  }

  addAllPlayerMarkersToMap(markers) {
    console.log(markers)
    markers.forEach((marker) => this.addPlayerMarkerToMap(marker))
  }

  addPlayerMarkerToMap(marker) {
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
  }

  addAllPlacesMarkersToMap(markers) {
    markers.forEach((marker) => this.addPlaceMarkerToMap(marker))
  }

  addPlaceMarkerToMap(marker) {
    const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)

    const customMarker = document.createElement('div');
    customMarker.className = `marker ${marker.marker_class}`;
    customMarker.innerHTML = marker.marker_html

    this.placeMarkers.push({
      marker: new mapboxgl.Marker(customMarker)
                  .setLngLat([ marker.lng, marker.lat ])
                  .setPopup(popup)
                  .addTo(this.map)
    })
  }

  fitMapToMarkers() {
    let markers = this.placeMarkers

    if (this.playerMarkers != 'undefined')
      markers = markers.concat(this.playerMarkers);

    const bounds = new mapboxgl.LngLatBounds()
    markers.forEach( (marker) => bounds.extend([ marker.marker._lngLat.lng, marker.marker._lngLat.lat ]) );
    this.map.fitBounds(bounds, { padding: 80, maxZoom: 15, duration: 0 })
  }
}
