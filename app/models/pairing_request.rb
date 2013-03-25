class PairingRequest
  include Informal::Model

  attr_accessor :email

  validates :email, presence: true, email: true

  def self.request(attrs)
    req = new(attrs)
    req.deliver_request
    req
  end

  def deliver_request
    if valid?
      PairingRequestMailer.lets_pair(email).deliver
    end
  end
end
