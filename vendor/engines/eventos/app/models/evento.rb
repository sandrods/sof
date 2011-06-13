class Evento < ActiveRecord::Base

  acts_as_indexed :fields => [:titulo, :lead, :detalhe, :local]
  
  acts_as_taggable_on :tags
  
  validates :titulo, :presence => true, :uniqueness => true
  validates :inicio, :presence => true

  def self.ultimos
    Evento.order("inicio desc").limit(3)
  end

end
