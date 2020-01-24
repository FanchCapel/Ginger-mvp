class ExperiencePreferencesCategoriesController < ApplicationController

  skip_before_action :authenticate_user!, only: [:new, :create]
  before_action :set_experience

  def new
    @categories = Category.all
    @experience_preferences_category = ExperiencePreferencesCategory.new
  end

  def create
    unless params[:experience_preferences_category].nil?
      params[:experience_preferences_category][:category].each do |category_id|
        next if category_id.empty?

        ExperiencePreferencesCategory.create(
          experience: @experience,
          category_id: category_id
        )
        # @experience.update(preference_level: params[:slider])
      end
    end
    redirect_to new_experience_payment_path(@experience)
  end

  private

  def experience_preference_category_params
    params.require(:experience_preference_category).permit(:experience, :category)
  end

  def set_experience
    @experience = Experience.find(params[:experience_id])
  end
end
