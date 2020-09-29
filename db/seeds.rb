# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


  5.times do |n|
    User.create!(
      email: "test#{n + 1}@test.com",
      name: "テスト#{n + 1}",
      acount_name: "@テスト#{n + 1}",
      password: "kkkkkk"
    )
  end

  User.all.each do |user|
  	user.genres.create!(
  		name: "平日"
  	)
  	user.diaries.create!(
  		tetle: 'テスト日記',
  		body: 'テストテストテストテストテストテストテストテストテストテストテストテストテスト',
  		genre: 1
  	)
  	user.posts.create!(
  		content: 'テストテストテスト',
  		post_image: File.open('./app/assets/images/favicon2.png'),
  		post_status: true
  	)
  end