require 'rails_helper'

RSpec.describe Sighting, type: :model do
  it 'is not valid without a latitude' do
    bigfoot = Sighting.create(longitude: 56.3456, date: 20240421)
    expect(bigfoot.errors[:latitude]).to_not be_empty
  end

  it 'is not valid without a longitude' do
    bigfoot = Sighting.create(latitude: 56.3456, date: 20240421)
    expect(bigfoot.errors[:longitude]).to_not be_empty
  end

  it 'is not valid without a date' do
    bigfoot = Sighting.create(latitude: 56.3456, longitude: 45.2345)
    expect(bigfoot.errors[:date]).to_not be_empty
  end
end