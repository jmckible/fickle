module ContentHelper

  # These methods are for more easily making a tag from within a helper method.
  # Instead of content_tag(:div), do div_tag(), etc. Add more tags here as needed.
  %i[div h1 h2 h3 h4 h5 h6 p span].each do |tag|
    define_method "#{tag}_tag" do |content_or_options_with_block = nil, options = nil, escape = true, &block|
      content_tag tag, content_or_options_with_block, options, escape, &block
    end
  end

end
