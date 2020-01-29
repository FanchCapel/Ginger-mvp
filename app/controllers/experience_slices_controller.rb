class ExperienceSlicesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create]
  before_action :set_experience

  def new
    redirect_to root_path, warning: "You are not authorized to access this page!" unless current_user.admin?
    @activities = Activity.all
    @categories = Category.all
    @cities = ["Lausanne", "Geneva", "Fribourg", "Sion", "Neuchatel"]
    @experience_slice = ExperienceSlice.new
  end

  def create
    i = 0
    params.select { |key| key =~ /activity-\d-id/ }.each do |_key, activity_id|
      i += 1
      ExperienceSlice.create(
        activity_id: activity_id.to_i,
        experience: @experience,
        order: i
      )
    end
    @experience.update(prepared_at: Time.now)
    @experience.generate_messages
    redirect_to admin_index_path
  end

  def edit
  end

  def update
  end

  def show
  end

  private

  def experience_slice_params
    params.require(:experience_slice).permit(:activity, :experience, :order)
  end

  def set_experience
    @experience = Experience.find(params[:experience_id])
  end
end
