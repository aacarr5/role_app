FactoryGirl.define do 
	factory :user do
		email {Faker::Internet.email}
		password {"password"}
		role {%w(admin student teacher).sample} 
	end
end