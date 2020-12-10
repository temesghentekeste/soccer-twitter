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
end
