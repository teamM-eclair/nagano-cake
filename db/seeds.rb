# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Admin
Admin.create!(
  email: 'test@test.com',
  password: 'testadmin'
  )

#Customer
Customer.create!(
  email: 'testcustomer@test.com',
  password: 'testcustomer',
  last_name: '山田',
  first_name: '太郎',
  last_name_kana: 'ヤマダ',
  first_name_kana: 'タロウ',
  postcode: '1234567',
  address: "神奈川県大和市",
  phone_number: '01012345678',
  status: 0
  )

Customer.create!(
  email: 'testcustomer2@test.com',
  password: 'testcustomer2',
  last_name: '岸田',
  first_name: '次郎',
  last_name_kana: 'キシダ',
  first_name_kana: 'ジロウ',
  postcode: '9876543',
  address: '神奈川県横浜市',
  phone_number: '02012345678',
  status: 0
  )

#Genre
Genre.create!(
  name: 'ケーキ'
  )

Genre.create!(
  name: 'プリン'
  )

Genre.create!(
  name: '焼き菓子'
  )

Genre.create!(
  name: 'キャンディ'
  )

#Delivery
Delivery.create!(
  customer_id: 1,
  postcode: '2345678',
  address: '東京都新宿区',
  name: '山田花子'
  )

Delivery.create!(
  customer_id: 2,
  postcode: '3456789',
  address: '東京都江戸川区',
  name: '岸田花子'
  )

#Item
Item.create!(
  name: 'いちごのショートケーキ（ホール）',
  detail: '栃木県産のとちおとめを贅沢に使用しています。',
  genre_id: 1,
  unit_price: 2500,
  sales_status: 0
  )

#Cart_item
CartItem.create!(
  amount: 2,
  item_id: 1,
  customer_id: 1
  )

#Order
# Order.create!(
#   customer_id: 1,
#   shipping_fee: 800,
#   bill: 6300,
#   payment_method: 1,
#   address: '神奈川県大和市',
#   postcode: '1234567',
#   name: '山田太郎',
#   status: 0
#   )

# Order.create!(
#   customer_id: 2,
#   shipping_fee: 800,
#   bill: 6300,
#   payment_method: 1,
#   address: '神奈川県横浜市',
#   postcode: '9876543',
#   name: '岸田次郎',
#   status: 1
#   )

# #Order_detail
# OrderDetail.create!(
#   order_id: 1,
#   item_id: 1,
#   amount: 2,
#   purchase_price: 5500,
#   product_status: 0
#   )

# OrderDetail.create!(
#   order_id: 2,
#   item_id: 1,
#   amount: 2,
#   purchase_price: 5500,
#   product_status: 0
#   )
