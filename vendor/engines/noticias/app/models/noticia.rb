class Noticia < ActiveRecord::Base

  acts_as_indexed :fields => [:titulo, :lead, :detalhe]
  
  acts_as_taggable
  
  validates :titulo, :presence => true, :uniqueness => true
  
  belongs_to :foto, :class_name => 'Image'
end
