import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { id: Number }
  static targets = ['riddle', 'introduction', 'enigme', 'placeTabs', 'placeTab', 'placePanel', 'displayAnswerBtn', 'map', 'endGameButton', 'endGame'];

  connect() {
    this.token = document.querySelector('meta[name="csrf-token"]').content
    this.channel = createConsumer().subscriptions.create(
      { channel: "GameChannel", id: this.idValue },
      { received: data => console.log(data) }
    )
  }

  closeIntroduction() {
    this.riddleTarget.classList.remove('d-none')
    this.introductionTarget.classList.add('d-none')
    this.mapTarget.classList.remove('d-none')
    this.endGameButtonTarget.classList.remove("d-none")
    if (this.displayAnswerBtnTarget) {
      this.displayAnswerBtnTarget.classList.remove('d-none')
    }
  }

  activate(event) {
    event.preventDefault()
    console.log(this.placeTabTargets)
    this.placeTabTargets.forEach(tab => {
      tab.classList.remove('active')
    });
    event.currentTarget.classList.add('active');
  }

  switchPanel(event) {
    const tabIndex = event.target.dataset.index
    console.log(tabIndex)

    this.placePanelTargets.forEach(panel => {
      panel.classList.add('d-none')
    })
    this.placePanelTargets.find( (panel) => {
      return panel.dataset.index == tabIndex
    }).classList.remove('d-none')
  }

async endGame() {
  const options = {
    method: 'POST',
    headers: {
      "Accept": "application/json",
      "X-CSRF-TOKEN": this.token
    },
    body: JSON.stringify({})
  };

  try {
    const response = await fetch(`/games/${this.idValue}/end`, options);

    if (!response.ok) {
      throw new Error(`HTTP error! Status: ${response.status}`);
    }

    const contentType = response.headers.get('content-type');
    if (contentType && contentType.includes('application/json')) {
      const data = await response.json();

      if (data.status === 'ok') {
        console.log('End game status ok');
        this.channel.perform('end_game', { game_id: this.idValue });
      } else {
        console.log(data);
        alert(data.message || 'Une erreur s\'est produite.');
      }
    } else {
      console.error('La réponse n\'est pas au format JSON.');
      console.log(await response.text()); // Afficher le contenu de la réponse
      alert('Une erreur s\'est produite. Veuillez réessayer.');
    }
  } catch (error) {
    console.error('Une erreur s\'est produite lors de la requête POST :', error);
  }

  this.introductionTarget.classList.add('d-none')
  this.displayAnswerBtnTarget.classList.add('d-none')
  this.endGameButtonTarget.classList.add("d-none")
  this.endGameTarget.classList.remove('d-none')
  this.riddleTarget.classList.add('d-none')
  this.mapTarget.classList.add('d-none')
  if (this.displayAnswerBtnTarget) {
    this.displayAnswerBtnTarget.classList.add('d-none')
  }
  }
}
