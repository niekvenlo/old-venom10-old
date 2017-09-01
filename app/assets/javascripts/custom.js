let alert = function(msg) {
    let div = document.createElement("div")
    div.innerHTML = `
    <div class="alert alert-info alert-dismissible fade show" role="alert">
      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
      </button>
      ${msg}
    </div>`
    document.getElementById("alerts").appendChild(div)
}