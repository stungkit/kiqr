import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["menu"];

  toggle(event) {
    event.preventDefault();

    this.menuTargets.forEach((menu) => {
      if (menu.classList.contains("hidden")) {
        menu.classList.remove("hidden");
      } else {
        menu.classList.add("hidden");
      }
    });
  }
}
