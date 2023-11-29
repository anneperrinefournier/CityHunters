import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="answer-modal"
export default class extends Controller {
  static targets = ["useranswer", "response", "form"];
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
    console.log(data)
    this.closeModal();
    // const replace = this.displayriddleTarget
    // replace.innerHTML = data.next_riddle


    // const userAnswer = this.useranswerTarget.value.trim();
    // const answer = this.responseTarget.innerHTML.trim();
    // console.log(userAnswer);
    // console.log(answer);

    // if ( userAnswer == answer ) {
    //   console.log("well done, the answer is correct");
    //   const congrats = document.querySelector('.useranswer')
    //   const message = "Congrats! your answer is the good one!"
    //   const remove = document.querySelector('.remove')
    //   remove.classList.add("d-none")
    //   congrats.replaceWith(message)

    // } else {
    //   console.log("try again!");
    // }
  }
}
