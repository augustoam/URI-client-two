class TimeController < ActionController::API
  def get_time
    render json: {time: Time.now}
  end

  def set_time
    # debugger
    Timer.create!(time: params[:time])
    render json: :ok, status: :ok
  end
end
