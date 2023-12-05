import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="answer-modal"
export default class extends Controller {
  static targets = ["useranswer", "response", "form", "displayriddle"];
  static values = {
    gameId: String,
    riddleId: String
  }

  connect() {
    console.log('Answer modal controller connected')
    this.token = document.querySelector('meta[name="csrf-token"]').content
  }

  openModal(event) {
    const modal = document.getElementById("myModal");
    modal.style.display = "block";
    this.formTarget.querySelector('input').focus(); // Ne fonctionne pas...
  }
  closeModal() {
    const modal = document.getElementById("myModal");
    modal.style.display = "none";
  }

  async verifyAnswer(evt) {
    evt.preventDefault();
    evt.stopPropagation();

    let userResponse = new FormData(this.formTarget)
    userResponse.append('action', 'new_static_answer');
    userResponse.append('game_id', this.gameIdValue)
    userResponse.append('riddle_id', this.riddleIdValue)

    const options = {
      method: 'POST',
      headers: {
        "Accept": "application/json",
        "X-CSRF-TOKEN": this.token
      },
      body: userResponse
    }

    const response =  await fetch(`/verify`, options);
    const data = await response.json()

    if (data.status === "ok") {
      this.closeModal();
    } else {
      console.log(data)
      alert(data.message);
    };
  }
}
