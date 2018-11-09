# frozen_string_literal: true

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
          image_tag("emoji/#{emoji.image_filename}", alt: name, class: "emoji")
        else
          match
        end
      end.html_safe
    else
      ""
    end
  end
end
