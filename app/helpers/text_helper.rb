module TextHelper
  @renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                      autolink: true, tables: true)
  class << self
    attr_reader :renderer
  end

  def render_markdown_as_html(markup)
    raw(TextHelper.renderer.render(markup))
  end
end
