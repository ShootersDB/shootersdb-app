class ReloadingChecklistsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_checklist, only: [:show, :label]

  def index
    @checklists = current_user.user_reloading_checklists
  end

  def show
  end

  def label
  end

  private

  def find_checklist
    @checklist = UserReloadingChecklist.find(params[:id])
  end
end
