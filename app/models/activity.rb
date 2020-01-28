class Activity < ApplicationRecord

  monetize :price_cents

  # Associations
  belongs_to :category

  # Validations
  validates :name, presence: true
  validates :duration, presence: true
  validates :city, presence: true
  validates :meeting_point, presence: true
  validates :price, presence: true
end
