class CreateEditais < ActiveRecord::Migration

  def self.up
    create_table :editais do |t|
      t.date :data
      t.string :titulo
      t.string :descricao
      t.integer :arquivo_id
      t.integer :position

      t.timestamps
    end

    add_index :editais, :id

    load(Rails.root.join('db', 'seeds', 'editais.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "editais"})

    Page.delete_all({:link_url => "/editais"})

    drop_table :editais
  end

end
