module ApplicationHelper
  class PygmentsRenderer < Redcarpet::Render::HTML
    def block_code(code, language)
      Pygments.highlight(code, lexer: language)
    end
  end
  
  def parent_layout(layout)
    @view_flow.set(:layout, output_buffer)
    self.output_buffer = render(:file => "layouts/#{layout}")
  end
  
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
    renderer = PygmentsRenderer.new(hard_wrap: true, filter_html: true)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true
    }
    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end
end
