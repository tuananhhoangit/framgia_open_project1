module UsersHelper
  def avatar_for user, options = {size: Settings.user.avatar_max_size}
    avatar_id = Digest::MD5::hexdigest user.email.downcase
    size = options[:size]
    avatar_url = Settings.user.avatar_url
    image_tag avatar_url, alt: user.name, class: "avatar"
  end
end
