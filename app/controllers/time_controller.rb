class TimeController < ActionController::API
  def get_time
    render json: {time: Time.now}
  end
end
