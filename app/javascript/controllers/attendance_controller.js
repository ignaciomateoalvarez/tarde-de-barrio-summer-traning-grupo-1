import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "table" ]
  static values = {
    url: String,
    studentId: Number
  }

  toggle() {
    this.tableTarget.classList.toggle('hidden');
  }

  submit() {
    const csrfToken = document.querySelector("[name='csrf-token']").content
    return fetch(this.urlValue, {
      method: "POST",
      headers: {
        "X-CSRF-Token": csrfToken,
        "Content-Type": "application/json"
      },
      body: JSON.stringify({ student_id: this.studentIdValue })
    }) 
  }
}