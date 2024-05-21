class ChangeColumn < ActiveRecord::Migration[7.0]
  def change
    rename_column :links, :link, :original_url
  end
end
