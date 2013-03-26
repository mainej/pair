require 'spec_helper'

describe PairingRequest do
  describe 'request' do
    before do
      PairingRequestMailer.stub(:deliver_lets_pair)
    end

    it 'should create an email' do
      email = 'something@example.com'
      PairingRequestMailer.should_receive(:deliver_lets_pair).with(email)

      PairingRequest.request(email: email)
    end

    it "does not send the email if the email address is invalid" do
      PairingRequestMailer.should_not_receive(:deliver_lets_pair)
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
