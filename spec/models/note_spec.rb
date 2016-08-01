require 'rails_helper'

RSpec.describe Note, type: :model do
  let(:note) {FactoryGirl.create(:note)}

  let(:category) {FactoryGirl.create(:category,name:"learning")}

  let(:categorization) {FactoryGirl.create(:categorization,note_id:note.id,category_id:category.id)}


  describe 'init' do 
  	it 'should be a note' do 
  		expect(note).to be_a Note
  	end
  end

  describe 'associations' do 
  	it 'should be associated to cateogry' do
  		# binding.pry
			expect(note.categories.first).to be_a Category
	  end
  end

end
