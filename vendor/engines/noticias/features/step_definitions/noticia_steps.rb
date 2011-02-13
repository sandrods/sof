Given /^I have no noticias$/ do
  Noticia.delete_all
end

Given /^I (only )?have noticias titled "?([^\"]*)"?$/ do |only, titles|
  Noticia.delete_all if only
  titles.split(', ').each do |title|
    Noticia.create(:titulo => title)
  end
end

Then /^I should have ([0-9]+) noticias?$/ do |count|
  Noticia.count.should == count.to_i
end
