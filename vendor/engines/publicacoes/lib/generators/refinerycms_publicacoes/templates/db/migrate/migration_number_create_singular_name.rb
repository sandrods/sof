class Create<%= singular_name.camelize %> < ActiveRecord::Migration

  def self.up<% @refinerycms_publicacoes_tables.each do |table| %>
    create_table :<%= table[:table_name] %>, :id => <%= table[:id].to_s %> do |t|
<% table[:attributes].each do |attribute| -%>
      t.<%= attribute.type %> :<%= attribute.name %>
<% end -%>
      <%= 't.timestamps' if table[:id] %>
    end

    <%= "add_index :#{table[:table_name]}, :id" if table[:id] %>
<% end -%>
    load(Rails.root.join('db', 'seeds', 'refinerycms_publicacoes.rb').to_s)
  end

  def self.down
    UserPlugin.destroy_all({:name => "refinerycms_publicacoes"})

    Page.delete_all({:link_url => "/publicacoes"})

<% @refinerycms_publicacoes_tables.each do |table| -%>
    drop_table :<%= table[:table_name] %>
<% end -%>
  end

end
