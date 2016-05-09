module TextHelper
  def render_markdown_as_html(markup)
    simple_format md_renderer.render(markup)
  end

  private

  def md_renderer
    @renderer ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                      autolink: true, tables: true)
  end
end
