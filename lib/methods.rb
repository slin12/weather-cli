require 'pry'
require 'wunderground'

def api
  Wunderground.new("ec19493502066426")
end

def new_york_weather
  city_hash = api.forecast_for("NY", "New York City")
  array = city_hash["forecast"]["txt_forecast"]["forecastday"]
  get_todays_weather(array, ["New York", "NY"])
end

def get_city_hash_by_name(city_state_hash)
  city = city_state_hash[0]
  state = city_state_hash[1]
  city_hash = api.forecast_for("#{state}", "#{city}")
  array = city_hash["forecast"]["txt_forecast"]["forecastday"]
end

def get_city_hash_by_zip(zipcode)
  city_hash = api.forecast_for(zipcode)
  array = city_hash["forecast"]["txt_forecast"]["forecastday"]
end

def get_todays_weather(array, parsed)
  forecast_text = array[0]["fcttext"]
  emoji = emojis(forecast_text)
  puts "#{emoji} The current forecast for #{parsed[0]}, #{parsed[1]} is: #{forecast_text}."
end

def get_todays_weather_by_zip(array, zipcode)
  forecast_text = array[0]["fcttext"]
  emoji = emojis(forecast_text)
  puts "#{emoji} The current forecast for #{zipcode} is: #{forecast_text}."
end

def get_tomorrows_weather(array, parsed)
  forecast_text = array[2]["fcttext"]
  emoji = emojis(forecast_text)
  puts "#{emoji} Tomorrow's forecast for #{parsed[0]}, #{parsed[1]} is: #{forecast_text}."
end

def get_tomorrows_weather_by_zip(array, zipcode)
  forecast_text = array[2]["fcttext"]
  emoji = emojis(forecast_text)
  puts "#{emoji} Tomorrow's forecast for #{zipcode} is: #{forecast_text}."
end

def emojis(string)
  string.downcase.include?("sunny")
    return "\u{1F31E}"
  string.downcase.include?("cloud")
    return "\u{26C5}"
  string.downcase.include?("storm")
    return "\u{26C8}"
  string.downcase.include?("rain")
    return "\u{1F327}"
end
