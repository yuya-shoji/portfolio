class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :reservations
  validates :name, :address, :email, :encrypted_password, presence: true
  validates :telephone_number, numericality: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

end
