class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :urls, array: true, default: []
      t.integer :score
      t.string :keywords, array: true, default: []
      t.string :alt

      t.timestamps
    end
  end
end
