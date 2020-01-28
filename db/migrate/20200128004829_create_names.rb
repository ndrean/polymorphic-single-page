class CreateNames < ActiveRecord::Migration[6.0]
  def change
    create_table :names do |t|
      t.references :country, null: false, foreign_key: true

      t.timestamps
    end
  end
end
