class CreatePhobias < ActiveRecord::Migration[5.2]
  def change
    create_table :phobias do |t|
      t.string :name
      t.string :keywords, array: true, default: []

      t.timestamps
    end
  end
end
