import Swal from 'sweetalert2';

const UserGeolocation = (Base) => class extends Base {
  locateUser() {
    if (navigator.geolocation) {
      navigator.geolocation.watchPosition(
        (coordinates) => {
          this.channel.send({
            data_type: 'set_player_position',
            participation_id: this.participationIdValue,
            longitude: coordinates.coords.longitude,
            latitude: coordinates.coords.latitude,
          })
        },
        this.#showError,
      );
    } else {
      //Geolocation is not supported by this browser.
      Swal.fire({
        title: "Où êtes-vous?",
        text: "La localisation n'est pas supporté par ce navigateur",
        confirmButtonText: "Compris",
        customClass: {
          popup: 'swal-modal',
          confirmButton: 'btn-home'
        }
      })
    }
  }

  #showError(error) {
    switch(error.code) {
      case error.PERMISSION_DENIED:
        //User denied the request for Geolocation.
        Swal.fire({
          title: "Où êtes-vous?",
          text: "City Hunters ne peut pas savoir où vous êtes, assurez vous d'autoriser la localisation pour City Hunters dans les paramètres",
          confirmButtonText: "Compris",
          customClass: {
            popup: 'swal-modal',
            confirmButton: 'btn-home'
          }
        })
        break;
      case error.POSITION_UNAVAILABLE:
        // Localisation unavailable
        Swal.fire({
          title: "Où êtes-vous?",
          text: "La localisation est désactivée, assurez vous d'activer et d'autoriser la localisation pour City Hunters dans les paramètres",
          confirmButtonText: "Compris",
          customClass: {
            popup: 'swal-modal',
            confirmButton: 'btn-home'
          }
        })
        break;
      case error.TIMEOUT:
        // The request to get user location timed out.
        break;
      case error.UNKNOWN_ERROR:
        // An unknown error occurred.
        break;
    }
  }
}

export default UserGeolocation;
