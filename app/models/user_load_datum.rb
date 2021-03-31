class UserLoadDatum < ApplicationRecord
  belongs_to :user
  belongs_to :bullet
  belongs_to :smokeless_powder
end
