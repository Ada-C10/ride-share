########################################################
# Step 1: Establish the layers
# Write a list of the layers here

# Driver_ID (string)
# Date  (string)
# Cost (float)
# Rider_ID (string)
# Rating (float)

########################################################
# Step 2: Assign a data structure to each layer
# Copy your list from above, and write what data structure each layer should have
# Write a list of the layers here

# Driver_ID - Hash
# Date  - Hash
# Cost - hash within an array
# Rider_ID - hash within an array
# Rating array hash within an array

########################################################
# Step 3: Make the data structure!
# Setup the data structure and manually write in data presented in rides.csv

# {
#   driver_id: {
#     date: [
#       {
#         cost:
#         rider_id:
#         rating:
#       }
#     ]
#   }
# }


ride_share_info = {
  "DR0004" => {
    "3RD FEB 2016" => [
      {
        cost: 5,
        rider_id: "RD0022",
        rating: 5
      }
    ],
    "4TH FEB 2016" => [
      {
        cost: 10,
        rider_id: "RD0022",
        rating: 4
      }
    ],
    "5TH FEB 2016" => [
      {
        cost: 20,
        rider_id: "RD0073",
        rating: 5
      }
    ]
  },
  "DR0001" => {
    "3RD FEB 2016" => [
      {
        cost: 10,
        rider_id: "RD0003",
        rating: 3
      },
      {
        cost: 30,
        rider_id: "RD0015",
        rating: 4
      }
    ],
    "5TH FEB 2016" => [
      {
        cost: 45,
        rider_id: "RD0003",
        rating: 2
      }
    ]
  },
  "DR0002" => {
    "3RD FEB 2016" => [
      {
        cost: 25,
        rider_id: "RD0073",
        rating: 5
      }
    ],
    "4TH FEB 2016" => [
      {
        cost: 15,
        rider_id: "RD0013",
        rating: 1
      }
    ],
    "5TH FEB 2016" => [
      {
        cost: 35,
        rider_id: "RD0066",
        rating: 3
      }

    ]
  },
  "DR0003" => {
    "4TH FEB 2016" => [
      {
        cost: 5,
        rider_id:"RD0066",
        rating: 5
      },
    ],
    "5TH FEB 2016" => [
      {
        cost: 50,
        rider_id: "RD0003",
        rating: 2
      }
    ]
  }
}


########################################################
# Step 4: Total Driver's Earnings and Number of Rides
# Use an iteration block to print driver's total rides and money made
# get total rides


def driver_total_rides(info)
  # goal: make an array of hashes [{driver: total_ride_count}]
  driver_info = info.map do |driver, rides|
    driver_and_rides = {}
    # get total ride count per driver
    total_ride_count = rides.map { |date, each_ride| each_ride.length}.reduce(:+)
    # create hash for each driver
    driver_and_rides[driver] = total_ride_count
    # assign hash to the array
    driver_and_rides
  end
  # return value is the array
  return driver_info
end


def total_amount_per_driver(info)
  # goal: make an array of hashes [{driver: total_amount}]
  driver_info = []
  # get total amount made per driver
  info.each do |driver, rides|
    driver_and_amount = {}
    total_amount = 0
    rides.each do |date, each_ride|
      each_ride.each do |amount|
        total_amount += amount[:cost]
      end
      # create hash for each driver
      driver_and_amount[driver] = total_amount
    end
    # add hash into the array
    driver_info << driver_and_amount
  end
  # return value is the array
  return driver_info
end


def average_rating(info)
  # goal: make an array of hashes [{driver: avg_rating}]
  driver_info = []
  # get average rating per driver
  info.each do |driver, rides|
    driver_and_rating = {}
    average = 0.0
    total_ride_count = 0.0
    total_rate = 0.0
    # collect total ride count per driver
    rides.each do |date, each_ride|
      ride_count = each_ride.length
      total_ride_count += ride_count
      # collect total rate per driver
      each_ride.each do |rate|
        total_rate += rate[:rating]
      end
      # calculate avg, create hash for each driver
      average = total_rate/total_ride_count
      driver_and_rating[driver] = average
    end
    # add hash into the array
    driver_info << driver_and_rating
  end
  # return value is the array
  return driver_info
end


each_driver_rides = driver_total_rides(ride_share_info)
each_driver_total = total_amount_per_driver(ride_share_info)
each_driver_rating = average_rating(ride_share_info)


def driver_most_amount(each_driver)
  # goal: get the driver ID that raised most amount
  raised_most = nil
  highest_amount = 0
  # find highest amount, assign the corresponding driver to raised_most
  each_driver.each do |info|
    info.each do |driver, amount|
      if amount > highest_amount
        highest_amount = amount
        raised_most = driver
      end
    end
  end
  # return value is the string assigned to raised_most (driver ID)
  return raised_most
end


def driver_highest_rating(each_driver)
  # goal: get the driver ID that had the highest avg rating
  rated_highest = nil
  highest_rating = 0
  # find the highest avg rating, assign the corresponding driver to rated_highest
  each_driver.each do |info|
    info.each do |driver, rating|
      if rating > highest_rating
        highest_rating = rating
        rated_highest = driver
      end
    end
  end
  # return value is the string assigned to rated_highest (driver ID)
  return rated_highest
end


def day_highest_earned(info)
  # goal: make an array of hashes [{driver: date}]
  driver_info = []
  # find highest amount made per day, per driver
  info.each do |driver, rides|
    driver_and_day = {}
    cost_per_ride = 0
    raised_most_date = nil

    rides.each do |date, each_ride|
      # assign the corresponding date to the highest amount made
      each_ride.each do |amount|
        if amount[:cost] > cost_per_ride
          cost_per_ride = amount[:cost]
          raised_most_date = date
        end
      end
      # create hash for each driver
      driver_and_day[driver] = raised_most_date
    end
    # add each hash into the array
    driver_info << driver_and_day
  end
  # return value is the array
  return driver_info
end


# Output message
puts
puts "=" * 80
puts "\t\t\t\tRIDE SHARE INFO"
puts "=" * 80

puts
puts "TOTAL RIDES PER DRIVER: "
each_driver_rides.each do |info|
  info.each do |driver, total_rides|
    puts "#{driver}: #{total_rides}"
  end
end

puts
puts

puts "TOTAL AMOUNT MADE PER DRIVER: "
each_driver_total.each do |info|
  info.each do |driver, total_amount|
    puts "#{driver}: $#{"%.02f" % total_amount}"
  end
end

puts
puts

puts "AVERAGE RATING PER DRIVER: "
each_driver_rating.each do |info|
  info.each do |driver, rating|
    puts "#{driver}: #{"%.01f" % rating}"
  end
end

puts
puts

highest_earned_per_day = day_highest_earned(ride_share_info)
puts "DAY THAT YIELDED HIGHEST EARNED AMOUNT PER DRIVER:"
highest_earned_per_day.each do |info|
  info.each do |driver, date|
    puts "#{driver}: #{date}"
  end
end

puts
puts

raised_most_driver = driver_most_amount(each_driver_total)
puts "DRIVER THAT MADE THE MOST MONEY: #{raised_most_driver}"
puts

highest_rated_driver = driver_highest_rating(each_driver_rating)
puts "DRIVER RATED THE HIGHEST: #{highest_rated_driver}"
puts
puts
