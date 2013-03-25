require 'spec_helper'

describe PairingRequest do
  describe 'request' do
    it 'should create an email' do
      email = 'something@example.com'
      fake_mail = stub(:fake_mail)
      fake_mail.should_receive(:deliver)
      PairingRequestMailer.should_receive(:lets_pair).with(email) { fake_mail }

      PairingRequest.request(email: email)
    end
  end
end
