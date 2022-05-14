import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['roundCount', 'droneCount', 'dronekills', 'round', 'roundCountField', 'droneCountField']

  static values = { count: Number }

  up_round() {
    var count = parseInt(this.roundCountTarget.textContent) + 1

    this.roundCountTarget.textContent = count
    this.roundCountFieldTarget.value = count
  }

  down_round(){
    var count = parseInt(this.roundCountTarget.textContent) - 1

    this.roundCountTarget.textContent = count
    this.roundCountFieldTarget.value = count
  }

  up_drone(){
    var count = parseInt(this.droneCountTarget.textContent) + 1

    this.droneCountTarget.textContent = count
    this.droneCountFieldTarget.value = count
  }

  down_drone(){
    var count = parseInt(this.droneCountTarget.textContent) - 1

    this.droneCountTarget.textContent = count
    this.droneCountFieldTarget.value = count
  }
}
