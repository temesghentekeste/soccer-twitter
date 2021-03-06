module PagesHelper
  def user_avatar(user_id)
    user = User.find(user_id)
    if user.photo.attached?
      render 'shared/profile_info', user: user
    else
      image_tag 'default_user_photo.png', class: 'profile-photo'
    end
  end

  def user_banner(user_id)
    user = User.find(user_id)
    if user.cover_image.attached?
      render 'shared/profile_cover_image', user: user

    else
      image_tag 'default_cover_image.jpeg', class: 'cover-image'
    end
  end

  def followers(user)
    if user.followers.count.positive?
      render 'pages/followers', user: user
    else
      render 'pages/no_followers'
    end
  end

  def followings(user)
    if user.following.count.positive?
      render 'pages/followings', user: user
    else
      render 'pages/no_followings'
    end
  end

  def follow_user_action(user)
    followings = current_user.following
    if user != current_user && !followings.include?(user)
      render 'pages/follow_user', user: user
    elsif followings.include? user
      following = Following.find_by(follower_id: current_user.id, followed_id: @user.id)
      render 'pages/unfollow_user', { user: user, following: following }
    end
  end

  def following_profile(user)
    'tweet-form_following' unless user == current_user
  end

  def opinion_profile(user)
    'opinion-body_profile' if user == current_user
  end
end
