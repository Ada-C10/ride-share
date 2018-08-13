########################################################
# Step 1: Establish the layers - Write a list of the layers here
#It will we a has of all the rides broken up by Driver
# -hash with Keys = Driver ID's
# -the driver id keys will have an array of hashes
# -each hash will have the information of the ride --> date, cost, rider, rating

########################################################
# Step 2: Assign a data structure to each layer

  # Copy your list from above, and write what data structure each layer should have
########################################################
# Step 3: Make the data structure!

drivers = {
  DR0001: [
    {Date: "3rd Feb 2016",
      Cost: 10,
      Rider_id: "RD0003",
      Rating: 3
    },
    {
      Date: "3rd Feb 2016",
      Cost: 30,
      Rider_id: "RD0015",
      Rating: 4
    },
    {
      Date: "5th Feb 2016",
      Cost: 45,
      Rider_id: "RD0003",
      Rating: 2
    }
  ],
  DR0002: [
    {
      Date: "3rd Feb 2016",
      Cost: 25,
      Rider_id: "RD0073",
      Rating: 5
    },
    {
      Date: "5th Feb 2016",
      Cost: 35,
      Rider_id: "RD0066",
      Rating: 3
    },
    {
      Date: "4th Feb 2016",
      Cost: 15,
      Rider_id: "RD0013",
      Rating: 1
    }
  ],
  DR0003: [
    {
      Date: "4th Feb 2016",
      Cost: 5,
      Rider_id: "RD0066",
      Rating: 5
    },
    {
      Date: "5th Feb 2016",
      Cost: 50,
      Rider_id: "RD0003",
      Rating: 2
    }
  ],
  DR0004: [
    {
      Date: "3rd Feb 2016",
      Cost: 5,
      Rider_id: "RD0022",
      Rating: 5
    },
    {
      Date: "4th Feb 2016",
      Cost: 10,
      Rider_id: "RD0022",
      Rating: 4
    },
    {
      Date: "5th Feb 2016",
      Cost: 20,
      Rider_id: "RD0073",
      Rating: 5
    }
  ]
}

########################################################
# Step 4: Total Driver's Earnings and Number of Rides

  # Use an iteration block to print driver's total rides and money made
  # The number of rides each driver has given
  # The total amount of money each driver has made
  # The average rating for each driver
  # Which driver made the most money?
  # Which driver has the highest average rating?
  # For each driver, on which day did they make the most money?
#########################################################
#Method that sums all the values of a specific key for a driver
def sum_values (drivers, key)
  value_sum ={}
  drivers.each do |driver,rides|
    total = 0
    rides.each do |ride|
      total += ride[key]
    end
    value_sum[driver] = total
  end
  return value_sum
end

#Method that determines the max value in the hash and returns the key (Driver)
def max_value (hash)
  max_num = hash.values.max
  hash.each do |key, value|
    if value == max_num
      return key
    end
  end
end

#Counts how many rides each driver had
total_rides = {}
drivers.each do |driver,rides|
  total_rides[driver] = drivers[driver].count
end

#Total amount of money each driver made
money_made = sum_values(drivers, :Cost)

#Average rating per driver
rating_sum = sum_values(drivers, :Rating)
avg_ratings = {}
drivers.each do |driver, rides|
  #total_rides = drivers[driver].count
  avg_rating = (rating_sum[driver].to_f/total_rides[driver].to_f).round(2)
  avg_ratings[driver] = avg_rating
end

#Determine who made the most money by looping through hash of the drivers with the amount of money they made and seeing if it matches the max value
best_days = {}
drivers.each do |driver,rides|
  driver_hash = {}
  rides.each do |ride|
  date_key = ride[:Date]
    if driver_hash.has_key? date_key
      day_earned = driver_hash[date_key] + ride[:Cost]
      driver_hash[date_key]= day_earned
    elsif
      driver_hash[date_key] = ride[:Cost]
    end
  end
  best_days[driver] = max_value(driver_hash)
end

#Print out information about each driver
drivers.each do |driver, rides|
  puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  puts "#{driver}"
  puts "Total rides: #{drivers[driver].count} rides"
  puts "Total money made: $#{money_made[driver]}"
  puts "Average rating: #{avg_ratings[driver]}"
  puts "Day driver made the most money: #{best_days[driver]}"
end

puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts "Who made the most money?"
puts "#{max_value(money_made)} made the most money."

puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
puts "Which driver has the highest average rating?"
puts "#{max_value(avg_ratings)} has the highest rating."
