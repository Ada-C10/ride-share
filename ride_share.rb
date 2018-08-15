# Semret Nicodimos
# Ride Share Program
# 8/10/2018

# Data structure of informaiton from csv file and manually entering values
# Structure includes one big array to house each trip and multiple hashes to store each trips informaiton

trips = [
  {:driver=> 'DR0004',
    :date => 02/3/2016,
    :rider => "RD0022",
    :cost => 5,
    :rating => 5
  },
  {:driver=> 'DR0001',
    :date => 02/3/2016,
    :rider => 'RD0003',
    :cost => 10,
    :rating => 3
  },
  {:driver=> 'DR0002',
    :date => 02/3/2016,
    :rider => 'RD0073',
    :cost => 25,
    :rating => 5
  },
  {:driver=> 'DR0001',
    :date => 02/3/2016,
    :rider => 'RD0015',
    :cost => 30,
    :rating => 4
  },
  {:driver=> 'DR0003',
    :date => 02/4/2016,
    :rider => 'RD0066',
    :cost => 5,
    :rating => 5
  },
  {:driver=> 'DR0004',
    :date => 02/4/2016,
    :rider => 'RD0022',
    :cost => 10,
    :rating => 4
  },
  {:driver=> 'DR0002',
    :date => 02/4/2016,
    :rider => 'RD0013',
    :cost => 15,
    :rating => 1
  },
  {:driver=> 'DR0003',
    :date => 02/5/2016,
    :rider => 'RD0003',
    :cost => 50,
    :rating => 2
  },
  {:driver=> 'DR0002',
    :date => 02/5/2016,
    :rider => 'RD0066',
    :cost => 35,
    :rating => 3
  },
  {:driver=> 'DR0004',
    :date => 02/5/2016,
    :rider => 'RD0073',
    :cost => 20,
    :rating => 5
  },
  {:driver=> 'DR0001',
    :date => 02/5/2016,
    :rider => 'RD0003',
    :cost => 45,
    :rating => 2
  }
]

# The number of rides each driver has given
# Create a new hash with key of each drivers id
ride_counts = {
  DR0001: 0,
  DR0002: 0,
  DR0003: 0,
  DR0004: 0
}

# Loop going thur the trip array and calculating the number of rides
trips.each do |trip|
  driver_id = trip[:driver]

  if driver_id == "DR0001"
    ride_counts[:DR0001] += 1
  elsif driver_id == "DR0002"
    ride_counts[:DR0002] += 1
  elsif driver_id == "DR0003"
    ride_counts[:DR0003] += 1
  elsif driver_id == "DR0004"
    ride_counts[:DR0004] += 1
  end
end

puts "Number of trips for each driver: ##{ride_counts}"


# The total amount of money each driver has made
# Create a new hash for capturing the amount of money each driver made
rides_cost = {
  DR0001: 0,
  DR0002: 0,
  DR0003: 0,
  DR0004: 0
}

# Loop to add all the values of money for each driver
trips.each do |trip|
  driver_id = trip[:driver]
  driver_cost = trip[:cost]

  if driver_id == "DR0001"
    rides_cost[:DR0001] += driver_cost
  elsif driver_id == "DR0002"
    rides_cost[:DR0002] += driver_cost
  elsif driver_id == "DR0003"
    rides_cost[:DR0003] += driver_cost
  elsif driver_id == "DR0004"
    rides_cost[:DR0004] += driver_cost
  end
end

puts "Amount of money made by each driver: #{rides_cost}"


# The average rating for each driver
# create two new hahes, one for capturing sum of all ratings and other the average rating value
sum_rating = {
  DR0001: 0,
  DR0002: 0,
  DR0003: 0,
  DR0004: 0
}

average_rating = {
  DR0001: 0,
  DR0002: 0,
  DR0003: 0,
  DR0004: 0
}

# Loop through orignal array to aggregate both the sum of the ratings for each driver
# Utilized the count hash from question 1 to calculate avarage rating
trips.each do |trip|
  driver_id = trip[:driver]
  driver_rating = trip[:rating]


  if driver_id == "DR0001"
    sum_rating[:DR0001] += driver_rating
    average_rating[:DR0001] = (sum_rating[:DR0001]/ride_counts[:DR0001])
  elsif driver_id == "DR0002"
    driver_id == "DR0002"
    sum_rating[:DR0002] += driver_rating
    average_rating[:DR0002] = (sum_rating[:DR0002]/ride_counts[:DR0002])
  elsif driver_id == "DR0003"
    driver_id == "DR0003"
    sum_rating[:DR0003] += driver_rating
    average_rating[:DR0003] = (sum_rating[:DR0003]/ride_counts[:DR0003])
  elsif driver_id == "DR0004"
    sum_rating[:DR0004] += driver_rating
    average_rating[:DR0004] = (sum_rating[:DR0004]/ride_counts[:DR0004])
  end
end

puts "Average rating: #{average_rating}"

# Which driver made the most money

puts "Driver with the most money: #{rides_cost.max_by{|k,v| v}}"

# Which driver has the highest average rating

puts "Driver with the highest average rating: #{average_rating.max_by{|k,v| v}}"
