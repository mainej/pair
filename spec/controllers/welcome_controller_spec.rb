require 'spec_helper'

describe WelcomeController do
  describe "#index" do
    it "renders a page" do
      get :index
      response.should render_template :index
    end
  end
end
