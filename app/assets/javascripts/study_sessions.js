$(document).ready(function () {
  $("#study_session_form").hide()
  $("#create").on("click", showForm)
  // Why did I have to create a document listener??
  $(document).on("submit", '#new_study_session', function(e){
    e.preventDefault()
    submitForm()
  })
  $('.button_to').on("click", function(e) {
    e.preventDefault()
    showEditForm(e)
  })
})

function showForm() {
  $("#study_session_form").toggle()
}

function submitForm() {
  let values = $("#new_study_session").serialize()
  $.post('/study_sessions', values).done(function(resp) {
    console.log(resp)
    showForm()
    let date = new Date(resp["date"])
    $("#new_session").append("<h3>" + resp["subject"] + " | " + resp["teacher"]["name"] + " | " + resp["grade"] + "</h3>")
    $("#new_session").append(`<p><a href=/study_sessions/${resp["id"]}>` + resp["content"] + "</a> | " + date.toDateString() + " at " + resp["time"] + "</p>")
  })
}

function showEditForm(e) {
  let id = $(e.currentTarget).children("input").attr("id")
  $.get("/study_sessions/" + id + "/edit").done(function(resp) {
    let date = new Date(resp["date"])
    $("#edit_form_div").append(`<div type="hidden" name="study_session['id']" value="${id}"></div>`)
    $("#edit_form_div").append(`<div class='row'><input type="text_field" name="subject" value="${resp["subject"]}"></input></div>`)
    $("#edit_form_div").append(`<div class='row'><input type="text_field" name="grade" value="${resp["grade"]}"></input></div>`)
    $("#edit_form_div").append(`<div class='row'><input type="date_field" name="date" value="${date.toDateString()}"></input></div>`)
    $("#edit_form_div").append(`<div class='row'><input type="text_field" name="time" value="${resp['time']}"></input></div>`)
    $("#edit_form_div").append(`<input type="submit" name="commit" value="Edit Study Session" class="btn btn-xs" >`)
    $("#edit_form_div").on("submit", function(e) {
      e.preventDefault()
      submitEdit(e)
    })
  })
}

function submitEdit(e) {
  let id = $(e.currentTarget).children("div").attr("value")
  let values = $("#edit_form_div").serialize()
  $.post(`/study_sessions/${id}`, {_method: "PATCH",  study_session: values}).done(function(resp) {
    console.log(resp)
    showForm()
    let date = new Date(resp["date"])
    $("#new_session").append("<h3>" + resp["subject"] + " | " + resp["teacher"]["name"] + " | " + resp["grade"] + "</h3>")
    $("#new_session").append(`<p><a href=/study_sessions/${resp["id"]}>` + resp["content"] + "</a> | " + date.toDateString() + " at " + resp["time"] + "</p>")
  })
}
