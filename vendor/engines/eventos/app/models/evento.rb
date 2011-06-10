class Evento < ActiveRecord::Base

  acts_as_indexed :fields => [:titulo, :lead, :detalhe, :local]
  
  acts_as_taggable_on :tags
  
  validates :titulo, :presence => true, :uniqueness => true
  
end
