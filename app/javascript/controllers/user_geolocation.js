import Swal from 'sweetalert2';

const UserGeolocation = (Base) => class extends Base {
  locateUser() {
    console.log("hi!");

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
      console.log("Geolocation is not supported by this browser.");
    }
  }

  #showError(error) {
    switch(error.code) {
      case error.PERMISSION_DENIED:
        console.log("User denied the request for Geolocation.");
        Swal.fire({
          title: "Où êtes-vous?",
          text: "La localisation est désactivée, assurez vous d'activer la localisation pour city hunters dans les paramètres",
          confirmButtonText: "Compris",
          customClass: {
            popup: 'swal-modal',
            confirmButton: 'btn-home'
          }
        })
        break;
      case error.POSITION_UNAVAILABLE:
        console.log("Location information is unavailable.");
        break;
      case error.TIMEOUT:
        console.log("The request to get user location timed out.");
        break;
      case error.UNKNOWN_ERROR:
        console.log("An unknown error occurred.");
        break;
    }
  }
}

export default UserGeolocation;
