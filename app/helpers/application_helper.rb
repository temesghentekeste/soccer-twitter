module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def member_or_guest_homepage
    if user_signed_in?
      render '/pages/member_content'
    else
      render '/pages/guest_welcome'
    end
  end

  def member_or_guest_content
    if user_signed_in?
      render '/pages/home'
    else
      render '/pages/guest_content'
    end
  end

  def render_home
    render '/pages/home' if user_signed_in?
  end

  def active_class?(link_path)
    'active-link' if current_page?(link_path)
  end

  def font_weight?(link_path)
    'font-weight-bold' if current_page?(link_path)
  end

  def border_right?
    controller.controller_name == 'stats' ? '' : 'border-right'
  end

  def render_messages
    render 'layouts/messages' if !current_page?(home_path) && !user_signed_in?
  end

  def cloudinary_name
    ENV['CLOUD_NAME']
  end
end
