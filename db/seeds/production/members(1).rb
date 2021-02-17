names = %w(Taro Jiro Hana John Mike Sophy Bill Alex Mary Tom)
fnames = ["佐藤", "鈴木", "高橋", "田中"]
gnames = ["太郎", "次郎", "花子"]
0.upto(9) do |idx|
  Member.create(
    name: names[idx],
    full_name: "#{fnames[idx % 4]} #{gnames[idx % 3]}",
    sex: [1, 1, 2][idx % 3],
    birthday: "#{Random.rand(1980..2000)}-12-01",
    mail: "#{names[idx]}@example.com",
    password: "pop",
    password_confirmation: "pop",
    credit_number: "0123456789012345",
    expiration_date: "2022-01-01",
    authentication_number: "123",
    administrator: (idx == 0)
  )
end

# 0.upto(29) do |idx|
#   Member.create(
#     name: "John#{idx + 1}",
#     full_name: "John Doe#{idx + 1}",
#     sex: 1,
#     birthday: "1981-12-01",
#     mail: "John#{idx+1}@example.com",
#     password: "pop",
#     password_confirmation: "pop",
#     credit_number: "0123456789012345",
#     expiration_date: "0130",
#     authentication_number: "123",
#     administrator: false
#   )
# end