$(document).ready(function () {
  $('#study_session_form').hide()
  $("#create").on("click", showForm)
})

function showForm() {
  $("#study_session_form").toggle()
}
