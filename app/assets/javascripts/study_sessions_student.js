$(document).ready(function () {
  $('.student').on("submit", function(e) {
    e.preventDefault()
    let form = $(e.currentTarget)
    let id = form.parent().parent().data('id')
    if(form.children("input").attr("value") === "Attend"){
      attendSession(form, id)
    } else {
      changeAttendance(form, id)
    }
  })
})

function attendSession(form, id) {
  $.ajax({
    type: "POST",
    url: `/attendees/${id}`,

    dataType: "json"
  }).done(function(resp) {
    $(this).children("input").attr("value", "Attending - Change Attendance")
  })
}

function changeAttendance(form, id){
  $.ajax({
    type: "DELETE",
    url: `/attendees`,
    data: {
      study_session_id: id
    },
    dataType: "json"
  }).done(function(resp) {
    $(this).children("input").attr("value", "Attend")
  })
}
