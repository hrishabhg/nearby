class Api::UsersController < Api::ApiController

  before_action :authenticate_user!
  skip_before_action :authenticate_user!, :only => [:new]

  respond_to :json
  def index
    render :json => {:success => true}
  end

  def show

  end

  def new
    args = require_params
    if args[:password] != args[:password_confirm]
      render :json => {
          :error => true,
          :message => {
              :password => 'does not match'
          }
      }, :status => 400
      return
    end
    user = User.new(
        :first_name => args[:first_name],
        :last_name => args[:last_name],
        :username => args[:email]
    )
    user_password = user.user_identities.new(
        :hash_string => args[:password],
        :adapter => UserIdentity.adapters[:password]
    )
  end

  private
  def require_params
    params.require(:user).permit(:email, :password, :password_confirm, :first_name, :last_name)
  end

end
