module ApplicationHelper
  def rdaily_title(title)
    'Rdaily - ' + title
  end
  
  def abbrev(text, max=100)
    if text.length >= max
      simple_format(text[0..max-1] + '...')
    else
      simple_format(text)
    end
  end

  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
    :autolink => true, :space_after_headers => true)
    markdown.render(text).html_safe
  end
end
