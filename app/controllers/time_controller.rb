class TimeController < ActionController::API
  include MqttBroker

  def publish_time_mqtt
    publish_mqtt('uri/sistemas-distribuidos/time', 'two ' + params[:time].to_s)
  end

  def get_time
    debugger
    if Timer.any?
      render json: Timer.last.time
    else
      render json: Time.now
    end
  end
end
