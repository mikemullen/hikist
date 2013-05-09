FactoryGirl.define do
  factory :user do
  	name     "Bob Evergreen"
  	email    "bob@example.com"
  	password "foobar"
  	password_confirmation "foobar"
  end
end