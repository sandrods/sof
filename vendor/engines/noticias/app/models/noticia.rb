class Noticia < ActiveRecord::Base

  acts_as_indexed :fields => [:titulo, :lead, :detalhe]
  
  acts_as_taggable_on :tags
  
  validates :titulo, :presence => true, :uniqueness => true
  
  belongs_to :foto, :class_name => 'Image'
  
  def self.destaque
    @destaque ||= Noticia.first
  end

  def self.destaque2
    @destaque2 ||= Noticia.offset(1).first
  end


end
