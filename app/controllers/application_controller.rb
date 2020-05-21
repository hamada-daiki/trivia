class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  
 def after_sign_in_path_for(resource)
   posts_path # ログイン後に遷移するpathを設定
 end

 def after_sign_out_path_for(resource)
   new_user_session_path # ログアウト後に遷移するpathを設定
 end

 def after_sign_up_path_for(resource)
   edit_profile_path(current_user.id)  #sign_up後に遷移するpathを設置
 end

 def after_inactive_sign_up_path_for(resource)
   edit_profile_path(current_user.id)  #sign_up後に遷移するpathを設置
 end

 protected

 def configure_permitted_parameters
  added_attrs = [ :email, :username, :password, :password_confirmation ]
  devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
  devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image])
  devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image])
 end

end
