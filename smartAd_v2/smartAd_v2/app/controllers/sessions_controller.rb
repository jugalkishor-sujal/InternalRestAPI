class SessionsController < ::Devise::SessionsController
  layout "sign_in"
  # the rest is inherited, so it should work
  
  def new
    super
  end

  def create
    self.resource = warden.authenticate!(auth_options)
      set_flash_message(:notice, :signed_in) if is_navigational_format?
      sign_in(resource_name, resource)
      if !session[:return_to].blank?
        redirect_to session[:return_to]
        session[:return_to] = nil
      else
        respond_with resource, :location => after_sign_in_path_for(resource)
      end
  end
  
  def after_sign_in_path_for(resource)
    if resource.user_type.id == 1
      root_path
    else
      bidder_root_path
    end
  end
end