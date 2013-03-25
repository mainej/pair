require 'spec_helper'

describe PairingRequestsController do
  describe "#create" do
    def create
      post :create, pairing_request: {email: 'something@example.com'}
    end

    it "redirect back to root" do
      PairingRequest.stub(:request)
      create
      response.should redirect_to root_url
    end

    it "sends an email" do
      PairingRequest.should_receive(:request).with('email' => 'something@example.com')
      create
    end
  end
end
