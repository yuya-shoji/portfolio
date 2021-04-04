class Reservation < ApplicationRecord
  belongs_to :customer, required: true
  belongs_to :admin
  has_many :contacts
  include ActiveModel::Validations
  validates :title, presence: true
  validates_with DatetimeValidator
end