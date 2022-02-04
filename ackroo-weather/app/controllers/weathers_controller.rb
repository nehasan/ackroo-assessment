class WeathersController < ApplicationController
  def latest
    weather = Weather.last
    # raise StandardError, 'Some error happened! Try later.'
    unless weather.nil? || weather.time.to_i < 1.hour.ago.to_i
      ws = WeatherService.new
      weather = ws.fetch_data
    end

    @data = { weather: weather }

  rescue StandardError => e
    flash['alert'] = e.message
    weather = Weather.last
    @data = { weather: weather }
  end
end
