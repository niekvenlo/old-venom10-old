/* global $ */

function alert (msg, type) {
  if (!type) { type = 'info' }
  var div = document.createElement("div")
  div.innerHTML = "<div class=\"alert alert-" + type + " alert-dismissible fade show\" role=\"alert\"><button type=\"button\" class=\"close\" data-dismiss=\"alert\" aria-label=\"Close\"><span aria-hidden=\"true\">&times;</span></button>" + msg + "</div>"
  document.getElementById("alerts").appendChild(div)
}