class UserReloadingChecklist < ApplicationRecord
  belongs_to :user
  has_many :user_reloading_checklist_steps
end
