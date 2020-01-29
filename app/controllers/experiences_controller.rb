class ExperiencesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:new, :create, :edit, :update]

  def admin_index
    redirect_to root_path, warning: "You are not authorized to access this page!" unless current_user.admin?
    future_experiences = Experience.where("date >= ?", Time.zone.now).sort_by{ |experience| [experience.prepared_at ? 1 : 0, experience.paid_at ? 0 : 1, experience.date] }
    past_experiences = Experience.where("date < ?", Time.zone.now).sort_by{ |experience| experience.date }
    @experiences = future_experiences + past_experiences

    @experience_slices = ExperienceSlice.all
  end

  def index
    @experiences = Experience.where(user: current_user).sort_by{ |experience| experience.date }.reverse
  end

  def new
    @experience = Experience.new
    # authorize @experience
  end

  def create
    if current_user.nil?
      cookies[:experience] = { value: experience_params.to_json, expires: 5.minutes }
      redirect_to new_user_registration_path
    else
      @experience = Experience.new(experience_params)
      @experience.user = current_user
      if @experience.save
        session = Stripe::Checkout::Session.create(
          payment_method_types: ['card'],
          line_items: [{
            name: "My date",
            amount: @experience.budget_cents * 100,
            currency: 'chf',
            quantity: 1
          }],
          success_url: experience_url(@experience),
          cancel_url: experience_url(@experience)
        )

        @experience.update(checkout_session_id: session.id)
        redirect_to new_experience_experience_preferences_category_path(@experience)
      else
        render :new
      end
    end
    # authorize @experience
  end

  def edit

  end

  def update

  end

  def preferences_form
    @experience = Experience.find(params[:experience_preferences_category][:experience])
    @experience_preferences_category = ExperiencePreferencesCategory.new
    @categories = Category.all
    @slider = params[:slider]
    respond_to do |format|
      # format.html { redirect_to root_path }
      format.js
      #  { render "preferences_form", locals: { sliderValue: params[:slider] } }
    end
  end

  def show
    @experience = current_user.experiences.find(params[:id])
  end

  private

  def experience_params
    params.require(:experience).permit(:user, :budget_cents, :city, :date, :time_slot)
  end
end
