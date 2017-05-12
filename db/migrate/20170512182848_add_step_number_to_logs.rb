class AddStepNumberToLogs < ActiveRecord::Migration[5.1]
  def change
    add_column :logs, :step_number, :integer
  end
end
