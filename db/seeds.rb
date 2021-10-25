# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# [
#   "ケーキ",
#   "焼き菓子",
#   "プリン",
#   "キャンディ",
#   "和菓子",
# ].each do |name|
#   Genre.create!(
#     { name: name }
#   )
# end

# Customer.create!(
#   family_name: "山田",
#   family_name_kana: "ヤマダ",
#   first_name: "花子",
#   first_name_kana: "ハナコ",
#   email: "hoge@example.com",
#   password: "password",
#   postal_code: "1500041",
#   address: "東京都渋谷区神南１丁目19-11 パークウェースクエア24階",
#   telephone_number: "0368694700",
#   withdrawal: false
# )

# [
#   [1, '4210303', '静岡県榛原郡吉田町片岡2519-1' , '岡部元信'],
#   [1, '3800851', '長野県長野市長野元善街491'    , '栗田鶴寿'],
#   [1, '3770931', '群馬県吾妻郡東吾妻町大戸2457' , '浦野正忠'],
#   [1, '5061105', '岐阜県飛騨市神岡町和佐保'     , '江馬信盛'],
# ].each do |customer_id, postal_code, address, name|
#   Address.create!(
#     { customer_id: customer_id, postal_code: postal_code, address: address, name: name}
#   )
# end