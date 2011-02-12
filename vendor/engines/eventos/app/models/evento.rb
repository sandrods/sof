class Evento < ActiveRecord::Base

  acts_as_indexed :fields => [:titulo, :lead, :detalhe]
  
  validates :titulo, :presence => true, :uniqueness => true
  
end
