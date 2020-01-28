class RegistrationsController < Devise::RegistrationsController
  protected

  def after_sign_up_path_for(resource)
    if cookies[:experience].present?
      experience_data = JSON.parse cookies[:experience]
      cookies.delete :experience
      @experience = Experience.new(experience_data)
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
        new_experience_payment_path(@experience)
      end
    else
      new_experience_path
    end
  end
end
