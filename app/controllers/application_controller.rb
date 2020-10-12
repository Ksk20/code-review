class ApplicationController < ActionController::Base

	before_action :configure_permitted_parameters, if: :devise_controller?

	protected
	#サインイン後の遷移先指定
	def after_sign_in_path_for(resource)
		home_path
	end
    #サインアップ後の遷移先指定
    def after_sign_up_path_for(resource)
    　home_path
    end
    #ログアウト後の遷移先指定
    def after_sign_out_path_for(resource)
      home_path
    end

	def configure_permitted_parameters
       	devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
 	end
end
