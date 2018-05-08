$(document).ready(function () {
  $("#study_session_form").hide()
  $("#create").on("click", showForm)
  // Why did I have to create a document listener??
  $(document).on("submit", '#new_study_session', function(e){
    e.preventDefault()
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
    debugger
    console.log(resp)
    showForm()
    let date = new Date(resp["date"])
    $("#new_session").append("<h3>" + resp["subject"] + " | " + resp["teacher"]["name"] + " | " + resp["grade"] + "</h3>")
    $("#new_session").append("<p>" + resp["content"] + " | " + date.toDateString() + " at " + resp["time"] + "</p>")
  })
}

function showEditForm() {
  let id = $(this).children("input").attr("id")
  console.log(id)
  $.get("/study_sessions/" + id + "/edit")
}
