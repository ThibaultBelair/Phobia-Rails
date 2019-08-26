class AddUrlArrayToImages < ActiveRecord::Migration[5.2]
  def change
    remove_column :images, :url
    add_column :images, :urls, :string, array: true, default: []
  end
end
