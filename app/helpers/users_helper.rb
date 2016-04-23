module UsersHelper
  def gravatar_for(user, size: 200, html: {})
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, html.merge(alt: user.name))
  end
end
