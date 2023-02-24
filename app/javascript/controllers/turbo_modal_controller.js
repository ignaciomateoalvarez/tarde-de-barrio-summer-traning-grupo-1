import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal","container"]
  connect() {
    document.getElementById("modal-background").style.pointerEvents = "none";
  }
 
  hideModal() {
    this.element.parentElement.removeAttribute("src")
    document.getElementById("modal-background").style.pointerEvents = "auto";
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