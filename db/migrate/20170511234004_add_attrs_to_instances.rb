class AddAttrsToInstances < ActiveRecord::Migration[5.1]
  def change
    add_column :instances, :name, :string
    add_index :instances, :name
  end
end
