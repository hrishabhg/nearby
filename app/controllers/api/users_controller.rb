class Api::UsersController < Api::ApiController

  before_action :authenticate_user!

  respond_to :json
  def index
    render :json => {:success => true}
  end

end
