class PaymentsController < ApplicationController
  def new
    @experience = current_user.experiences.where(paid_at: nil).find(params[:experience_id])
  end
end
