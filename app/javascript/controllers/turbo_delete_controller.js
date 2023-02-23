import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["delete","container"]
  connect() {
  }
 
  hideModal() {
    this.element.parentElement.removeAttribute("src")
    this.containerTarget.remove()
  }

  submitEnd(e) {
    if (e.detail.success) {
      this.hideModal()
    }
  }

  closeWithKeyboard(e) {
    if (e.code == "Escape") {
      this.hideModal()
    }
  }

  closeBackground(e) {
    if (e && this.modalTarget.contains(e.target)) {
      return
    }
    this.hideModal()
  }
}