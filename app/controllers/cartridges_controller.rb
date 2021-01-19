class CartridgesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_cartridge, only: [:show]

  def index
    @cartridges = Cartridge.all
  end

  def show
  end

  private

  def find_cartridge
    @cartridge = Cartridge.find(params[:id])
  end
end
