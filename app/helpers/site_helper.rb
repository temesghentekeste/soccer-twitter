module SiteHelper
  def flash_message(name)
    if name == 'notice'
      render 'layouts/notice'
    elsif name == 'alert'
      render 'layouts/alert'
    end
  end

  def blank_tweet(name, msg)
    msg = "Your soccer tweet can't be blank" if name == 'alert' && msg[0] == "Text can't be blank"
    msg
  end

  def render_flash_message(name, msg)
    render 'layouts/flash_message', { name: name, msg: msg } if msg.is_a?(String)
  end

  def guest_carousel
    render 'guest_carousel' if controller_name == 'pages'
  end

  def render_welcome
    render 'welcome' if user_signed_in?
  end
end
