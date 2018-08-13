# data structure:
# 1) Driver Info - hash
#      keys - driver_id
# 2)   values - hash
#        keys - date
# 3)     values - array (rides)
# 4)       elements - hash
#            keys - rider_id, cost, rating
#            values - strings, numbers

driver_info = {
  DR0001:
  {
    "2/3/16"=>[
      {
        rider_id: "RD0003",
        cost: 10,
        rating: 3
      },
      {
        rider_id: "RD0015",
        cost: 30,
        rating: 4
      }
    ],
    "2/5/16"=>[
      {
        rider_id: "RD0003",
        cost: 45,
        rating: 2
      }
    ]
  },
  DR0002:
  {
    "2/3/16"=>[
      {
        rider_id: "RD0073",
        cost: 25,
        rating: 5
      }
    ],
    "2/4/16"=>[
      {
        rider_id: "RD0013",
        cost: 15,
        rating: 1
      }
    ],
    "2/5/16"=>[
      {
        rider_id: "RD0066",
        cost: 35,
        rating: 3
      }
    ]
  },
  DR0003:
  {
    "2/4/16"=>[
      {
        rider_id: "RD0066",
        cost: 5,
        rating: 5
      }
    ],
    "2/5/16"=>[
      {
        rider_id: "RD0003",
        cost: 50,
        rating: 2
      }
    ]
  },
  DR0004:
  {
    "2/3/16"=>[
      {
        rider_id: "RD0022",
        cost: 5,
        rating: 5
      }
    ],
    "2/4/16"=>[
      {
        rider_id: "RD0022",
        cost: 10,
        rating: 4
      }
    ],
    "2/5/16"=>[
      {
        rider_id: "RD0073",
        cost: 20,
        rating: 5
      }
    ]
  }
}

# print out breakdown of data
driver_info.each do |driver, driver_data|
  puts driver
  driver_data.each do |date, rides|
    puts date
    puts rides
  end
end

# array containing hashes with driver data results
# {
# driver_id:
# num_rides:
# money_earned:
# ave_rating:
# }


driver_results = driver_info.map do |id, data|
  num_rides = 0
  earned_per_driver = 0
  sum_rating_per_driver = 0

  data.each do |date, rides|
    num_rides = num_rides + rides.length
    earned_per_date = 0
    sum_rating_per_date = 0.0

    rides.each do |ride|
      earned_per_date += ride[:cost]
      sum_rating_per_date += ride[:rating]
    end

    earned_per_driver += earned_per_date
    sum_rating_per_driver += sum_rating_per_date

  end

  ave_rating = sum_rating_per_driver / num_rides

  {
    driver_id: id,
    num_rides: num_rides,
    money_earned: earned_per_driver,
    ave_rating: ave_rating,
    # max_day: max_day
  }
end

# 1. Report the number of rides each driver has given
driver_results.each do |driver|
  puts "Driver with ID #{driver[:driver_id]} has given #{driver[:num_rides]} rides."
end

puts "---------------------------------------------"

# 2. Report the total amount of money each driver has made
driver_results.each do |driver|
  puts "Driver with ID #{driver[:driver_id]} has made $#{driver[:money_earned]}."
end

puts "---------------------------------------------"

# 3. calculate the average rating for each driver
driver_results.each do |driver|
  puts "Driver with ID #{driver[:driver_id]} has an average of #{driver[:ave_rating]} stars."
end

puts "---------------------------------------------"

# 4. report which driver made the most money
max_earned = 0
max_driver = nil

driver_results.each do |driver|
  if driver[:money_earned] > max_earned
    max_earned = driver[:money_earned]
    max_driver = driver[:driver_id]
  end
end

puts "Driver with ID #{max_driver} made the most money."

# 5. report which driver has the higest average rating
max_rating = 0
max_driver = nil

driver_results.each do |driver|
  if driver[:ave_rating] > max_rating
    max_rating = driver[:ave_rating]
    max_driver = driver[:driver_id]
  end
end

puts "Driver with ID #{max_driver} has the highest average rating."

puts "---------------------------------------------"

# Opt. for each driver, report which day they made the most money
driver_daily_earnings = driver_info.map do |id, data|
  daily_earnings = data.map do |date, rides|
    earned_per_date = 0
    rides.each do |ride|
      earned_per_date += ride[:cost]
    end
    {:date => date, :earned => earned_per_date}
  end
  {id => daily_earnings}
end

driver_daily_earnings.each do |driver|
  driver.each do |id, daily_earnings|
    max_earnings = 0
    max_day = nil
    daily_earnings.each do |date|
      if date[:earned] > max_earnings
        max_earnings = date[:earned]
        max_day = date[:date]
      end
    end
    puts "Driver with ID #{id} made the most money on #{max_day}."
  end
end
