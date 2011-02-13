class Categoria < ActiveRecord::Base

  has_many :artigos

  acts_as_indexed :fields => [:titulo]

  validates :titulo, :presence => true, :uniqueness => true

  has_friendly_id :titulo, :use_slug => true

  def post_count
    artigos.select(&:live?).count
  end

end
