import { Controller } from "@hotwired/stimulus"
import Swal from 'sweetalert2';

// Connects to data-controller="answer-modal"
export default class extends Controller {
  static targets = ["useranswer", "response", "form", "displayriddle"];
  static values = {
    gameId: String,
    riddleId: String
  }

  connect() {
    this.token = document.querySelector('meta[name="csrf-token"]').content
  }

  openModal(event) {
    const modal = document.getElementById("myModal");
    modal.style.display = "block";
    document.body.classList.add("modal-open");
    this.formTarget.querySelector('#question_answer').focus();
  }
  closeModal() {
    const modal = document.getElementById("myModal");
    modal.style.display = "none";
    document.body.classList.remove("modal-open");
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

    if (data.status === "ok") {
      this.closeModal();
    } else {
      Swal.fire({
        title: data.title,
        text: data.message,
        confirmButtonText: data.button_text,
        customClass: {
          popup: 'swal-modal',
          confirmButton: 'btn-home'
        }
      })
      this.formTarget.querySelector('#question_answer').value = '';
      this.formTarget.querySelector('#question_answer').focus();
    };
  }
}
