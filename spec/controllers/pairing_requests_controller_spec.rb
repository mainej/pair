require 'spec_helper'

describe PairingRequestsController do
  describe "#create" do
    it "redirect back to root" do
      post :create
      response.should redirect_to root_url
    end
  end
end
