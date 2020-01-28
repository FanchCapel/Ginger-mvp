class StripeCheckoutSessionService
  def call(event)
    experience = Experience.find_by(checkout_session_id: event.data.object.id)
    experience.update(paid_at: Time.now)
  end
end
