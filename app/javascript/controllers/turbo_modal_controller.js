import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal","container"]
  connect() {
    document.getElementById("modal-background").style = "opacity: 0.3";
    document.getElementById("modal-background").style.pointerEvents = "none";
    document.body.style.backgroundColor = 'black';
  }
 
  hideModal() {
    this.element.parentElement.removeAttribute("src")
    //this.modalTarget.remove()
    this.containerTarget.remove()
    document.getElementById("modal-background").style = "opacity: 1";
    document.body.style.backgroundColor = 'white';
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