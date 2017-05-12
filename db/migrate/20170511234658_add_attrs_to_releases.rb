class AddAttrsToReleases < ActiveRecord::Migration[5.1]
  def change
    add_column :releases, :uuid, :string
    add_index :releases, :uuid
    add_column :releases, :start_time, :bigint
    add_column :releases, :end_time, :bigint
  end
end
