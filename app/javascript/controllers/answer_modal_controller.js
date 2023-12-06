import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="answer-modal"
export default class extends Controller {
  static targets = ["useranswer", "response", "form", "displayriddle", "closeModal"];
  static values = {
    gameId: String,
    riddleId: String
  }

  connect() {
    this.token = document.querySelector('meta[name="csrf-token"]').content
  }

  // openModal() {
  //   this.element.style.display = "block";
  //   this.formTarget.querySelector('input').focus();

  openModal(event) {
    const modal = document.getElementById("myModal");
    modal.style.display = "block";
    this.formTarget.querySelector('#question_answer').focus();
  }

  closeModal() {
    this.element.style.display = "none";
  }

  async verifyAnswer(event) {
    event.preventDefault();
    event.stopPropagation();

    let userResponse = new FormData(this.formTarget)
    userResponse.append('answer_type', 'new_static_answer');
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

    const response = await fetch(`/verify`, options);
    const data = await response.json()

<<<<<<< HEAD
      if (data.status === "ok") {
        this.closeModalTarget.click();
        this.closeModal();
      } else {
        console.log(data)
        alert(data.message);
      };
=======
    if (data.status === "ok") {
      this.closeModal();
    } else {
      alert(data.message);
    };
>>>>>>> d9c3c957a5dc7c19365dc009fe79224f1fb44ae4
  }
}
