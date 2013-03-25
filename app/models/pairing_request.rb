class PairingRequest
  include Informal::Model

  attr_accessor :email

  def self.request(attrs)
    req = new(attrs)
    PairingRequestMailer.lets_pair(req.email).deliver
  end
end
