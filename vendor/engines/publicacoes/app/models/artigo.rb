class Artigo < ActiveRecord::Base

  belongs_to :categoria

  acts_as_indexed :fields => [:titulo]

  validates :titulo, :presence => true, :uniqueness => true

  has_friendly_id :titulo, :use_slug => true

  scope :por_categoria, lambda { |cat_id|
    where(:categoria_id=>cat_id).order("data DESC")
  }
  
  scope :previous, lambda { |i| where(["data < ?", i.data, false]).order("data DESC").limit(1) }
  scope :next, lambda { |i| where(["data > ?", i.data, false]).order("data ASC").limit(1) }

  scope :live, lambda { where( "data < ?", Time.now).order("data DESC") }

  def next
    self.class.next(self).first
  end

  def prev
    self.class.previous(self).first
  end

  def live?
    data <= Time.now
  end

end
