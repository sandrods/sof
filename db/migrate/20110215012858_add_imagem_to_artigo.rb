class AddImagemToArtigo < ActiveRecord::Migration
  def self.up
    add_column :artigos, :imagem_id, :integer
  end

  def self.down
    remove_column :artigos, :imagem_id
  end
end