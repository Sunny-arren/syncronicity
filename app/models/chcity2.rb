class Chcity2 < ApplicationRecord
 belongs_to :chcity
 belongs_to :latitude
 has_many :jpcity2s, through: :latitude
end
