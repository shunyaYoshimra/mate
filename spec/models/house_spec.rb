require 'rails_helper'

RSpec.describe House, type: :model do
  
  it "is valid with name, prefecture, profile" do
    house = House.create(
      name: 'test-name',
      prefecture: 'test-prefecture',
      profile: 'test-profile'
    )
    expect(house).to be_valid
  end

  it "is invalid without name" do
    house = House.new(name: nil)
    house.valid?
    expect(house.errors[:name]).to include("を入力してください")
  end

  it "is invalid with too long name" do
    house = House.new(name: "a"*51)
    house.valid?
    expect(house.errors[:name]).to include("は50文字以内で入力してください")
  end

  it "is invalid without profile" do
    house = House.new(profile: nil)
    house.valid?
    expect(house.errors[:profile]).to include("を入力してください")
  end

  it "is invalid with too long profile" do
    house = House.new(profile: "a"*256)
    house.valid?
    expect(house.errors[:profile]).to include("は255文字以内で入力してください")
  end

  it "is invalid without name" do
    house = House.new(prefecture: nil)
    house.valid?
    expect(house.errors[:prefecture]).to include("を入力してください")
  end
end
