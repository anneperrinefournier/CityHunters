module ApplicationHelper
  def small_caps_text(text)
    content_tag(:span, text, class: 'small-caps')
  end

  def log_in_options
    @redirect_path ? { redirect_to: @redirect_path } : {}
  end
end
