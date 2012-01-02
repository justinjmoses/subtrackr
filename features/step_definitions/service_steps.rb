Given /^there are services named (.+)$/ do |names|
  names.split(', ').each do |name|
    Service.create!(name: name)
  end
end

Given /^there are no services$/ do
  Service.delete_all
end

When /^I go to the list of services$/ do
  visit services_path
end

Then /^I should see "([^\"]*)"$/ do |arg1|
  page.should have_content(arg1)
end

Then /^I should have ([0-9]+) services?$/ do |count|
  Service.count.should eq(count.to_i)
end

When /^I go to a new service$/ do
  visit new_service_path
end

When /^I enter in "([^\"]*)" as a name$/ do |arg1|
  fill_in("Name", with: arg1)
end

When /^I add a scheme with the name "([^\"]*)" and an amount of "([^\"]*)" with frequency "([^\"]*)" and offset "([^\"]*)"$/ do |arg1, arg2, arg3, arg4|
  click_link("Add scheme")  
  within("#innerSchemes") do
    fill_in("Name", with: arg1)
    fill_in("Amount", with: arg2)
    fill_in("Frequency", with: arg3)
    fill_in("Offset", with: arg4)
  end  
end

When /^I submit the form$/ do
  find(:xpath, "//input[@type='submit']").click
end

Given /^there is a service named "([^\"]*)"$/ do |arg1|
  Service.create!(name: arg1)
end

Given /^with a scheme named "([^"]*)" of amount "([^"]*)" with frequency "([^\"]*)" and offset "([^\"]*)"$/ do |arg1, arg2, arg3, arg4|
  service = Service.first
  service.schemes.create!(name: arg1, amount: arg2, frequency: arg3, offset: arg4)
end

When /^I go to edit the service$/ do
  visit edit_service_path(Service.first)
end

When /^I delete the scheme named "([^\"]*)"$/ do |arg1|
  within("#innerSchemes") do 
    click_link("Del")
  end
end

Then /^I should not see "([^\"]*)"$/ do |arg1|
  page.should_not have_content(arg1)
end

