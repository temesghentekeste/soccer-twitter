module PagesHelper
  def user_avatar(user_id)
    user = User.find(user_id)
    if user.photo.attached?
      image_tag user.photo, class: 'profile-photo'
    else
      image_tag 'default_user_photo.png', class: 'profile-photo'
    end
  end

  def user_banner(user_id)
    user = User.find(user_id)
    if user.cover_image.attached?
      image_tag user.cover_image, class: 'cover-image'
    else
      image_tag 'default_cover_image.jpeg', class: 'cover-image'
    end
  end

  def followers(user)
    if user.followers.count > 0
      render 'pages/followers', user: user
    else
      render 'pages/no_followers'
    end
  end

  def followings(user)
    if user.following.count > 0
      render 'pages/followings', user: user
    else
      render 'pages/no_followings'
    end
  end

  def follow_user_action(user)
    if user != current_user
      render 'pages/follow_user', user: user
    
    end
  end
end
