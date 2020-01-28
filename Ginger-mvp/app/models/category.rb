class Category < ApplicationRecord

  # Associations

  # Validations
  validates :name, presence: true
end
