class ActivitiesController < ApplicationController
  def show
    @activity = Activity.find(params[:id])

    render json: @activity.to_json
  end

  def calculate_experience
    amount = params[:activity_ids].inject(0) do |sum, activity_id|
      sum + Activity.find(activity_id).price_cents / 100
    end
    duration = params[:activity_ids].inject(0) do |sum, activity_id|
      sum + Activity.find(activity_id).duration
    end
    render json: { amount: amount, duration: duration }.to_json
  end
end
