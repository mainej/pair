require 'spec_helper'

describe PairingRequestMailer do
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
