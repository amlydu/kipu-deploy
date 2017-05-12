class AddTotalStepsToRelease < ActiveRecord::Migration[5.1]
  def change
    add_column :releases, :total_steps, :integer
  end
end
