import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="answer-modal"
export default class extends Controller {
  connect() {
    console.log("lol from the answer modal")
  }

  openModal(event) {
    const modal = document.getElementById("myModal");
    console.log(modal);
    modal.style.display = "block";
  }
  closeModal() {
    const modal = document.getElementById("myModal");
    modal.style.display = "none";
  }
}
