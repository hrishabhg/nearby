class Api::ApiController < ApplicationController
  before_action :authenticate_user!

  respond_to :json
  rescue_from AbstractController::ActionNotFound, with: :resource_not_found
  rescue_from ActionController::ParameterMissing, with: :param_not_found

  protected
  def authenticate_user!
    authenticate_token || render_unauthorized
  end

  def authenticate_token
    authenticate_with_http_token do |token, options|
      User.includes(:user_identities).where({
                                                :user_identities => {
                                                    :hash_string => token,
                                                    :adapter => UserIdentity.adapters[:auth_token]
                                                }
                                            }).first
    end
  end

  def render_unauthorized
    self.headers['WWW-Authenticate'] = 'Token realm="Application"'
    render json: { :message => 'Bad credentials', :status => 401 }, status: 401
  end

  def resource_not_found
    render json: {:message => 'Invalid Resource', :status => 404}, status: 404
  end

  def param_not_found(e)
    render json: {:message => e.message, :status => 400}, status: 400
  end

end
