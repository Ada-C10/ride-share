driver_data_hash = {
  DR0001: [
    {
      date: {
        day: 3,
        month: "February",
        year: 2016
      },
      cost: 10,
      rider_id: "RD0003",
      rating: 3
    },
    {
      date: {
        day: 3,
        month: "February",
        year: 2016
      },
      cost: 30,
      rider_id: "RD0015",
      rating: 4
    },
    {
      date: {
        day: 5,
        month: "February",
        year: 2016
      },
      cost: 45,
      rider_id: "RD0003",
      rating: 2
    }
  ],
  DR0002: [
    {
      date: {
        day: 3,
        month: "February",
        year: 2016
      },
      cost: 25,
      rider_id: "RD0073",
      rating: 5
    },
    {
      date: {
        day: 4,
        month: "February",
        year: 2016
      },
      cost: 15,
      rider_id: "RD0013",
      rating: 1
    },
    {
      date: {
        day: 5,
        month: "February",
        year: 2016
      },
      cost: 35,
      rider_id: "RD0066",
      rating: 3
    }
  ],
  DR0003: [
    {
      date: {
        day: 4,
        month: "February",
        year: 2016
      },
      cost: 5,
      rider_id: "RD0066",
      rating: 5
    },
    {
      date: {
        day: 5, month: "February",
        year: 2016
      },
      cost: 50,
      rider_id: "RD0003",
      rating: 2
    }
  ],
  DR0004: [
    {
      date: {
        day: 3,
        month: "February",
        year: 2016
      },
      cost: 5,
      rider_id: "RD0022",
      rating: 5
    },
    {
      date: {
        day: 4,
        month: "February",
        year: 2016
      },
      cost: 10,
      ider_id: "RD0022",
      rating: 4
    },
    {
      date: {
        day: 5,
        month: "February",
        year: 2016
      },
      cost: 20,
      rider_id: "RD0073",
      rating: 5
    }
  ]
}

#1. The number of rides each driver has given
# def total_rides_given(driver_data_hash)
driver_data_hash.each do |driver, rides_array|
  puts "Driver: #{driver} gave #{rides_array.length} rides."
end
# end


# 2. The total amount of money each driver has made
def driver_total_earnings(data_hash)
  each_total_earnings = {}
  data_hash.each do |driver, rides_array|
    rides_array.reduce(0) do |sum_of_earnings, ride_details_hash|
      sum_of_earnings += ride_details_hash[:cost]
      each_total_earnings[driver] = sum_of_earnings
    end
  end
  each_total_earnings
end

hash_of_driver_earnings = driver_total_earnings(driver_data_hash)

hash_of_driver_earnings.each do |driver, total_earned|
  puts "Driver: #{driver} earned $#{total_earned} total."
end

#how can i use reduce in this one without modifying the sum value
# 3. The average rating for each driver
def drivers_average_ratings_hash(data_hash)
  each_driver_average_rating = {}
  data_hash.each do |driver, rides_array|
    sum_of_ratings = 0
    rides_array.each do |ride|
      sum_of_ratings += ride[:rating]
    end
    each_driver_average_rating[driver] = (sum_of_ratings / rides_array.length.to_f).round(1)
  end
  each_driver_average_rating
end

drivers_average_ratings = drivers_average_ratings_hash(driver_data_hash)

drivers_average_ratings.each do |driver, rating|
  puts "Driver: #{driver} received an average rating of #{rating}"
end

#what about ties?
# 4. Which driver made the most money?
def driver_who_earned_most(earnings_hash)
  driver_who_earned_most = ""
  most_earned_so_far = 0
  earnings_hash.each do |driver, total_earnings|
    if total_earnings > most_earned_so_far
      most_earned_so_far = total_earnings
      driver_who_earned_most = driver
    end
  end
  driver_who_earned_most
end

driver_who_earned_most = driver_who_earned_most(hash_of_driver_earnings)

puts "Driver: #{driver_who_earned_most} earned the most overall."

# try using find_all method on array
# 5. Which driver has the highest average rating?
def return_driver_who_had_highest_ave_rating(drivers_average_ratings)
  highest_rating = drivers_average_ratings.each_value.max
  driver_with_highest_average_rating = ""
  drivers_average_ratings.each do |driver, ave_rating|
    if ave_rating == highest_rating
      driver_with_highest_average_rating = driver
    end
  end
  driver_with_highest_average_rating
end

puts "Driver: #{return_driver_who_had_highest_ave_rating(drivers_average_ratings)} had the highest average rating."
