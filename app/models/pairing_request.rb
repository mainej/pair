class PairingRequest
  include Informal::Model

  attr_accessor :email

  validates :email, presence: true, email: true

  def self.deliver(attrs)
    req = new(attrs)
    req.deliver_request
    req
  end

  def deliver_request
    if valid?
      PairingRequestMailer.deliver_lets_pair(email)
    end
  end
end
