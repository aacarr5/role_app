class Note < ActiveRecord::Base

	belongs_to :author, class_name:"User"

	has_many :categorizations
	has_many :categories, through: :categorizations

	def categories=(categories)
		return if categories == nil || categories.length == 0
		categories.split(",").each do |cat|
			exists = Category.find_by(name:cat)
			if exists
				Categorization.create(note_id:self.id,category_id:exists.id)
				self.categories << exists
			else
				new_category = Category.create(name:cat)
				Categorization.create(note_id:self.id,category_id:new_category.id)
		 		self.categories << new_category
		 end
		end
	end

end
