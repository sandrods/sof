class CreateEventos < ActiveRecord::Migration

  def self.up
    create_table :eventos do |t|
      t.string :titulo
      t.datetime :inicio
      t.datetime :fim
      t.text :lead
      t.text :detalhe
      t.integer :position

      t.timestamps
    end

    add_index :eventos, :id

    load(Rails.root.join('db', 'seeds', 'eventos.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "eventos"})

    Page.delete_all({:link_url => "/eventos"})

    drop_table :eventos
  end

end
