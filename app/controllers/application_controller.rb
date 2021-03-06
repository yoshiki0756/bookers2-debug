class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:about, :top]
	before_action :configure_permitted_parameters, if: :devise_controller?

protected
  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def configure_permitted_parameters
  # devise_parameter_sanitizer.permit(:sign_up, keys: [:email])
  # 	jpostal.jpとgem jp_prefecture
   devise_parameter_sanitizer.permit(:sign_up, keys:[
     :email,
     :name,
     :postal_code,
     :prefecture_name,
     :address_city,
     :address_street
     ])
     devise_parameter_sanitizer.permit(:sign_in, keys: [:name]) # ログイン時はnameを使用
  end
end