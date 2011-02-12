Given /^I have no eventos$/ do
  Evento.delete_all
end

Given /^I (only )?have eventos titled "?([^\"]*)"?$/ do |only, titles|
  Evento.delete_all if only
  titles.split(', ').each do |title|
    Evento.create(:titulo => title)
  end
end

Then /^I should have ([0-9]+) eventos?$/ do |count|
  Evento.count.should == count.to_i
end
