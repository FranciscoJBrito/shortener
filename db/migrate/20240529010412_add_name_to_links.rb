class AddNameToLinks < ActiveRecord::Migration[7.0]
  def change
    add_column :links, :name, :string
  end
end
