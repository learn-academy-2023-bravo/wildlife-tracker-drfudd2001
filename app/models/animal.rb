class Animal < ApplicationRecord
    has_many :sightings
    validates :common_name, :scientific_binomial, presence: true
    validate :check_common_name_and_scientific_binomial
    validates :common_name, :scientific_binomial, uniqueness: true
    accepts_nested_attributes_for :sightings
  
    def check_common_name_and_scientific_binomial
      errors.add(:common_name, "can't be the same as scientific_binomial") if common_name == scientific_binomial
    end
  end