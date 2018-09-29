class CoursesChannel < ApplicationCable::Channel
  def subscribed
    current_user.courses.each do |course|
      stream_from "courses:#{course.id}"
    end
  end

  def unsubscribed
    stop_all_streams
  end

  def send_message(data)
    @course = Course.find(data["course_id"])
    message   = @course.messages.create(body: data["body"], user: current_user)
    MessageRelayJob.perform_later(message)
  end
end
