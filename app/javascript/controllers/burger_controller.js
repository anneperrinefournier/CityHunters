import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="burger"
export default class extends Controller {
  connect() {
    console.log("Happy meal or maxi best of?")
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
