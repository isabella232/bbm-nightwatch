class ApplicationMailer < ActionMailer::Base
  default from: "noreply@#{ENV['HOST']}"
  layout 'mailer'
end
