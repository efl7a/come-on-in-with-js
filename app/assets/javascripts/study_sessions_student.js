$(document).ready(function () {
  $('.student').on("click", function(e) {
    e.preventDefault()
    attendSession(e)
  })
})

function attendSession(e) {
  debugger
  $.ajax({
    type: "POST",
    url: `/attendees`,
    data: {
    // authenticity_token: $('meta[name=csrf-token]').attr('content'),
      study_session_id:
    },
    dataType: "json"
  })
}
