require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#validations' do
    it 'should have a valid factory' do
      user = build :user
      expect(user).to be_valid
    end

    it 'shoud validate the presence of attributes' do
      user = build :user, login: nil, provider: nil
      expect(user).not_to be_valid
    end

    it 'should validate uniqueness of login' do
      user = create :user
      second_user = build :user, login: user.login
      expect(second_user).to_not be_valid
      second_user.login = 'newlogin123'
      expect(second_user).to be_valid
    end
  end
end
