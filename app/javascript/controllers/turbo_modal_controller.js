import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["modal","container"]

 
  hideModal() {
    this.element.parentElement.removeAttribute("src")
  
    //this.modalTarget.remove()
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
    debugger;
    if (e && this.modalTarget.contains(e.target)) {
      return
    }
    this.hideModal()
  }
}