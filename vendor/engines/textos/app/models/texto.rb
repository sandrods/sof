class Texto < ActiveRecord::Base

  alias_attribute :title, :titulo

  acts_as_taggable_on :tags

  acts_as_indexed :fields => [:titulo]
  
  validates :titulo, :presence => true, :uniqueness => true
  
  belongs_to :arquivo, :class_name => 'Resource'

end
