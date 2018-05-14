$(document).ready(function () {
  $('.student').on("submit", function(e) {
    e.preventDefault()
    let form = $(e.currentTarget)
    let id = form.parent().parent().data('id')
    if(form.children("input").attr("value") === "Attend"){
      attendSession(form, id)
    } else {
      let attendeeId = form.children("input").attr("data-attendee-id")
      changeAttendance(form, attendeeId)
    }
  })
})

function attendSession(form, id) {
  let posting = $.ajax({
    type: "POST",
    url: `/attendees`,
    data: {
      study_session_id: id
    },
    dataType: "json"
  })
  posting.done(function(resp) {
    $(this).children("input").attr({
      "value": "Attending - Change Attendance",
      "data-attendee-id": resp["id"]
    })
  }.bind(form))
}

function changeAttendance(form, attendeeId){
  let deleting = $.ajax({
    type: "DELETE",
    url: `/attendees/${attendeeId}`,
    dataType: "json"
  })
  deleting.done(function(resp) {
    $(this).children("input").attr({"value": "Attend", "data-attendee-id": ""})
  }.bind(form))
}
