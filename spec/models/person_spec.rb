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

  it "is invalid without user_id" do
    person = Person.new(user_id: nil)
    person.valid?
    expect(person.errors[:user_id]).to include("を入力してください")
  end

  it "is invalid without house_id" do
    person = Person.new(house_id: nil)
    person.valid?
    expect(person.errors[:house_id]).to include("を入力してください")
  end
end
