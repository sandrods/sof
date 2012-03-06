class AddDescriptionToArtigo < ActiveRecord::Migration
  def self.up
    add_column :artigos, :descricao, :text
  end

  def self.down
    remove_column :artigos, :descricao
  end
end
