class AddDeployStatusToInstances < ActiveRecord::Migration[5.1]
  def change
    add_column :instances, :deploy_status, :string
  end
end
