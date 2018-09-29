class MessagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course

  def create
    message = @course.messages.new(message_params)
    message.user = current_user
    message.save
    MessageRelayJob.perform_later(message)
  end

  private
    def set_course
      @course = course.find(params[:course_id])
    end

    def message_params
      params.require(:message).permit(:body)
    end
end