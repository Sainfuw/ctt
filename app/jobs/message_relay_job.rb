class MessageRelayJob < ApplicationJob
  queue_as :default

  def perform(message)
    ActionCable.server.broadcast "courses:#{message.course.id}", {
      message: MessagesController.render(message),
      course_id: message.course.id
    }
  end
end
