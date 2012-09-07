module UsersHelper

  def gravatar_for(user)
    gravatar_url = Gravatar.new("#{user.email}").image_url(s: 30)
    image_tag(gravatar_url, alt: user.name, class: 'gravatar')
  end
end
