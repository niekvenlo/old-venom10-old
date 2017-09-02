/* global $ */

let alert = function(msg, type='info') {
  let div = document.createElement("div")
  div.innerHTML = `
  <div class="alert alert-${type} alert-dismissible fade show" role="alert">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
      <span aria-hidden="true">&times;</span>
    </button>
    ${msg}
  </div>`
  document.getElementById("alerts").appendChild(div)
}