class ApplicationController < ActionController::Base
  before_action :set_redirect_path, unless: :user_signed_in?
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!
  include Pundit::Authorization

  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:photo, :name])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:photo, :name])
  end

  # redirect after sign in or sign up
  def set_redirect_path
    @redirect_path = request.path
  end

  # Override a Devise method
  def after_sign_in_path_for(resource)
    if session[:chosen_storyline_id].present?
      chosen_storyline_id = session.delete(:chosen_storyline_id)
      storyline_path(chosen_storyline_id)
    elsif params[:redirect_to].present?
      store_location_for(resource, params[:redirect_to])
    elsif request.referer == new_user_session_url
      super
    else
      stored_location_for(resource) || request.referer || root_path
    end
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end
end
