########################################################
# Step 1: Establish the layers

  # Write a list of the layers here

  # All Drivers
  # Individual Drivers
  # All Trips for a Driver
  # Individual Trip

########################################################
# Step 2: Assign a data structure to each layer

  # Copy your list from above, and write what data structure each layer should have
  # All Drivers - Array of hashes
  # Individual Drivers - Hash
  # All Trips for a Driver - Array of Hashes
  # Individual Trip - Hash

########################################################
# Step 3: Make the data structure!

    # Setup the data structure and manually write in data presented in rides.csv
    # [ { driver_id:
    #   [{ date: XXXX, cost: XXXX, rider_id: XXXX, rating: XXXX }]
    # }]

drivers =
 [
    { driver_id: 'DR0001',
      trips:
      [
        { date: '3rd Feb 2016',
          cost: 10,
          rider_id: 'RD0003',
          rating: 3
        },
        { date: '3rd Feb 2016',
          cost: 30,
          rider_id: "RD0015",
          rating: 4
        },
        {date: '5th Feb 2016',
         cost: 45,
         rider_id: "RD0003",
         rating: 2
        }
      ]
    },

    { driver_id: 'DR0002',
      trips:
      [
        { date: '3rd Feb 2016',
          cost: 25,
          rider_id: "RD0073",
          rating: 5
        },
        { date: '4th Feb 2016',
          cost: 15,
          rider_id: "RD0013",
          rating: 1
        },
        { date: '5th Feb 2016',
          cost: 35,
          rider_id: "RD0066",
          rating: 3
         },
      ]
    },

    { driver_id: 'DR0003',
      trips:
      [
       { date: '4th Feb 2016',
         cost: 5,
         rider_id: "RD0066",
         rating: 5
        },
        { date: '5th Feb 2016',
          cost: 50,
          rider_id: "RD0003",
          rating: 1
        },
      ],
    },
    { driver_id: 'DR0004',
      trips:
      [
       { date: '3rd Feb 2016',
         cost: 5,
         rider_id: "RD0022",
         rating: 5
        },
        { date: '4th Feb 2016',
          cost: 10,
          rider_id: "RD0022",
          rating: 4
        },
        { date: '5th Feb 2016',
          cost: 20,
          rider_id: "RD0073",
          rating: 5
        }
      ]
    }
  ]

########################################################
# Step 4: Total Driver's Earnings and Number of Rides

  # Use an iteration block to print driver's total rides and money made
puts
# puts drivers
puts "TESTING OUTPUT"
puts
puts "Info for first driver is #{drivers[0]}"
puts
puts "Number of driver_id for driver 1 is #{drivers[0][:driver_id]}"
puts
puts "Trips for driver 1 are #{drivers[0][:trips]}"
puts
puts "Number of drives for driver 1 is #{drivers[0][:trips].length}"
puts
puts "------------------------------------------------------------------------"
puts
puts "Number of rides each driver has given:"
puts
drivers.each do |driver|
  puts "Driver Number: #{driver[:driver_id]} had #{driver[:trips].length} drives."
end

puts
puts "Total amount of money each driver has made:"
puts
drivers.each do |driver|
  sum_cost = 0
  driver[:trips].each do |trip|
    sum_cost += trip[:cost]
  end
  puts "Driver Number: #{driver[:driver_id]} made $#{sum_cost} total."
end

puts
puts "Average rating for each driver:"
puts
drivers.each do |driver|
  rating_sum = 0
  driver[:trips].each do |trip|
    rating_sum = rating_sum + trip[:rating]
  end
  average_rating = rating_sum / driver[:trips].length
  puts "Driver Number: #{driver[:driver_id]} average rating is #{average_rating}"
end

puts
puts
puts "Which driver made the most money?"
puts

def sum_drive_earnings(driver_array)
  sum_cost = 0
  driver_array[:trips].each do |trip|
    sum_cost += trip[:cost]
  end
  return sum_cost
end

greatest_earnings = 0
richest_driver = nil

drivers.each do |driver|
  driver_earnings = sum_drive_earnings(driver)
  if driver_earnings > greatest_earnings
    greatest_earnings = driver_earnings
    richest_driver = driver[:driver_id]
  end
end

puts "The driver who made the most money is #{richest_driver}"
puts



puts
puts "Which driver has the highest average rating?"
puts

highest_avg_ratings = []
driver_with_best_avg = nil
drivers.each do |driver|
  rating_sum = 0
  driver[:trips].each do |trip|
    rating_sum = rating_sum + trip[:rating]
  end
  average_rating = rating_sum / driver[:trips].length
  highest_avg_ratings << average_rating
  driver_with_best_avg = driver[:driver_id]
end
puts "Driver #{driver_with_best_avg} has the best average of #{highest_avg_ratings.max}."
puts
puts
puts "For each driver, on which day did they make the most money?"
puts
drivers.each do |driver|
  most_money = 0
  trip_day = nil
  driver[:trips].each do |trip|
    if trip[:cost] > most_money
      most_money = trip[:cost]
      trip_day = trip[:date]
    end
  end
  puts "Driver #{driver[:driver_id]} made the most money ($#{most_money}) on #{trip_day}."
end
puts
