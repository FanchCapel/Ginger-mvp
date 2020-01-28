class MessagesController < ApplicationController

  # def create
  #   MessageJob.set.perform_later(message_id)
  # end
# (wait_until: Date.tomorrow.noon)
  private

  def message_params
    params.require(:message).permit(:user_id, :content, :send_at, :message_type_id, :experience_id)
  end

end
