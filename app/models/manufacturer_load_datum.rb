class ManufacturerLoadDatum < ApplicationRecord
  belongs_to :manufacturer
  belongs_to :cartridge
  belongs_to :bullet
  belongs_to :smokeless_powder
end
