class Message < ApplicationRecord

  # Associations
  belongs_to :message_type
  belongs_to :experience

  # Validations
  validates :message_type, presence: true
  validates :experience, presence: true

  after_create :plan_message

  private

  # SENDING MESSAGES FOR PRODUCTION
  # def plan_message
  #   send_date = (self.experience.date + self.message_type.day).beginning_of_day
  #   send_date = send_date + self.message_type.send_at.hour.hours
  #   message = self
  #   p eval message_type.content
  #   MessageJob.set(wait_until: send_date).perform_later(self.id)
  # end

  # SENDING MESSAGES FOR DEMO
  def plan_message
    send_date = message_type.day * 20
    MessageJob.set(wait: send_date.seconds).perform_later(self.id)
  end
end
