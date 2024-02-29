import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="burger"
export default class extends Controller {
  static values = {
    gameId: Number,
    gamePin: String
  };

  connect() {
  }

  goProfile() {
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

  refresh() {
    location.reload();
  }
}
