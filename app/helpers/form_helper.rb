module FormHelper

  def form(model = nil, **options, &proc)
    options[:builder] = options[:builder] || FormBuilder
    options.add_data controller: 'validate'

    if model.is_a?(String)
      options[:url] ||= model
    else
      options[:model] ||= model
    end

    form_with **options, &proc
  end

end
