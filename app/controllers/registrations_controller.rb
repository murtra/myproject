class RegistrationsController < Devise::RegistrationsController

	def update
		account_update_params = devise_parameter_sanitizer.sanitize(:account_update)
    @user = User.find(current_user.id)

        successfully_updated = if account_update_params[:password].blank?
           # account_update_params.delete("password")
           # account_update_params.delete("password_confirmation")
           params[:user].delete(:current_password)
           @user.update_without_password(devise_parameter_sanitizer.sanitize(:account_update))
         else
           @user.update_with_password(devise_parameter_sanitizer.sanitize(:account_update))
         end

         if successfully_updated
            set_flash_message :notice, :updated
            sign_in @user, :bypass => true
            redirect_to @user
         else
            render "edit"
         end
        

	end



protected


  def after_sign_up_path_for(resource)
    '/'
  end


end
