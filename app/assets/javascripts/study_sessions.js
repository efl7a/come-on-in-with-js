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
    let id = $(e.currentTarget).children("input").attr("id")
    if(id){
      showEditForm(id)
    } else {
      deleteSession(e)
    }

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

function showEditForm(id) {
  $("#edit_form_div").empty()
  // let id = $(e.currentTarget).children("input").attr("id")
  $.get("/study_sessions/" + id + "/edit").done(function(resp) {
    let date = new Date(resp["date"])
    $("#edit_form_div").append(`<div type="hidden" name="study_session['id']" value="${id}"></div>`)
    // $("#edit_form_div").append(`<input type="hidden" name="authenticity_token" value=${$('meta[name=csrf-token]').attr('content')}></input>`)
    $("#edit_form_div").append(`<div class='row'><input type="text" name="subject" value="${resp["subject"]}"></input></div>`)
    $("#edit_form_div").append(`<div class='row'><input type="text" name="grade" value="${resp["grade"]}"></input></div>`)
    $("#edit_form_div").append(`<div class='row'><input type="date" name="date" value="${resp["date"]}"></input></div>`)
    $("#edit_form_div").append(`<div class='row'><input type="text" name="time" value="${resp['time']}"></input></div>`)
    $("#edit_form_div").append(`<input type="submit" name="commit" value="Edit Study Session" class="btn btn-xs" >`)
    $("form").on("submit", function(e) {
      e.preventDefault()
      submitEdit(e)
    })
  })
}

function submitEdit(e) {
  let id = $(e.currentTarget).children("div").attr("value")
  let values = $(e.currentTarget).serialize()
  // $.post(`/study_sessions/${id}`, {_method: "PATCH", data: {authenticity_token: $('meta[name=csrf-token]').attr('content'), study_session: values}}).
  $.ajax({
    type: "PATCH",
    url: `/study_sessions/${id}`,
    data: {
    // authenticity_token: $('meta[name=csrf-token]').attr('content'),
      study_session: {
        subject: $("input[name=subject]").val(),
        grade: $("input[name=grade]").val(),
        date: $("input[name=date]").val(),
        time: $("input[name=time]").val()
      }
    },
    dataType: "json"
  }).done(function(resp) {
    $("div").filter(function() {
      return $(this).attr("data-id") == parseInt(id)
    }).remove()
    $("#edit_form_div").empty()
    let date = new Date(resp["date"])
    $("#new_session").append("<h3>" + resp["subject"] + " | " + resp["teacher"]["name"] + " | " + resp["grade"] + "</h3>")
    $("#new_session").append(`<p><a href=/study_sessions/${resp["id"]}>` + resp["content"] + "</a> | " + date.toDateString() + " at " + resp["time"] + "</p>")
  })
}

function deleteSession(e) {
  let id = $(e.currentTarget).children("input").eq(1).attr("data-id")
  $.ajax({
    type: "DELETE",
    url: `/study_sessions/${id}`,
  }).done
  $("div").filter(function() {
    return $(this).attr("data-id") == parseInt(id)
  }).remove()
}
