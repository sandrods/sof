class Banner < ActiveRecord::Base

  acts_as_indexed :fields => [:titulo, :descricao, :url]
  
  validates :titulo, :presence => true, :uniqueness => true
  
  belongs_to :image
end
