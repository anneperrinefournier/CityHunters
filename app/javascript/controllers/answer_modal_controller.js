import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="answer-modal"
export default class extends Controller {
  static targets = ["useranswer", "response", "form", "displayriddle"];
  static values = { riddleId: String }

  connect() {
    console.log(this.riddleIdValue)
    this.token = document.querySelector('meta[name="csrf-token"]').content
    console.log(this.displayriddleTarget)
  }

  openModal(event) {
    const modal = document.getElementById("myModal");
    modal.style.display = "block";
  }
  closeModal() {
    const modal = document.getElementById("myModal");
    modal.style.display = "none";
  }

  async verifyAnswer(evt) {
    evt.preventDefault();
    evt.stopPropagation();
    console.log(this.riddleIdValue);

    const options = {
      method: 'POST',
      headers: {
        "Accept": "application/json",
        "X-CSRF-TOKEN": this.token
      },
      body: new FormData(this.formTarget)
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
