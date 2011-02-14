class CreatePublicacoes < ActiveRecord::Migration

  def self.up
    create_table :artigos, :id => true do |t|
      t.string :titulo
      t.datetime :data
      t.integer :arquivo_id
      t.integer :categoria_id
      t.timestamps
    end

    add_index :artigos, :id

    create_table :categorias, :id => true do |t|
      t.string :titulo
      t.timestamps
    end

    add_index :categorias, :id
    load(Rails.root.join('db', 'seeds', 'refinerycms_publicacoes.rb').to_s)
  end

  def self.down
    UserPlugin.destroy_all({:name => "refinerycms_publicacoes"})

    Page.delete_all({:link_url => "/publicacoes"})

    drop_table :artigos
    drop_table :categorias
  end

end
