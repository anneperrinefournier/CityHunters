import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="game"
export default class extends Controller {
  static targets = ['riddle', 'introduction'];

  connect() {
    // console.log("Hi from game controller")
  }

  closeIntroduction() {
    this.riddleTarget.classList.remove('d-none')
    this.introductionTarget.classList.add('d-none')
  }
}


/* <form action="/storylines/1/games" method="POST">
  <button class="btn btn-danger">Create game lobby</button>
</form> */
