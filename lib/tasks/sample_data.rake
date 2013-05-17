namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
  	admin = User.create!(name: "Example User",
  				               email: "example@railstutorial.org",
  				               password: "foobar",
  				              password_confirmation: "foobar")
    admin.toggle!(:admin)
  	99.times do |n|
  		name = Faker::Name.name
  		email = "example-#{n+1}@railstutorial.org"
  		password = "password"
  		User.create!(name: name,
  					 email: email,
  					 password: password,
  					 password_confirmation: password)
  	end
    users = User.all(limit: 6)
    35.times do
      content = Faker::Lorem.sentence(10)
      title = Faker::Lorem.sentence(2)
      date_of_hike = '2012-5-24'
      length_of_hike = 10
      elevation_change = 1300
      users.each do |user|
        user.hikelogs.create!(content: content, title: title,
                              date_of_hike: date_of_hike,
                              length_of_hike: length_of_hike,
                              elevation_change: elevation_change)
      end
    end
  end
end