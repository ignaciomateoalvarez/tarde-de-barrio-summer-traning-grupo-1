import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "checkbox","display"]

  connect() {
    console.log(this.element);
  }

  changeActive(){
    this.element.parentElement.submit();
  }
}
