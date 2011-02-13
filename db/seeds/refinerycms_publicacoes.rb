User.find(:all).each do |user|
  user.plugins.create(:name => "refinerycms_publicacoes",
                      :position => (user.plugins.maximum(:position) || -1) +1)
end

page = Page.create(
  :title => "Publicações",
  :link_url => "/publicacoes",
  :deletable => false,
  :position => ((Page.maximum(:position, :conditions => {:parent_id => nil}) || -1)+1),
  :menu_match => "^/publicacoes?(\/|\/.+?|)$"
)

Page.default_parts.each do |default_page_part|
  page.parts.create(:title => default_page_part, :body => nil)
end
