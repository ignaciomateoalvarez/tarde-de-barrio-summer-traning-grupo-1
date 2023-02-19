import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal","container"]
  connect() {
    document.getElementById("modal-background").style = "opacity: 0.25";
    document.getElementById("modal-background").style.pointerEvents = "none";

  }
 
  hideModal() {
    this.element.parentElement.removeAttribute("src")
  
    //this.modalTarget.remove()
    this.containerTarget.remove()
    document.getElementById("modal-background").style = "opacity: 1";
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
    debugger;
    if (e && this.modalTarget.contains(e.target)) {
      return
    }
    this.hideModal()
  }
}