class CreateTextos < ActiveRecord::Migration

  def self.up
    create_table :textos do |t|
      t.integer :arquivo_id
      t.string :titulo
      t.date :publicacao
      t.integer :position

      t.timestamps
    end

    add_index :textos, :id

    load(Rails.root.join('db', 'seeds', 'textos.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "textos"})

    Page.delete_all({:link_url => "/textos"})

    drop_table :textos
  end

end
