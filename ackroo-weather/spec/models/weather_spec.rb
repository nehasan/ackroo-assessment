require 'rails_helper'

RSpec.describe Weather, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it 'should create a new weather.' do
    weather = Weather.create!(
      time: Time.now.utc,
      air_temp: '43.21',
      pressure: '34.32',
      humidity: '56.87',
      precipitation: '38.34',
      wind_speed: '76.98'
    )

    expect(weather.present?).to eq(true)
  end
end
