class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.integer :shipping_fee
      t.integer :bill
      t.integer :payment_method
      t.text :address
      t.string :postcode
      t.string :name
      t.integer :status

      t.timestamps
    end
  end
end
