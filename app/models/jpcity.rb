class Jpcity < ApplicationRecord
  has_one :jpcity2
  has_one :jpclimate
  accepts_nested_attributes_for :jpcity2
  accepts_nested_attributes_for :jpclimate
end
