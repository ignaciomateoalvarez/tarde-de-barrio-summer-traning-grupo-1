import { Controller } from "@hotwired/stimulus"
import { createPopup } from "@picmo/popup-picker";

// Connects to data-controller="emoji-picker"
export default class extends Controller {
  static targets = ['body', 'pickerContainer', 'button']

  connect() {
    
    this.picker = createPopup({
      rootElement: this.pickerContainerTarget, //modal
      hideOnEmojiSelect: false,
      hideOnClickOutside: false,
    },{
      triggerElement: this.buttonTarget, //boton carita
      referenceElement: this.buttonTarget, //boton carita
      position: 'bottom-start', 
    });
    
    this.picker.addEventListener('emoji:select', (event) => { 
      this.bodyTarget.value += event.emoji;
    });
  }

  open() {
    this.picker.toggle();
  }
}