class Banner < ActiveRecord::Base

  acts_as_indexed :fields => [:titulo, :descricao, :url]
  
  acts_as_taggable
  
  validates :titulo, :presence => true, :uniqueness => true
  
  belongs_to :image
end
