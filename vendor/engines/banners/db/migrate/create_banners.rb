class CreateBanners < ActiveRecord::Migration

  def self.up
    create_table :banners do |t|
      t.string :titulo
      t.text :descricao
      t.string :url
      t.integer :image_id
      t.integer :position

      t.timestamps
    end

    add_index :banners, :id

    load(Rails.root.join('db', 'seeds', 'banners.rb'))
  end

  def self.down
    UserPlugin.destroy_all({:name => "banners"})

    Page.delete_all({:link_url => "/banners"})

    drop_table :banners
  end

end
