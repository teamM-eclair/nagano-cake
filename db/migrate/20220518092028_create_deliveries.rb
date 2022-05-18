class CreateDeliveries < ActiveRecord::Migration[6.1]
  def change
    create_table :deliveries do |t|

      t.string :postcode
      t.text :address
      t.string :name

      t.timestamps
    end
  end
end
