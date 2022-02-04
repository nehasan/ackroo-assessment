require 'rails_helper'

RSpec.feature "Weathers", type: :feature do
  # pending "add some scenarios (or delete) #{__FILE__}"
  it 'displays latest weather report' do
    weather = Weather.last
    expect(weather.present?).to eq(true)
  end

  it 'should fetch new weather report in case the \\
data is 1 hour older or no weather data is present in the database.' do
    weather = Weather.last
    unless weather.present? && weather.time.to_i > 1.hour.ago.to_i
      ws = WeatherService.new
      weather = ws.fetch_data
    end
    expect(weather.present?).to eq(true)
    expect(weather.time.to_i > 1.hour.ago).to eq(true)
  end

  it 'bla bla bla .. more testing' do
    visit latest_weathers_path
    expect(page).to have_text('Weather in current location')
  end
end
