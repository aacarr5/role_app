require 'rails_helper'

RSpec.describe User, type: :model do

	let(:user) {FactoryGirl.create(:user)}

	it 'should be a user' do
		expect(user).to be_a User
	end

end