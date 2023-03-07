import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["list", 'image']

  connect() { 
    this.listTarget.onchange = this.addFile
    this.imageTarget.addEventListener('click', () => {
      this.openFileDialog()
    })
  }

  openFileDialog() {
    const inputField = this.listTarget.previousElementSibling
    inputField.click()
  }
  
  addFile(event) {
    const files = event.target.files
    for (let i = 0; i < files.length; i++) {
      const file = files[i]
      const listItem = document.createElement('li')
      listItem.innerHTML = `<span>${file.name}</span>`
      this.listTarget.appendChild(listItem)
    }
  }
}
