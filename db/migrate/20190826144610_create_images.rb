class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.string :url
      t.string :keywords, array: true, default: []
      t.string :alt_text

      t.timestamps
    end
  end
end
