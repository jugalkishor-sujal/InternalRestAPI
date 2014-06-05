module PortalModule
  
  def self.included(base)
    base.before_action :authenticate_user!
    
    base.layout "dashboard"
    #I18n.default_locale = :en
  end
end