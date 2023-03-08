import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "table" ]

  toggle() {
    this.tableTarget.classList.toggle('hidden');
  }
}