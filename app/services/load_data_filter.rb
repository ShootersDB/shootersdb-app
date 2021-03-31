class LoadDataFilter
  attr_reader :source, :filters

  def initialize(source:, filters:)
    @source = source
    @filters = filters
  end

  def items
    @items ||= @source.all
                      .includes(:manufacturer, :bullet, :cartridge, :smokeless_powder)
                      .group_by { |datum| @filters.map { |method| datum.send("#{method}_id") } }
                      .map { |item| LoadDataFilterItem.new(item[0], item[1], @filters) }
  end
end
