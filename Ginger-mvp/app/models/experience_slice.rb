class ExperienceSlice < ApplicationRecord

  # Associations
  belongs_to :activity
  belongs_to :experience

  # Validations
  validates :activity, presence: true
  validates :experience, presence: true
  validates :order, presence: true
  validates :experience, uniqueness: { scope: :activity }
end
