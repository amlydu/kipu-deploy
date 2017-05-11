class AddAttrsToReleaseMain < ActiveRecord::Migration[5.1]
  def change
    add_column :release_mains, :uuid, :string
    add_index :release_mains, :uuid
    add_column :release_mains, :start_time, :bigint
    add_column :release_mains, :end_time, :bigint
  end
end
