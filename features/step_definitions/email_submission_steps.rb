Given(/^a marketing page$/) do
  visit root_path
end

When(/^I submit an email through a public webpage to Pivotal Boston$/) do
  fill_in :pairing_request_email, with: 'something@example.com'
  click_button "Let's Pair"
end

Then(/^the admins receive that email$/) do
  emails = ActionMailer::Base.deliveries
  emails.map(&:to).should == [
    ["boston@pivotallabs.com"]
  ]
  emails.first.body.should include 'something@example.com'
end
