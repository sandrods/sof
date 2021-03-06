class Noticia < ActiveRecord::Base

  acts_as_indexed :fields => [:titulo, :lead, :detalhe]
  
  alias_attribute :title, :titulo
  
  acts_as_taggable_on :tags

  has_friendly_id :titulo, :use_slug => true

  validates :titulo, :presence => true, :uniqueness => true
  
  belongs_to :foto, :class_name => 'Image'
  
  def self.destaque
    @destaque ||= Noticia.order('data desc').first
  end

  def self.destaque2
    @destaque2 ||= Noticia.order('data desc').offset(1).first
  end


end
