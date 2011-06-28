class Edital < ActiveRecord::Base

  acts_as_indexed :fields => [:titulo, :descricao]
  
  alias_attribute :title, :titulo
  
  validates :titulo, :presence => true, :uniqueness => true  
    
  belongs_to :arquivo, :class_name => 'Resource'
end
