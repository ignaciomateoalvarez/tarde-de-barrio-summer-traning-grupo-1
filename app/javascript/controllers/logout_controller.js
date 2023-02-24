import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["boton","menu", "botonMenu", "botonUser"]
//eventos asociados al boton de logout
  connect(){
    console.log(this.botonTarget)
    console.log(this.menuTarget)
  }

  open() {
    this.botonTarget.style.transform = "translate(0,1px)";
    this.botonTarget.style.transitionDuration = "1s";
  } 

  close() {
   this.botonTarget.style.transform = "translate(0,-80px)";
  } 

  closeWithKeyboard(e) {
    if (e.code == "Escape") {
      this.close()
    }
  }
 
 closeBackground(e) {
  if (e && this.botonUserTarget.contains(e.target)) {
    return
    } 
      this.close() 
    }

//eventos asociados al boton menu
  openMenu(){
    this.menuTarget.style.transform = "translate(0px,0px)";
    this.menuTarget.style.transitionDuration = "1s";
  }
  
  closeMenu() {
    this.menuTarget.style.transform = "translate(-977px,0px)";
  } 
  
  closeWithKeyboardMenu(e) {
    if (e.code == "Escape") {
      this.closeMenu()
    }
  }
  
  closeBackgroundMenu(e) {
  if (e && this.botonMenuTarget.contains(e.target)) {
    return
    }
      this.closeMenu() 
    
  } 
}