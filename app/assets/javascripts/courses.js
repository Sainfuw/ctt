$(document).on("turbolinks:load", function() {
  $("#new_message").on("keypress", function(e) {
    if (e && (e.keyCode === 13)) {
      e.preventDefault();
      $(this).submit();
    }
  });
  $("#new_message").on("submit", function(e) {
    var body, course_id;
    e.preventDefault();
    course_id = $("[data-behavior='messages'").data("course-id");
    body = $("#message_body");
    App.courses.send_message(course_id, body.val());
    body.val("");
  });
  setInterval(function () {
  }, 30000);
});