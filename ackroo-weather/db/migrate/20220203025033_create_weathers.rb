class CreateWeathers < ActiveRecord::Migration[6.1]
  def change
    create_table :weathers do |t|
      t.datetime :time
      t.string :air_temp
      t.string :pressure
      t.string :humidity
      t.string :precipitation
      t.string :wind_speed

      t.timestamps
    end
  end
end
