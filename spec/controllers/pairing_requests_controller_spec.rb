require 'spec_helper'

describe PairingRequestsController do
  describe "#create" do
    def create
      post :create, pairing_request: {email: 'something@example.com'}
    end

    it "redirects back to root" do
      PairingRequest.stub(:request)
      create
      response.should redirect_to root_url
    end

    it "shows a 'success' message" do
      PairingRequest.stub(:request)
      create
      flash.notice.should be
    end

    it "sends an email" do
      PairingRequest.should_receive(:request).with('email' => 'something@example.com')
      create
    end
  end
end
