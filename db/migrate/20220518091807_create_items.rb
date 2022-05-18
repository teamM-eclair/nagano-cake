class CreateItems < ActiveRecord::Migration[6.1]
  
  def change
    create_table :items do |t|

      t.string :name
      t.text :detail
      t.integer :unit_price
      t.integer :sales_status

      t.timestamps
    end
  end
end
