class MessageType < ApplicationRecord
  # Associations
  has_many :messages

  # Validations
  validates :message_type, presence: true
  validates :content, presence: true

end
