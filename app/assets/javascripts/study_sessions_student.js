$(document).ready(function () {
  $('.student').on("submit", function(e) {
    e.preventDefault()
    alert("I got the button")
    attendSession(e)
  })
})

function attendSession(e) {
  let id = $(e.currentTarget).parent().parent().data('id')
  debugger
  $.ajax({
    type: "POST",
    url: `/attendees`,
    data: {
      study_session_id: id
    },
    dataType: "json"
  }).done(function(resp) {
    // Need to switch attendance button
  })
}
