class MqttSubscribeJob < ApplicationJob
  require 'rubygems'
  require 'mqtt'

  queue_as :critical

  def perform(*_args)
    MQTT::Client.connect('iot.eclipse.org', 1883) do |_client|
      # If you pass a block to the get method, then it will loop
      _client.get('uri/sistemas-distribuidos/new-time') do |_topic, message|
        # Realiza um subscribe no tópico comum, e a cada novo time defenido pelo server
        # Insere um novo registro n a tabela Timer, com o horario atualizado
        puts "horario atualizado: #{message}"
        Timer.create!(time: message)
      end
    end
  end
end
