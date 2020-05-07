class Ui::Users::RegistrationsController < Devise::RegistrationsController
  include ApplicationHelper

  protected
    def update_resource(resource, params)
      if omniauth_providers_array.include? resource.provider
        params.delete("current_password")
        resource.update_without_password(params)
      else
        resource.update_with_password(params)
      end
    end

    def after_update_path_for(resource)
      dashboard_path
    end
end