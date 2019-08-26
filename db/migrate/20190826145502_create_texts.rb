class CreateTexts < ActiveRecord::Migration[5.2]
  def change
    create_table :texts do |t|
      t.string :url
      t.string :keywords, array: true, default: []
      t.string :content

      t.timestamps
    end
  end
end
