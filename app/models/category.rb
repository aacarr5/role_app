class Category < ActiveRecord::Base

	has_many :categorizations
	has_many :notes, through: :categorizations

end
