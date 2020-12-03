module SiteHelper
  
  def flash_message(name)
    if name == 'notice'
      render 'layouts/notice'
    elsif name == 'alert'
      render 'layouts/alert'
    end
  end
end
