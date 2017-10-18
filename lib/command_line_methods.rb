require 'pry'
def welcome
  puts "Welcome! Would you like to search by (Z)ipcode or (C)ity?"
end

def get_user_input
  gets.chomp
end

def today_or_tomorrow
  puts "Okay, would you like to see (T)oday's weather or to(M)orrow's?"
end

def enter_zipcode
  puts "Please enter a zipcode"
end

def enter_city_state
  puts "Please enter City, State"
end

def parse_city_state(answer)
  response = answer.split(", ")
end

def body
  answer = get_user_input
  if answer == 'Z'
    today_or_tomorrow
    answer = get_user_input
    if answer == "T"
      enter_zipcode
      zipcode = get_user_input
      array = get_city_hash_by_zip(zipcode)
      get_todays_weather_by_zip(array, zipcode)
    elsif answer == "M"
      enter_zipcode
      zipcode = get_user_input
      array = get_city_hash_by_zip(zipcode)
      get_tomorrows_weather_by_zip(array, zipcode)
    else
      puts "Invalid Input"
    end
  elsif answer == 'C'
    today_or_tomorrow
    answer = get_user_input
    if answer == 'T'
      enter_city_state
      response = get_user_input
      parsed = parse_city_state(response)
      array = get_city_hash_by_name(parsed)
      get_todays_weather(array, parsed)
    elsif answer == 'M'
      enter_city_state
      response = get_user_input
      parsed = parse_city_state(response)
      array = get_city_hash_by_name(parsed)
      get_tomorrows_weather(array, parsed)
    else
      puts "Invalid Input."
    end
  else
    puts "Invalid Input."
  end
end

def none_found
  puts "Nothing found."
end
