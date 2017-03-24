# frozen_string_literal: true
module UsersHelper
  def gravatar_for(member, size: 200, html: {})
    return if member.nil?
    gravatar_id = Digest::MD5.hexdigest(member.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, html.merge(alt: member.name))
  end
end
