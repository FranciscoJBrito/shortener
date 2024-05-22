import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["items"];

  handle() {
    if (this.itemsTarget.classList.contains("invisible")) {
      this.itemsTarget.classList.remove("invisible");
    } else {
      this.itemsTarget.classList.add("invisible");
    }
  }
}
