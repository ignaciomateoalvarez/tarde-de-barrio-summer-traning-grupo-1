import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["boton","menu"]
//eventos asociados al boton de logout
  open() {
    document.getElementById("boton").style.transform = "translate(0,1px)";
    document.getElementById("boton").style.transitionDuration = "1s";
  } 

  close() {
   document.getElementById("boton").style.transform = "translate(0,-80px)";
  } 

  closeWithKeyboard(e) {
    if (e.code == "Escape") {
      this.close()
    }
  }
 
 closeBackground(e) {
  if (e && document.getElementById('boton-user').contains(e.target)) {
    } else {
      this.close() 
    }
  }

//eventos asociados al boton menu
  openMenu(){
    document.getElementById("menu").style.transform = "translate(0px,0px)";
    document.getElementById("menu").style.transitionDuration = "1s";
  }
  
  closeMenu() {
    document.getElementById("menu").style.transform = "translate(-977px,0px)";
  } 
  
  closeWithKeyboardMenu(e) {
    if (e.code == "Escape") {
      this.closeMenu()
    }
  }
  
  closeBackgroundMenu(e) {
  if (e && document.getElementById('boton-menu').contains(e.target)) {
    } else {
      this.closeMenu() 
    }
  } 
}