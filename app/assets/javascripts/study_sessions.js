$(document).ready(function () {
  $("#create").on("click", function(e) {
    e.preventDefault()
    showForm()
  })

  $('.teacher').on("click", function(e) {
    e.preventDefault()
    let id = $(e.currentTarget).children("input").attr("id")
    if(id){
      showEditForm(e, id)
    } else {
      let id = $(e.currentTarget).children("input").eq(1).attr("data-id")
      deleteSession(id)
    }
  })

  $('.show-attendees').on("click", function(e) {
    e.preventDefault()
    let id = $(e.currentTarget).children("input").attr("data-id")
    showAttendees(e, id)
  })
})

function showForm() {
  $.get("/study_sessions/new").done(function(resp) {
     $("#study_session_form").append(resp)
     $("#study_session_form").append('<button id="remove_study_session_form" class="btn btn-danger btn-xs">Cancel</button>')
     $("#remove_study_session_form").on("click", function(e){
       e.preventDefault()
       $("#study_session_form").empty()
     })
     $("#new_study_session").on("submit", function(e) {
       e.preventDefault()
       submitForm()
     })
  })
}

function submitForm() {
  let values = $("#new_study_session").serialize()
  $.post('/study_sessions', values).done(function(resp) {
    $("#study_session_form").empty()
    let date = new Date(`${resp["date"]} EST`)
    $("#new_session").append(`<div class='row' data-id='${resp["id"]}'></div>`)
    let row = $("#new_session").children(".row").filter(function(row) {
      return $(this).data("id") === resp["id"]
    })

    row.append("<div class='col'></div>")
    row.children(".col").append(`<h3> ${resp["subject"]} | ${resp["teacher"]["name"]} | ${resp["grade"]}</h3>`)
    row.children(".col").append(`<p>${resp["content"]} | ${date.toDateString()} at ${resp["time"]} </p>`)
    row.append("<div class='col'></div>")
    row.children(".col").eq(1).append(`<p><button id="${resp['id']}" class="teacher-js-edit btn btn-xs">Edit Study Session</button></p>`)
    row.children(".col").eq(1).append(`<p><button data-id="${resp['id']}" class="teacher-js-destroy btn btn-danger btn-xs">Delete Study Session</button></p>`)

    $("button.teacher-js-edit").on("click", function(e) {
      e.preventDefault()
      let id = $(e.currentTarget).attr("id")
        showEditForm(e, id)
    })

    $("button.teacher-js-destroy").on("click", function(e) {
      e.preventDefault()
      let id = $(e.currentTarget).data("id")
      deleteSession(id)
    })
  })
}

function showEditForm(e, id) {
  $.get("/study_sessions/" + id + "/edit").done(function(resp) {

    $(e.currentTarget).parent().parent().append(resp)

    $(`#${id}`).parent().hide()

    $(`#edit_study_session_${id}`).attr("action", "")
    $(`#edit_study_session_${id}`).attr("data-id", id)
    $(`#edit_study_session_${id}`).on("submit", function(e) {
      e.preventDefault()
      submitEdit(e)
    })

    $(`#edit_study_session_${id}`).parent().append("<div class='row'><button id='clear' class='btn btn-xs'>No Changes</button></div>")
    $("#clear").on("click", function() {
      $(`#edit_study_session_${id}`).remove()
      $("#clear").remove()
      $(`#${id}`).parent().show()
    })
  })
}

function submitEdit(e) {
  let id = $(e.currentTarget).attr("data-id")
  let values = $(e.currentTarget).serialize()
  // $.post(`/study_sessions/${id}`, {_method: "PATCH", data: {authenticity_token: $('meta[name=csrf-token]').attr('content'), study_session: values}}).
  $.ajax({
    type: "PATCH",
    url: `/study_sessions/${id}`,
    data: values,
    dataType: "json"
  }).done(function(resp) {

    $(`#edit_study_session_${id}`).remove()
    $("#clear").remove()
    $(`#${id}`).parent().show()

    let r = $("div").filter(function() {
      return $(this).attr("data-id") == parseInt(resp["id"])
    })
    let date = new Date(`${resp["date"]} EST`)
    r.children("div").eq(0).empty()
    r.children("div").eq(0).append("<h3>" + resp["subject"] + " | " + resp["teacher"]["name"] + " | " + resp["grade"] + `</h3>
    <p><a href=/study_sessions/${resp["id"]}>` + resp["content"] + "</a> | " + date.toDateString() + " at " + resp["time"] + "</p>")

  })
}

function deleteSession(id) {
  $.ajax({
    type: "DELETE",
    url: `/study_sessions/${id}`,
  }).done
  $("div").filter(function() {
    return $(this).attr("data-id") == parseInt(id)
  }).remove()
}

function showAttendees(e, id) {
  let show = $.get(`/study_sessions/${id}`)
  show.done(function(resp) {
    let students = resp["students"]
    let row = $("div.row").filter(function(){
      return $(this).data("id") == id
    })
    if(students.length === 0){
      row.find(".attendees").append(`<p>No students registered</p>`)
    } else {
      row.find(".attendees").append(`<ul class='${id}'></ul>`)
      let list = $(`ul.${id}`)
      students.forEach(function(student){
        list.append(`<li>${student["name"]}</li>`)
      })
    }
    $(e.currentTarget).hide()
    // Currently this is not working, so I am commenting it out.
    // $(e.currentTarget).attr("class", "hide-attendees")
    // $(e.currentTarget).children("input").attr("value", "Hide Attendees")
    // $(".hide-attendees").on("click", function(e) {
    //   e.preventDefault()
    //   this.find(".attendees").empty()
    //   debugger
    //   $(e.currentTarget).attr("class", "show-attendees")
    //   $(e.currentTarget).children("input").attr("value", "Show Attendees")
    // }.bind(row))
}.bind(e))

}
