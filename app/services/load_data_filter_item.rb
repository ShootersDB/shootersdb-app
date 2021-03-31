class LoadDataFilterItem
  attr_reader :load_data

  def initialize(filter_ids, load_data, filters)
    @filter_ids = filter_ids
    @load_data = load_data
    @filters = filters
  end

  def count
    load_data.count
  end

  def cartridge
    @cartridge ||= load_data.first.cartridge
  end

  # TODO: more than one bullet?
  def bullet
    @bullet ||= load_data.first.bullet
  end

  # TODO: more than one manufacturer?
  def manufacturer
    @manufacturer ||= load_data.first.manufacturer
  end

  def method_missing(method, *args, &block)
    filter = method.to_s
    if @filters.include? filter
      instance_variable_get("@#{filter}") || instance_variable_set("@#{filter}", filter.camelcase.constantize.find(@filter_ids[@filters.index(filter)]))
    else
      raise NoMethodError, "undefined method `#{method}' for #{self}"
    end
  end
end
