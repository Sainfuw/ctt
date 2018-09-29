App.courses = App.cable.subscriptions.create("CoursesChannel", {
  connected: function() {},
  disconnected: function() {},
  received: function(data) {
    var active_course = $("[data-behavior='messages'][data-course-id='" + data.course_id + "']");
    if (active_course.length > 0) {
      active_course.append(data.message);
    } else {
      $("[data-behavior='course-link'][data-course-id='" + data.course_id + "']").css("font-weight", "bold");
    }
  },
  send_message: function(course_id, message) {
    this.perform("send_message", {
      course_id: course_id,
      body: message
    });
  }
});