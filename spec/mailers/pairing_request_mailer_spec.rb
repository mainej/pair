require 'spec_helper'

describe PairingRequestMailer do
  describe ".deliver_lets_pair" do
    it "constructs and delivers a let's pair email" do
      described_class.deliver_lets_pair('an-email')
      emails = ActionMailer::Base.deliveries
      emails.size.should == 1
    end
  end

  describe "lets_pair" do
    it "includes provided email in body" do
      address = 'something@example.com'
      email = described_class.lets_pair(address)
      email.to.should == ["boston@pivotallabs.com"]
      email.from.should == [address]
      email.body.encoded.should include address
    end
  end
end
