class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: %i[
        firstname
        lastname
        email
        password
        password_confirmation
        phone_number
        county
        sub_county
      ]
    )
  end
end
