import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['count', 'dronekills']
  static values = { count: Number }

  up() {
    var count = parseInt(this.countTarget.textContent) + 1

    this.countTarget.textContent = count
  }

  down(){
    var count = parseInt(this.countTarget.textContent) - 1

    this.countTarget.textContent = count
  }

  next(){
    this.countValue = parseInt(this.countTarget.textContent)
  }

  dronekillsTargetConnected(element) {
    element.value = this.countValue
  }
}
