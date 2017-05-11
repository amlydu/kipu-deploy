class CreateReleaseMains < ActiveRecord::Migration[5.1]
  def change
    create_table :release_mains do |t|

      t.timestamps
    end
  end
end
