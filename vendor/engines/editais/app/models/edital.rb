class Edital < ActiveRecord::Base

  acts_as_indexed :fields => [:titulo, :descricao]
  
  validates :titulo, :presence => true, :uniqueness => true
  
  belongs_to :arquivo, :class_name => 'Resource'
end
