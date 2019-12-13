class Chcity < ApplicationRecord
 has_one :chcity2
 has_one :chclimate
 accepts_nested_attributes_for :chcity2
 accepts_nested_attributes_for :chclimate
end
