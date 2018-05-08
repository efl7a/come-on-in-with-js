$(document).ready(function () {
  $("#study_session_form").hide()
  $("#create").on("click", showForm)
  // Why did I have to create a document listener??
  $(document).on("submit", '#new_study_session', function(e){
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
  let values = $("#new_study_session").serialize()
  $.post('/study_sessions', values).done(function(resp) {
    console.log(resp)
    $("new_session").innerHTML(resp)
  })
}

function showEditForm() {
  let id = $(this).children("input").attr("id")
  console.log(id)
  $.get("/study_sessions/" + id + "/edit")
}
