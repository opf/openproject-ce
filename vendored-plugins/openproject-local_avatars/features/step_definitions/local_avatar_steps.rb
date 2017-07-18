When /^I upload a "(.*?)" image/ do |image|
  attach_file(:avatar, File.join(File.dirname(__FILE__), '../upload-files', image.to_s))
end

Given /^the user "(.*?)" has a local avatar/ do | login |
  user = User.find_by_login(login)
  user.attachments = [FactoryGirl.build(:avatar_attachment, :author => user)]
end

Then /^I should see a local avatar inside "(.*?)"/ do |container|
  page.should have_selector(".#{container} img.avatar")
end
