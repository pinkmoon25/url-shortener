class ChangeColumnNullConstraint < ActiveRecord::Migration[7.0]
  def change
    change_column_null :links, :long_url, false
    change_column_null :links, :short_url, false
  end
end
