require 'rails_helper'

RSpec.describe Animal, type: :model do
  it 'is not valid without a common_name' do
    bigfoot = Animal.create(scientific_binomial: 'Dinanthropoides magnipus')
    expect(bigfoot.errors[:common_name]).to_not be_empty
  end

  it 'is not valid without a scientific_binomial' do
    bigfoot = Animal.create(common_name: 'Sasquatch')
    expect(bigfoot.errors[:scientific_binomial]).to_not be_empty
  end

  it 'is not valid if common_name is the same as scientific_binomial' do
    bigfoot = Animal.create(common_name: 'Sasquatch', scientific_binomial: 'Sasquatch')
    expect(bigfoot.errors[:common_name]).to_not be_empty
  end

  it 'is not valid if common_name is not unique' do
    bigfoot1 = Animal.create(common_name: 'Sasquatch', scientific_binomial: 'Dinanthropoides magnipus')
    bigfoot2 = Animal.create(common_name: 'Sasquatch', scientific_binomial: 'Dinanthropoides magnipus 2')
    expect(bigfoot2.errors[:common_name]).to_not be_empty
  end

  it 'is not valid if scientific_binomial is not unique' do
    bigfoot1 = Animal.create(common_name: 'Sasquatch', scientific_binomial: 'Dinanthropoides magnipus')
    bigfoot2 = Animal.create(common_name: 'Sasquatch 2', scientific_binomial: 'Dinanthropoides magnipus')
    expect(bigfoot2.errors[:scientific_binomial]).to_not be_empty
  end
end
