$(document).ready(function () {
  $('#study_session_form').hide()
  $("#create").on("click", showForm)
  $("#new_study_session").submit(function(e) {
    e.preventDefault()
    debugger
    formSubmit()
  })
})

function showForm() {
  $("#study_session_form").toggle()

}

function formSubmit() {
  debugger
  let values = $(this).serialize()
  let posting = $.post('/study_sessions', values)
  posting.done(function(resp) {
    debugger
  })

}
