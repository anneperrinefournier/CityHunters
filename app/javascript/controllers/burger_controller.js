import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="burger"
export default class extends Controller {
  static values = { gameId: Number, gamePin: String };
  static targets = ["pin"];

  connect() {
    console.log("Happy meal or maxi best of?");
    console.log(this.gameIdValue);
  }

  goProfile() {

  }

  async endGame() {
    console.log(this.gameIdValue);
    const options = {
      method: 'GET',
      headers: {
        "Accept": "application/json",
        "X-CSRF-TOKEN": this.token
      },
    };

    const response = await fetch(`/games/${this.gameIdValue}/end`, options);
    console.log(response);
  }
}
