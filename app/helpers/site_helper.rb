module SiteHelper
  def landing_page
    if user_signed_in? 
      controller.redirect_to welcome_path
    else 
      render '/pages/guest_welcome'
    end 
  end

  def homepage_actions
    if user_signed_in?
      render 'shared/member_homepage_actions'
    else
      render 'shared/guest_homepage_actions'
    end
  end
end
