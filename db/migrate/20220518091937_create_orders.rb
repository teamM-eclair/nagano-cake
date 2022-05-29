class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.integer :customer_id
      t.integer :shipping_fee, default: 800
      t.integer :bill
      t.integer :payment_method, default: 0
      t.text :address
      t.string :postcode
      t.string :name
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
