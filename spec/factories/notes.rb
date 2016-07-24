FactoryGirl.define do

	factory :note do
		author_id {[*1..10].sample}
		header {Faker::Lorem.sentence}
		content {Faker::Lorem.paragraph} 
	end

end