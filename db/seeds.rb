# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Item.create([{
  name: "チェーリング",
  description: "アイウエオおお",
  size: "32",
  condition: "新品",
  shipping_fee: "500",
  shipping_method: "普通郵便",
  prefecture: "東京",
  shipping_date: "１日",
  price: 1500,
  profit: 300,
  status: 0,
  seller_id: 1,
 },{
  name: "システム手帳",
  description: "とても綺麗に使ってます",
  size: "フリー",
  condition: "中古",
  shipping_fee: "599",
  shipping_method: "普通郵便",
  prefecture: "埼玉",
  shipping_date: "二日",
  price: 1500,
  profit: 300,
  status: 0,
  seller_id: 1,
 },{
  name: "コスメボックス",
  description: "匂いつき",
  size: "でかい",
  condition: "中古",
  shipping_fee: "５００",
  shipping_method: "普通郵便",
  prefecture: "群馬",
  shipping_date: "二日",
  price: 1500,
  profit: 300,
  status: 0,
  seller_id: 1,
 },{
  name: "コーチ",
  description: "可愛いコーチです。この夏にぴったり",
  size: "２つ折りサイズ",
  condition: "未開封",
  shipping_fee: "３００",
  shipping_method: "らくらくメルカリ便",
  prefecture: "北海道",
  shipping_date: "三日",
  price: 1500,
  profit: 300,
  status: 0,
  seller_id: 1,
 }
])

Image.create(
  image:open("public/images/m65260678049_1.jpg"),
  item_id: 1
)