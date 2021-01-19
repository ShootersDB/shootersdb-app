class UserReloadingChecklistStep < ApplicationRecord
  belongs_to :user
  belongs_to :user_reloading_checklist

  default_scope { order(order: :asc) }
end
