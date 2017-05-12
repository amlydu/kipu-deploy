class AddAttrsToLogs < ActiveRecord::Migration[5.1]
  def change
    add_column :logs, :lambda_name, :string
    add_column :logs, :log, :text
    add_column :logs, :time, :bigint
  end
end
