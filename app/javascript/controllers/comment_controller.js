import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

    static targets = ['comments']
  connect() {
    // this.element.textContent = "Hello World!"
  }

  onClicked(){
    this.commentsTarget.classList.toggle("hidden");
  }
}



