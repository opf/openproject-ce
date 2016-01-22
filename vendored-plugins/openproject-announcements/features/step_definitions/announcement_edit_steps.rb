When /^I enter (.+) into the announcement date field$/ do |time|
  time = eval(time.gsub("\"", "")).strftime("%Y-%m-%d")

  steps %Q{
    When I fill in "announcement_show_until" with "#{time}"
  }
end

When /^I enter (.+) into the announcement text field$/ do |text|
  text = text.gsub("\"", '')
  steps %Q{
    When I fill in "announcement_text" with "#{text}"
  }
end

When /^I activate the announcement$/ do
  steps %Q{
    When I check "announcement_active"
  }
end
