module TextHelper
  def render_markdown_as_html(markup)
    markup ||= ""
    md_renderer.render(emojify(markup)).html_safe
  end

  private

  def md_renderer
    @renderer ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                          autolink: true, tables: true)
  end

  def emojify(content)
    if content.present?
      h(content).to_str.gsub(/:(\w[\s\_\w]*?):/) do |match|
        name = $1.tr(" ", "_").downcase
        if emoji = Emoji.find_by_alias(name)
          %(<img alt="#{name}" src="#{image_path("emoji/#{emoji.image_filename}")}" class="emoji" />)
        else
          match
        end
      end.html_safe
    else
      ""
    end
  end
end
