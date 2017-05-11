class CreateReleases < ActiveRecord::Migration[5.1]
  def change
    create_table :releases do |t|
      t.references :release_main, foreign_key: true

      t.timestamps
    end
  end
end
