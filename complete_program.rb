# hard code data from the csv file into the structure

rideshare = [
  # DR0001
  {
    id: "DR0001",
    date: [ "Feb 3, 2016", "Feb 3, 2016", "Feb 5, 2016" ],
    fares: [ 10, 30, 45 ],
    ratings: [ 3, 4, 2 ],
    riders: [ "RD003", "RD0015", "RD002" ]
  },
  # DR0002
  {
    id: "DR0002",
    date: [ "Feb 3, 2016", "Feb 4, 2016", "Feb 5, 2016" ],
    fares: [ 25, 15, 35 ],
    ratings: [ 5, 1, 3],
    riders: [ "RD0073", "RD0013", "RD0066"]
  },
  # DR0003
  {
    id: "DR0003",
    date: [ "Feb 4, 2016", "Feb 5, 2016" ],
    fares: [ 5, 50 ],
    ratings: [ 5, 2 ],
    riders: [ "RD0066", "RD0003" ]
  },
  # DR0004
  {
    id: "DR0004",
    date: [ "Feb 3, 2016", "Feb 4, 2016", "Feb 5, 2016" ],
    fares: [ 5, 10, 20 ],
    ratings: [ 5, 4, 5 ],
    riders: [ "RD0022", "RD0022", "RD0073" ]
  }
]

# Iterate through the data structure to display, by printing in terminal, the following info:
# The number of rides each driver has given
def rides_given(arr_rideshare)
  rides_by_driver = arr_rideshare.map do | hashes |
    sentence_string = "Driver with ID ##{hashes[:id]} gave a total of  #{hashes[:date].count} rides"
  end
  return rides_by_driver
end

# The total amount of money each driver has made
def driver_payday(arr_rideshare)
  driver_mula = arr_rideshare.map do | hashes |
    sentence_string = "Driver with ID ##{hashes[:id]} made $#{hashes[:fares].sum}.00"
  end
  return driver_mula
end

# Define average
def find_average(array)
  average = array.sum  /  array.count
  return average
end

# The average rating for each driver
def driver_rating(arr_rideshare)
  driver_ratings = arr_rideshare.map do | hashes |
    sentence_string = "Driver with ID ##{hashes[:id]} has an average rating of #{find_average(hashes[:ratings])}"
  end
  return driver_ratings
end

# Most money methods
# Find max money made from all the drivers
def find_max(arr_rideshare)
  driver_fares = arr_rideshare.map do | hashes |
    fare_sum = hashes[:fares].sum
  end
  max_moneymaker = driver_fares.max
  return max_moneymaker
end

# Match individual sums to max, store a variable containing a sentence for max sum in an array (accounts for potential ties in the future)
def find_biggest_payday(arr_rideshare)
  most_money = arr_rideshare.map do | hashes |
    if hashes[:fares].sum == find_max(arr_rideshare)
      string_sentence = "Driver with ID ##{hashes[:id]} had the biggest payday."
    end
  end
  return most_money
end

# Highest rating methods
# Use find_average defined above to find the highest of all ratings
def find_highest_rating(arr_rideshare)
  driver_ratings = arr_rideshare.map do | hashes |
    average_rating = find_average(hashes[:ratings])
  end
  highest_rating = driver_ratings.max
  return highest_rating
end

# Match individual averages to max average, store variable containing sentence for highest and store in an array (accounts for potential ties in the future)
def find_best_rated(arr_rideshare)
  superstar_drivers = arr_rideshare.map do | hashes |
    if find_average(hashes[:ratings]) == find_highest_rating(arr_rideshare)
      string_sentence = "Driver with ID ##{hashes[:id]} had the highest average rating"
    end
  end
  return superstar_drivers
end

# Total rides print outs
driver_rides = rides_given(rideshare)
puts driver_rides

# Total money print outs
driver_money = driver_payday(rideshare)
puts driver_money

# Ratings average pring outs
driver_ratings = driver_rating(rideshare)
puts driver_ratings

# Most money print outs
most_money = find_biggest_payday(rideshare)
puts most_money

# Highest average rating print outs
highest_rated = find_best_rated(rideshare)
puts highest_rated
