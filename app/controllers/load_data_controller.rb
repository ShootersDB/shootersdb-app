class LoadDataController < ApplicationController
  before_action :authenticate_user!

  def index
    @manufacturer_load_data_filter = LoadDataFilter.new(source: ManufacturerLoadDatum, filters: [:bullet])
  end
end
