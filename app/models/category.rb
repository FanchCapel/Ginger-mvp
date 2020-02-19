class Category < ApplicationRecord

  # Associations

  # Validations
  validates :name, inclusion:{in:["restaurant", "expérience", "les deux (expérience + restaurant)"]}
end
