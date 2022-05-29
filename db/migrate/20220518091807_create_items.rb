class CreateItems < ActiveRecord::Migration[6.1]

  def change
    create_table :items do |t|

      t.string :name
      t.text :detail
      t.integer :genre_id
      t.integer :unit_price
      t.integer :sales_status, default: 0

      t.timestamps
    end
  end
end
