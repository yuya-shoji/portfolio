class ReservationMailer < ApplicationMailer

  def complete_reservation(customer,reservation)
    @customer = customer
    @reservation = reservation
    mail to: customer.email, subject: '【Scheduler】 ご予約ありがとうございます'
  end
end
