module ApplicationHelper
  @@renderer = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)

  def render_markdown_as_html(markup)
    raw @@renderer.render(markup)
  end
end
