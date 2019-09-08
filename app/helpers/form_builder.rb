class FormBuilder < ActionView::Helpers::FormBuilder
  include ActionView::Helpers::TagHelper, ContentHelper

  delegate :content_tag, to: :@template

  def check_box(attribute, options = {})
    safe_join [
      super(attribute, options),
      label(attribute) { options[:label] },
      div_tag(options[:help])
    ]
  end

  def color_field(attribute, options = {})
    field_with_layout :color, attribute, options
  end

  def email_field(attribute, options = {})
    field_with_layout :email, attribute, options
  end

  def footer(label, options = {})
    content_tag :div, class: 'form-footer' do
      submit label, options
    end
  end

  def password_field(attribute, options = {})
    options[:minlength] ||= 8
    field_with_layout :password, attribute, options
  end

  def plain_field(type, attribute, options = {})
    method = type == :check_box ? type : "#{type}_field"
    ActionView::Helpers::FormBuilder.instance_method(method).bind(self).call(attribute, options)
  end

  def radio_button(attribute, value, options = {})
    safe_join [
      super(attribute, value, options),
      label("#{attribute}_#{value}") { options[:label] || value},
      div_tag(options[:help])
    ]
  end

  def range(attribute, options = {})
    field_with_layout :range, attribute, options
  end

  def rich_text_field(attribute, options = {})
    super attribute, options
  end

  def text_field(attribute, options = {})
    field_with_layout :text, attribute, options
  end

  def toggle(attribute, options = {})
    switch_span = span_tag class:'toggle-switch' do
      safe_join [
        span_tag('Yes', class:'on'),
        span_tag('No', class:'off')
      ]
    end
    label_text      = options.delete(:label)
    options[:label] = nil
    content_tag :div, class: 'form-field toggle-container' do
      safe_join [
        plain_field(:check_box, attribute),
        label(attribute, safe_join([switch_span, label_text]))
      ]
    end
  end

  private

  def extract_label(attribute, text)
    label attribute, text, class: 'field-label'
  end

  def extract_help(text)
    tag.span text, class: 'field-help'
  end

  def extract_error(attribute)
    error_message = object.errors[attribute].first.humanize if has_error?(attribute)
    tag.span error_message, class: 'field-error'
  end

  def has_error?(attribute)
    object && object.errors[attribute].present?
  end

  def field_with_layout(type, attribute, options)
    placeholder = options[:placeholder] || options[:label]
    label_span =  extract_label attribute, options.delete(:label)
    optional   =  options.delete(:optional)
    help_text  =  options.delete(:help) || ('Optional' if optional)
    help_span  =  extract_help  help_text
    error_span =  extract_error attribute

    wrapper_options = { class: 'form-field' }
    wrapper_options.add_class('has-error') if has_error?(attribute)

    options[:required]    = true unless optional
    options[:placeholder] = placeholder

    div_tag wrapper_options do
      safe_join [
        plain_field(type, attribute, options),
        label_span,
        help_span,
        error_span
      ]
    end
  end

end
