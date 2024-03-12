require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
  end

  describe 'associations' do
    it { should have_many(:participations).dependent(:destroy) }
    it { should have_many(:games).dependent(:destroy) }
    it { should have_many(:storylines) }
  end

  it "encrypts the password" do
    user = User.create(email: "test@example.com", password: "password")
    expect(user.encrypted_password).not_to eq "password"
  end
end
