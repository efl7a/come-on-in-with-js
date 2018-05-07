$(document).ready(function () {
  $("#study_session_form").hide()
  $("#create").on("click", showForm)
  // Why did I have to create a document listener??
  $(document).on("submit", '#new_study_sessions', function(e){
    e.preventDefault()
    alert("submitting form")
    submitForm()
  })
  $('.button_to').on("click", showEditForm)
})

function showForm() {
  $("#study_session_form").toggle()
}

function submitForm() {
  let values = $(this).serialize()
  debugger
  let posting = $.post('/study_sessions', values)
  posting.done(function(resp) {
    debugger
  })
}

function showEditForm() {
  let id = $(this).children("input").attr("id")
  console.log(id)
  $.get("/study_sessions/" + id + "/edit")
}
