import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="profile"
export default class extends Controller {
  static targets = ['checkIsReady']

  connect() {
  }

  toggleReady(event) {
    event.preventDefault();

    const url = event.currentTarget.href

    fetch(url, {
      method: 'PATCH',
      headers: {
        "X-CSRF-Token": document.querySelector("meta[name=csrf-token]").content,
        accept: "application/json"
      }
    })
    .then(response => response.json())
    .then(data => {

      if (data.isReady == true) {
        event.target.classList.remove('storyline-check-not-ready')
        event.target.classList.add('storyline-check-ready')
      } else {
        event.target.classList.remove('storyline-check-ready')
        event.target.classList.add('storyline-check-not-ready')
      }
    })
  }
}
