module EmojiHelper
  def emojify(content)
    h(content).to_str.gsub(/:([\w+\s-]+):/) do |match|
      name = $1.tr(" ", "_").downcase
      if emoji = Emoji.find_by_alias(name)
        %(<img alt="#{name}" src="#{image_path("emoji/#{emoji.image_filename}")}" style="vertical-align:middle" width="20" height="20" />)
      else
        match
      end
    end.html_safe if content.present?
  end
end
