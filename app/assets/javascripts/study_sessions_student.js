$(document).ready(function () {
  $('.student').on("submit", function(e) {
    e.preventDefault()
    // May need to distinguish here if the button is "attend" or "attending"
    attendSession(e)
  })
})

function attendSession(e) {
  let id = $(e.currentTarget).parent().parent().data('id')
  $.ajax({
    type: "POST",
    url: `/attendees`,
    data: {
      study_session_id: id
    },
    dataType: "json"
  }).done(function(resp) {
    // Need to switch attendance button
    debugger

  })
}
