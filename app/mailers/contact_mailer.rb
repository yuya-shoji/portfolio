class ContactMailer < ApplicationMailer

  def send_when_admin_reply(customer, contact) #メソッドに対して引数を設定
    @customer = customer #ユーザー情報
    @answer = contact.answer #返信内容
    mail to: customer.email, subject: '【Scheduler】 お問い合わせありがとうございます'
  end

end
