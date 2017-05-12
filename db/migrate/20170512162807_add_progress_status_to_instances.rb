class AddProgressStatusToInstances < ActiveRecord::Migration[5.1]
  def change
    add_column :instances, :progress_status, :string
  end
end
