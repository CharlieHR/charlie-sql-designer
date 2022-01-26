// Visit The Stimulus Handbook for more details
// https://stimulusjs.org/handbook/introduction
//
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["query"]

  connect() {
    setTimeout(() => {
      document.getElementById("schemaload").click();
    }, 300);
  }

  save() {
    document.getElementById("window").classList.add("d-none");
    setTimeout(() => {

      document.getElementById("clientsave").click()
      var xml = document.getElementById("textarea").value
      document.getElementById("windowok").click()
      fetch(`/schemas/${this.queryTarget.dataset.schemaId}`, {
        method: "PATCH",
        headers: { "Content-Type": "application/json", "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content },
        body: JSON.stringify({ content: xml })
      })
    }, 300);
  }


}
