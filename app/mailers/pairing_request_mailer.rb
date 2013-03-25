class PairingRequestMailer < ActionMailer::Base
  ADMIN_EMAIL_ADDRESS = 'boston@pivotallabs.com'
  def lets_pair(email)
    @email = email
    mail(from: @email, to: ADMIN_EMAIL_ADDRESS)
  end
end
