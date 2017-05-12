class AddInstanceToReleases < ActiveRecord::Migration[5.1]
  def change
    add_reference :releases, :instance, foreign_key: true
  end
end
