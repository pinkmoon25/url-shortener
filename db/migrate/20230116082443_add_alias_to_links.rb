class AddAliasToLinks < ActiveRecord::Migration[7.0]
  def change
    add_column :links, :alias, :string
  end
end
