class AddLookupCodeToLinks < ActiveRecord::Migration[7.0]
  def change
    add_column :links, :lookup_code, :string
  end
end
