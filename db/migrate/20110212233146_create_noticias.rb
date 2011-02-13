class CreateNoticias < ActiveRecord::Migration

  def self.up
    create_table :noticias do |t|
      t.string :titulo
      t.text :lead
      t.text :detalhe
      t.datetime :data
      t.integer :foto_id
      t.integer :position

      t.timestamps
    end

    add_index :noticias, :id

    load(Rails.root.join('db', 'seeds', 'noticias.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "noticias"})

    Page.delete_all({:link_url => "/noticias"})

    drop_table :noticias
  end

end
