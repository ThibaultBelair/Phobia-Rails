class DeleteAltAndScoreOnImages < ActiveRecord::Migration[5.2]
  def change
    remove_column :images, :score
    remove_column :images, :alt
  end
end
