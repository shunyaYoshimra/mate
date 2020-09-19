require 'rails_helper'

RSpec.describe Person, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @house = House.create(
      name: 'test-name',
      profile: 'test-profile',
      prefecture: 'test-prefecture'
    )
  end

  it "has a valid factory of user" do
    user = @user
    expect(user).to be_valid
  end

  it "has a valid factory of house" do
    house = @house
    expect(house).to be_valid
  end

  it "is valid with user_id, house_id" do
    user = @user
    house = @house
    person = house.persons.create
    person.user_id = user.id
    expect(person).to be_valid
   end
end
