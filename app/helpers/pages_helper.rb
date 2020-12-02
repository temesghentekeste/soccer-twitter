module PagesHelper
  def user_avatar(user_id)
    user = User.find(user_id)
    if user.photo.attached?
      image_tag user.photo, class: 'profile-photo'
    else
      image_tag 'default_user_photo.png', class: 'profile-photo'
    end
  end
end
