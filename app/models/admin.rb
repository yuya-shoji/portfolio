class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :reservation
  validates :name, :email, :encrypted_password, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
