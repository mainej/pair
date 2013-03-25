require 'spec_helper'

describe "pairing_request_mailer/lets_pair.text.erb" do
  it "includes the email" do
    assign(:email, 'something@example.com')
    render
    rendered.should include 'something@example.com'
  end
end
