require 'spec_helper'

describe PairingRequest do
  describe 'deliver' do
    before do
      PairingRequestMailer.better_stub(:deliver_lets_pair)
    end

    it 'should create an email' do
      email = 'something@example.com'
      PairingRequestMailer.better_receive(:deliver_lets_pair).with(email)

      PairingRequest.deliver(email: email)
    end

    it "does not send the email if the email address is invalid" do
      PairingRequestMailer.better_receive(:deliver_lets_pair).never
      PairingRequest.deliver(email: nil)
    end

    it "returns the request" do
      req = PairingRequest.deliver(email: nil)
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
