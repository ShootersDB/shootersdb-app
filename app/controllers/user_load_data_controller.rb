class UserLoadDataController < ApplicationController
  before_action :authenticate_user!
  before_action :find_load_data, only: [:show]

  def show
  end

  private

  def find_load_data
    UserLoadDatum.find(params[:id])
  end
end
