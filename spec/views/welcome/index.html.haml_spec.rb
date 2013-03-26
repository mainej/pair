require 'spec_helper'

describe "welcome/index.html.haml" do
  it "has a 'submit email' form" do
    assign(:pairing_request, PairingRequest.new)
    render

    Capybara.string(rendered).find("form[action='#{pairing_requests_path}']").tap do |form|
      form.should have_selector("input[name='pairing_request[email]']", text: '')
      form.should have_selector("input[type='submit']")
    end
  end

  it "renders validation errors" do
    assign(:pairing_request, PairingRequest.new(email: 'bad').tap(&:valid?))
    render

    Capybara.string(rendered).find("form[action='#{pairing_requests_path}']").tap do |form|
      form.should have_selector(".error input[name='pairing_request[email]'][value='bad']")
    end
  end
end
