class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Associations
  has_many :experiences

  # Validations
  validates :primary_number, presence: true, format: { with: /07\d{8}/ }
  # on: :create
  # validates :secondary_number,
  # validates :primary_first_name, presence: true
  # validates :primary_last_name, presence: true
end
