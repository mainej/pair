require 'spec_helper'

describe PairingRequest do
  describe 'request' do
    before do
      PairingRequestMailer.stub(:lets_pair)
    end

    it 'should create an email' do
      email = 'something@example.com'
      fake_mail = stub(:fake_mail)
      fake_mail.should_receive(:deliver)
      PairingRequestMailer.should_receive(:lets_pair).with(email) { fake_mail }

      PairingRequest.request(email: email)
    end

    it "does not send the email if the email address is invalid" do
      PairingRequestMailer.should_not_receive(:lets_pair)
      PairingRequest.request(email: nil)
    end

    it "returns the request" do
      req = PairingRequest.request(email: nil)
      req.should be_a PairingRequest
    end
  end

  it "validates email" do
    PairingRequest.new(email: nil).should_not be_valid
    PairingRequest.new(email: '').should_not be_valid
    PairingRequest.new(email: 'bad').should_not be_valid
    PairingRequest.new(email: 'something@example.com').should be_valid
  end
end
