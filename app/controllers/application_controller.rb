class ApplicationController < ActionController::API

  def current_user
    token = request.headers['Auth-Token']
    begin
      user_id = JWT.decode(token,ENV['SUPER_SECRET_KEY'])[0]["user_id"]
      return User.find_by(id: user_id)
    rescue
      nil
    end
  end

  def authenticate
    unless current_user
      return nil
    end
  end

end
