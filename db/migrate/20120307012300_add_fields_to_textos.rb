class AddFieldsToTextos < ActiveRecord::Migration
  def self.up
    add_column :textos, :lead, :text
    add_column :textos, :corpo, :text
  end

  def self.down
    remove_column :textos, :lead
    remove_colum :textos, :corpo
  end
end
