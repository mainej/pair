require 'spec_helper'

describe WelcomeController do
  describe "#index" do
    it "renders a page" do
      get :index
      response.should render_template :index
    end

    it "assigns a new pairing request" do
      get :index
      assigns(:pairing_request).should be
    end
  end
end
