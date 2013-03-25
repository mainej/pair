require 'spec_helper'

describe "welcome/index.html.haml" do
  it "has a 'submit email' form" do
    render

    Capybara.string(rendered).find("form[action='#{pairing_requests_path}']").tap do |form|
      form.should have_selector("input[name='pairing_request[email]']", text: '')
      form.should have_selector("input[type='submit']")
    end
  end
end
