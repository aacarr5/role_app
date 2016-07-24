# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


10.times do |count|
	user = FactoryGirl.create(:user,email:(count+1).to_s+"@gmail.com")

	10.times do |sub| 
		note = FactoryGirl.create(:note,author_id:user.id)
	end

end