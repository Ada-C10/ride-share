# Jacquelyn Cheng
# Ada Cohort 10 Nodes: Week 1
# Rideshare Homework


# Step 1 & 2: Establish the layers and assign a data structure to each layer
# 1. Hash of drivers (key is driver_id)
# 2. Array of rides for each driver
# 3. Hash of ride data
#     -string (date)
#     -integer (cost)
#     -string (rider_id)
#     -integer (rating)


# Step 3: Make the data structure
lyft_drivers = {
            DR0001: [
                        {
                            date: "3rd Feb 2016",
                            cost: 10,
                            rider_id: "RD0003",
                            rating: 3
                        },
                        {
                            date: "3rd Feb 2016",
                            cost: 30,
                            rider_id: "RD0015",
                            rating: 4
                        },
                        {
                            date: "5th Feb 2016",
                            cost: 45,
                            rider_id: "RD0003",
                            rating: 2
                        }
                    ],
            DR0002: [
                        {
                            date: "3rd Feb 2016",
                            cost: 25,
                            rider_id: "RD0073",
                            rating: 5
                        },
                        {
                            date: "4th Feb 2016",
                            cost: 15,
                            rider_id: "RD0013",
                            rating: 1
                        },
                        {
                            date: "5th Feb 2016",
                            cost: 35,
                            rider_id: "RD0066",
                            rating: 3
                        }
                    ],
            DR0003: [
                        {
                            date: "4th Feb 2016",
                            cost: 5,
                            rider_id: "RD0066",
                            rating: 5
                        },
                        {
                            date: "5th Feb 2016",
                            cost: 50,
                            rider_id: "RD0003",
                            rating: 2
                        }
                    ],
            DR0004: [
                        {
                            date: "3rd Feb 2016",
                            cost: 5,
                            rider_id: "RD0022",
                            rating: 5
                        },
                        {
                            date: "4th Feb 2016",
                            cost: 10,
                            rider_id: "RD0022",
                            rating: 4
                        },
                        {
                            date: "5th Feb 2016",
                            cost: 20,
                            rider_id: "RD0073",
                            rating: 5
                        }
                    ]
}



# Step 4: Total Driver's Earnings and Number of Rides
puts
puts "--------------------------------------------------------"
puts "RIDESHARE ANALYSIS"
puts

# The number of rides each driver has given
puts "******************************"
puts "QUESTION 1: How many rides has each driver given?"
puts
lyft_drivers.each do |driver, rides|
  puts "Driver: #{driver}, Rides: #{rides.length}"
end
puts

# - The total amount of money each driver has made
puts "******************************"
puts "QUESTION 2: How much money has each driver made?"
puts

# V1: Solved with loops
lyft_drivers.each do |driver, rides|
  earnings = 0
  rides.each do |ride|
    earnings += ride[:cost]
  end
  puts "Driver: #{driver}, Total earnings: $#{earnings}"
end
puts

# V2: Solved with map and sum
puts "Solved using map and sum instead:"
lyft_drivers.each do |driver, rides|
  earnings = rides.map do |ride|
    ride[:cost]
  end
  puts "Driver: #{driver}, Total earnings: $#{earnings.sum}"
end
puts

# - The average rating for each driver
puts "******************************"
puts "QUESTION 3: What's the average rating for each driver?"
puts

# V1: Solved with loops
lyft_drivers.each do |driver, rides|
  total_rating = 0
  rides.each do |ride|
    total_rating += ride[:rating]
  end
  avg_rating = (total_rating.to_f / rides.length).round(1)
  puts "Driver: #{driver}, Average rating: #{avg_rating}"
end
puts

# V2: Solved with map and sum
puts "Solved using map and sum instead:"
lyft_drivers.each do |driver, rides|
  ratings = rides.map do |ride|
    ride[:rating]
  end
  puts "Driver: #{driver}, Average rating: #{(ratings.sum.to_f / ratings.length).round(1)}"
end
puts

# - Which driver made the most money?
puts "******************************"
puts "QUESTION 4: Which driver made the most money?"
puts

# V1: Solved with loops
highest_earning_driver = {
  driver: nil,
  earnings: 0
}

lyft_drivers.each do |driver, rides|
  earnings = 0
  rides.each do |ride|
    earnings += ride[:cost]
  end
  if earnings > highest_earning_driver[:earnings]
    highest_earning_driver[:driver] = driver
    highest_earning_driver[:earnings] = earnings
  end
end

puts "Highest earning driver: #{highest_earning_driver[:driver]} with $#{highest_earning_driver[:earnings]}"
puts

# V2: Solved with map and sum
highest_earning_driver1 = {
  driver: nil,
  earnings: 0
}

lyft_drivers.each do |driver, rides|
  ride_earnings = rides.map do |ride|
    ride[:cost]
  end
  earnings = ride_earnings.sum
  if earnings > highest_earning_driver1[:earnings]
    highest_earning_driver1[:driver] = driver
    highest_earning_driver1[:earnings] = earnings
  end
end

puts "Solved using map and sum instead:"
puts "Highest earning driver: #{highest_earning_driver1[:driver]} with $#{highest_earning_driver1[:earnings]}"
puts

# - Which driver has the highest average rating?
puts "******************************"
puts "QUESTION 5: Which driver has the highest average rating?"
puts
highest_rated_driver = {
  driver: nil,
  driver_rating: 0
}

lyft_drivers.each do |driver, rides|
  total_rating = 0
  rides.each do |ride|
    total_rating += ride[:rating]
  end
  avg_rating = (total_rating.to_f / rides.length).round(1)
  if avg_rating > highest_rated_driver[:driver_rating]
    highest_rated_driver[:driver] = driver
    highest_rated_driver[:driver_rating] = avg_rating
  end
end

puts "Highest rated driver: #{highest_rated_driver[:driver]} with #{highest_rated_driver[:driver_rating]} stars"
puts

# V2: Solved with map and sum
highest_rated_driver1 = {
  driver: nil,
  earnings: 0
}

lyft_drivers.each do |driver, rides|
  ride_ratings = rides.map do |ride|
    ride[:rating]
  end
  avg_rating = (ride_ratings.sum.to_f / ride_ratings.length).round(1)
  if avg_rating > highest_rated_driver1[:earnings]
    highest_rated_driver1[:driver] = driver
    highest_rated_driver1[:rating] = avg_rating
  end
end

puts "Solved using map and sum instead:"
puts "Highest rated driver: #{highest_rated_driver1[:driver]} with #{highest_rated_driver1[:rating]} stars"
puts

# Optionally, print in the terminal:
# - For each driver, on which day did they make the most money?
puts "******************************"
puts "EXTRA QUESTION: What was each driver's highest earning day?"
puts
lyft_drivers.each do |driver, rides|
  driver_days = {}

  rides.each do |ride|
    if !(driver_days.keys.include? ride[:date]) # add new day and earnings
      driver_days[ride[:date]] = ride[:cost]
    else # add earnings to existing day key
      driver_days[ride[:date]] += ride[:cost]
    end
  end

  highest_day = ""
  highest_earnings = 0
  driver_days.each do |day, earnings|
    if earnings > highest_earnings
      highest_earnings = earnings
      highest_day = day
    end
  end

  puts "#{driver}: #{highest_day} with $#{highest_earnings}."
end
puts

puts "--------------------------------------------------------"
