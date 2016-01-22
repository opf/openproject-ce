Given /^there is an (active|inactive) announcement saying (.+)$/ do |status, text|
  active = status == "active" ? true : false
  text = text.gsub("\"","")
  FactoryGirl.create(:announcement, :text => text, :active => active)
end
