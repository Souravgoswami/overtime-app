require 'rails_helper'

RSpec.describe Post, type: :model do
	describe 'Creation' do
		before do
			FactoryBot.create(:user)
			@post = FactoryBot.create(:post1)
		end

		it 'can be created' do
			expect(@post).to be_valid
		end

		it 'cannot be created without a date, rationale, and overtime_request' do
			@post.date = @post.rationale = @post.overtime_request = nil
			expect(@post).to_not be_valid
		end

		it 'has an overtime request > 0.0' do
			@post.overtime_request = 0.0
			expect(@post).to_not be_valid
		end
	end
end
