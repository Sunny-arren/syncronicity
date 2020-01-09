class Chcity < ApplicationRecord
 has_one :chcity2
 has_one :chclimate
 belongs_to :province
end
