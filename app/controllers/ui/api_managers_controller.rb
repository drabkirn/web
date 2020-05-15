class Ui::ApiManagersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_variables
  before_action :require_scope_param
  before_action :validate_scope_param
  before_action :require_new_api_scope_request

  def new_request
    scope_index = @valid_scopes.find_index(@scope_param)

    if current_user.api_manager
      api_manager = current_user.api_manager
    else
      api_manager = ApiManager.new
      api_manager.user = current_user
    end
    api_manager.scopes[scope_index] = @scope_param
    api_manager.api_counts[scope_index] = 0
    if api_manager.save
      redirect_to dashboard_path, notice: Message.success_enable_api_scope(@scope_param)
    else
      redirect_to dashboard_path, alert: api_manager.errors.full_messages
    end
  end

  private
    def set_variables
      @scope_param = params[:scope]
      @valid_scopes = ApiManager.valid_scopes_array
    end

    def require_scope_param
      unless @scope_param.present?
        redirect_to dashboard_path, alert: Message.exception_missing_scope_param
        return
      end
    end

    def validate_scope_param
      unless @valid_scopes.include?(@scope_param)
        redirect_to dashboard_path, alert: Message.error_wrong_scope_param(@scope_param)
        return
      end
    end

    def require_new_api_scope_request
      @scope_param = params[:scope]
      if current_user.api_manager && current_user.api_manager.scopes.include?(@scope_param)
        redirect_to dashboard_path, alert: Message.error_already_enabled_scope(@scope_param)
        return
      end
    end
end
