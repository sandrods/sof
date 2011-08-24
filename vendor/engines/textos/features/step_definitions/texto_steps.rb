Given /^I have no textos$/ do
  Texto.delete_all
end

Given /^I (only )?have textos titled "?([^\"]*)"?$/ do |only, titles|
  Texto.delete_all if only
  titles.split(', ').each do |title|
    Texto.create(:titulo => title)
  end
end

Then /^I should have ([0-9]+) textos?$/ do |count|
  Texto.count.should == count.to_i
end
