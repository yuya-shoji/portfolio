class Reservation < ApplicationRecord
  belongs_to :customer
  belongs_to :admin
  has_many :contacts
end
