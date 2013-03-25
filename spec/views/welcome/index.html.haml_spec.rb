require 'spec_helper'

describe "welcome/index.html.haml" do
  it "has a 'submit email' form" do
    render

    rendered.should have_selector("form[action='#{pairing_requests_path}']")
  end
end
