import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "menu" ]

  toggles() {
    
      console.log("button clicked")
      this.menuTarget.classList.toggle("hidden")
  };

}