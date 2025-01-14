# frozen_string_literal: true

class Public::Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    sign_out(current_admin) if current_admin
    super
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  
  #ログインしたときに移動させたい繊維石のパス
  #def after_sign_in_path_for(resource)
    #user_path(resource)
  #end
  
  #ログアウトしたときに移動させたい繊維石のパス
  #def after_sign_out_path_for(resource)
    #new_user_session_path
  #end
end
