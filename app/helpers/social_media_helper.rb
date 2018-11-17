# frozen_string_literal: true
module SocialMediaHelper
  SOCIAL_MEDIA_DATA = {
    twitter: {
      url: "https://twitter.com/montrealrb",
      mention: "@montrealrb"
    },
    facebook: {
      url: "https://www.facebook.com/montrealrb",
      mention: "@Montreal.rb"
    },
    meetup: {
      url: "https://www.meetup.com/mtl-rb/",
      mention: "Montreal.rb"
    },
    youtube: {
      url: "https://www.youtube.com/channel/UCmq5nOaMp18rcljeFocUUqw",
      mention: "Montreal.rb"
    }
  }.freeze

  def social_media_link_for(type, with_icon: false)
    raise ArgumentError.new(argument_error_message(type)) unless SOCIAL_MEDIA_DATA.key? type

    if with_icon
      link_to(
        icon('fa', type.to_s, SOCIAL_MEDIA_DATA[type][:mention]),
        SOCIAL_MEDIA_DATA[type][:url], target: "_blank"
      )
    else
      link_to(
        SOCIAL_MEDIA_DATA[type][:mention],
        SOCIAL_MEDIA_DATA[type][:url], target: "_blank"
      )
    end
  end

  def argument_error_message(type)
    "Expected one of #{SOCIAL_MEDIA_DATA.keys} as first argument, got #{type.class}: #{type}"
  end
end
