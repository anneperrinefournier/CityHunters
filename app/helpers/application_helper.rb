module ApplicationHelper
  def small_caps_text(text)
    content_tag(:span, text, class: 'small-caps')
  end
end
