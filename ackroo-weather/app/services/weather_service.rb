class WeatherService

  attr_reader :message

  def initialize(message = nil)
    @message = message
  end

  def fetch_data
    # Test purpose
    Weather.create(
      time: Time.now.utc,
      air_temp: '44.21',
      pressure: '54.32',
      humidity: '67.87',
      precipitation: '22.34',
      wind_speed: '45.00'
    )

    # Skipping this to avoid complexities
    #
    # uri = URI('https://api.stormglass.io/v2/weather/point')
    # req = Net::HTTP::Get.new(uri)
    # req['Authorization'] = ENV['STORMGLASS_API_KEY']
    # Rails.logger.info "--- API KEY: #{ENV['STORMGLASS_API_KEY']}"
    #
    # res = Net::HTTP.start(uri.hostname, uri.port) do |http|
    #   http.request(req)
    # end
    #
    # puts res.body
    # case res.status
    # when 200
    #   weather_data = JSON.parse(res)
    #   Weather.create(
    #     time: weather_data.hours[0]['timestamp'],
    #     air_temp: weather_data.hours[0]['air_temperature'],
    #     pressure: weather_data.hours[0]['pressure'],
    #     humidity: weather_data.hours[0]['humidity'],
    #     precipitation: weather_data.hours[0]['precipitation'],
    #     wind_speed: weather_data.hours[0]['wind_speed']
    #   )
    # else
    #   raise StandardError, 'API error fetching weather data! Try later.'
    # end
  rescue ActiveRecordError => e
    raise StandardError, 'API error fetching weather data! Try later.'
  end
end
