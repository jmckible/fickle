class Hash

  # sets :class to css_class, unless the
  # hash already has that key. If it does, css_class
  # is appended to :class
  def add_class(css_class)
    store :class, "#{delete(:class)} #{css_class}"
    self
  end

  def selected_if(condition)
    add_class('selected') if condition
    self
  end

  # For adding data-attributes with less typing. Pass in a hash.
  # Creates a :data hash in this hash if none existed.
  # Copies or appends the value value of each key in the passed hash to the :data hash.
  def add_data(data_to_add)
    data = fetch(:data, {}) # what the what?
    store(:data, data.merge(data_to_add){|_key, existing, to_merge| "#{existing} #{to_merge}" })
    self
  end

end
