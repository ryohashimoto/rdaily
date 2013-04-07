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
end
