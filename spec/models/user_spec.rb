require 'rails_helper'

RSpec.describe User, type: :model do

	let(:user) {FactoryGirl.create(:user)}
	let(:bad_user) {FactoryGirl.build(:user,email:nil)}

	context 'initialziation' do 
		it 'should be a user' do
			expect(user).to be_a User
		end
	end

	context 'validations' do 
		it 'cannot have nil' do 
			expect(bad_user.valid?).to eq false
		end
	end



end