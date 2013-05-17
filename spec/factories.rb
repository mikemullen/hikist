FactoryGirl.define do
  factory :user do
  	sequence(:name)   { |n| "Person_#{n}" }
  	sequence(:email)  { |n| "person_#{n}@example.com" }
  	password "foobar"
  	password_confirmation "foobar"

  	factory :admin do
  	  admin true
  	end
  end

  factory :hikelog do
  	content "Lorem ipsum"
  	title "Lorem"
  	location "CA"
  	date_of_hike '2013-5-10'
  	length_of_hike 1.5
  	elevation_change 1000
  	user
  end
end