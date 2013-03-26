require 'spec_helper'

describe PairingRequestsController do
  describe "#create" do
    def create
      post :create, pairing_request: {email: 'something@example.com'}
    end

    before(:each) do
      fake_request = stub(:fake_request, valid?: true)
      PairingRequest.stub(:request) { fake_request }
    end

    it "redirects back to root" do
      create
      response.should redirect_to root_url
    end

    it "shows a 'success' message" do
      create
      flash.notice.should be
    end

    it "sends an email" do
      PairingRequest.should_receive(:request).with('email' => 'something@example.com')
      create
    end

    context "when given an invalid email" do
      let(:fake_request) { stub(:fake_request, valid?: false) }

      before do
        PairingRequest.stub(:request) { fake_request }
      end

      it "does not render a flash" do
        create
        flash.notice.should_not be
      end

      it "sets up the invalid pairing request, to be rendered" do
        create
        assigns(:pairing_request).should == fake_request
      end

      it "renders the welcome template" do
        create
        response.should render_template("welcome/index")
      end
    end
  end
end
