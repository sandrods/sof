Given /^I have no editais$/ do
  Edital.delete_all
end

Given /^I (only )?have editais titled "?([^\"]*)"?$/ do |only, titles|
  Edital.delete_all if only
  titles.split(', ').each do |title|
    Edital.create(:titulo => title)
  end
end

Then /^I should have ([0-9]+) editais?$/ do |count|
  Edital.count.should == count.to_i
end
