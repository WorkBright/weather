Given('I am a visitor') do
  # Nothing needs to be done here
end


When('I go to the home page') do
  visit root_path
end

Then('I should see the welcome message') do
  expect(page).to have_content("Welcome to the Weather App")
end
