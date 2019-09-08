module FormHelper

  def form(model_or_path, options = {}, &proc)
    options[:builder] = options[:builder] || FormBuilder
    options.add_data controller: 'validate'

    if model_or_path.is_a?(Hash)
      options = options.merge(model_or_path)
    else
      options[:url] = model_or_path
      options[:model] = model_or_path unless options[:url].is_a?(String)
    end

    form_with options, &proc
  end

end
