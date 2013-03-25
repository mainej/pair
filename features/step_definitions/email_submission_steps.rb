Given(/^a marketing page$/) do
  visit root_path
end

When(/^I submit an email through a public webpage to Pivotal Boston$/) do
  fill_in :pairing_request_email, with: 'something@example.com'
  click_button 'Submit'
end

Then(/^the admins receive that email$/) do
    pending # express the regexp above with the code you wish you had
end
