class CoursesChannel < ApplicationCable::Channel
  def subscribed
    current_user.courses.each do |course|
      stream_from "courses:#{course.id}"
      user = Online.find_by(username: current_user.username)
      if user.nil?
        Online.create(username: current_user.username)
      end
    end
  end

  def unsubscribed
    stop_all_streams
    user = Online.find_by(username: current_user.username)
    user.destroy
  end

  def send_message(data)
    @course = Course.find(data["course_id"])
    message   = @course.messages.create(body: data["body"], user: current_user)
    MessageRelayJob.perform_later(message)
  end
end
