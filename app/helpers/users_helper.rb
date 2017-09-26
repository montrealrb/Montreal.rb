# frozen_string_literal: true

module UsersHelper
  def avatar_for(member, size: 200, html: {})
    return if member.nil? || member.email.blank?
    if member.picture.present?
      return image_tag(member.picture, html.merge(alt: member.name, width: size))
    end
    gravatar_for(member, size: size, html: html)
  end

  def gravatar_for(member, size: 200, html: {})
    return if member.email.blank?
    gravatar_id = Digest::MD5.hexdigest(member.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, html.merge(alt: member.name))
  end
end
