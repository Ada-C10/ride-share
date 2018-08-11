# data structure containing the drivers and a detailed list of their rides

RIDE_SHARES = {
  "DR0001": [
    {
      date: "3rd Feb 2016", #
      cost: 10,
      rider: "RD0003",
      rating: 3
    },
    {
      date: "3rd Feb 2016",
      cost: 30,
      rider: "RD0015",
      rating: 4
    },
    {
      date: "5th Feb 2016",
      cost: 45,
      rider: "RD0003",
      rating: 2
    }
  ],
  "DR0002": [
    {
      date: "3rd Feb 2016",
      cost: 25,
      rider: "RD0073",
      rating: 5
    },
    {
      date: "4th Feb 2016",
      cost: 15,
      rider: "RD0013",
      rating: 1
    },
    {
      date: "5th Feb 2016",
      cost: 35,
      rider: "RD0066",
      rating: 3
    }
  ],
  "DR0003": [
    {
      date: "4th Feb 2016",
      cost: 5,
      rider: "RD0066",
      rating: 5
    },
    {
      date: "5th Feb 2016",
      cost: 50,
      rider: "RD0003",
      rating: 2
    }
  ],
  "DR0004": [
    {
      date: "3rd Feb 2016",
      cost: 5,
      rider: "RD0022",
      rating: 5
    },
    {
      date: "4th Feb 2016",
      cost: 10,
      rider: "RD0022",
      rating: 4
    },
    {
      date: "5th Feb 2016",
      cost: 20,
      rider: "RD0073",
      rating: 5
    }
  ]
}


# returns a hash containing the date and that day's total earnings for a given driver_id
def get_earnings(driver_id, list_of_rides)
  days_earnings = {}

  list_of_rides.each do |ride|
    if days_earnings.has_value?(ride[:date])
      days_earnings[ride[:date]] += ride[:cost]
    else
      date1 = ride[:date]
      days_earnings[date1] = ride[:cost]
    end
  end

  return days_earnings

end

# returns the average rating for a given driver_id
def get_average_rating(driver_id)
  sum = 0.0

  RIDE_SHARES[driver_id].each do |rides|
    sum += rides[:rating]
  end

  return (sum / RIDE_SHARES[driver_id].length * 10).floor / 10.0

end


# array will hold a hash of each driver's id, their total earning's, and their average rating
driver_stats = []

RIDE_SHARES.each do |driver_id, list_of_rides|
  rides = list_of_rides.length
  rating = get_average_rating(driver_id)
  days_earnings = get_earnings(driver_id, list_of_rides)

  max_earned = days_earnings.max_by do |day, earnings|
    earnings
  end

  total_earned = days_earnings.sum do |day, earnings|
    earnings
  end

  driver_stats << {
    driver: driver_id,
    total_earned: total_earned,
    rating: rating
  }

  puts "
  Driver #{driver_id}:
  \tTotal rides: #{rides}
  \tTotal earnings: $#{total_earned}
  \tAverage rating: #{rating}
  \tDate most money was earned: #{max_earned[0]} ($#{max_earned[1]})"

end

highest_earner = driver_stats.max_by do |stat|
  stat[:total_earned]
end

highest_rated =  driver_stats.max_by do |stat|
  stat[:rating]
end

puts "\nDriver #{highest_earner[:driver]} made the most money ($#{highest_earner[:total_earned]})."
puts "Driver #{highest_rated[:driver]} received the highest average rating (#{highest_rated[:rating]}).\n\n"
