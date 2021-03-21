class Reservation < ApplicationRecord
  belongs_to :customer
  has_many :contacts
end
