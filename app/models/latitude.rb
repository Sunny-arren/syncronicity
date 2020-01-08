class Latitude < ApplicationRecord
  has_many :chcity2s
  has_many :jpcity2s
end