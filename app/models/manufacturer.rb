class Manufacturer < ApplicationRecord
  has_many :bullets
  has_many :smokeless_powders
  has_many :manufacturer_load_data
end
