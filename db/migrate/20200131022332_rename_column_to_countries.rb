class RenameColumnToCountries < ActiveRecord::Migration[6.0]
  def change
    rename_column :countries, :country, :name
  end
end
