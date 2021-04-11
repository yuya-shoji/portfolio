class ApplicationMailer < ActionMailer::Base
  default from:    "Scheduler <from@gmail.com>"
  layout 'mailer'
end
