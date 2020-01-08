class Jpcity2 < ApplicationRecord
 belongs_to :jpcity
 belongs_to :latitude
 has_many :chcity2s, through: :latitude
end