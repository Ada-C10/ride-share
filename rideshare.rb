#A Ride Share Program 

ride_share_drivers =
[
  {driver_id: "DR0004",
    trips: [{rating: 4.0, rider_id: "RD0022", date: "02042016", cost: 10.0},
      {rating: 5.0, rider_id: "RD0073", date: "02052016", cost: 20.0},
      {rating: 5.0, rider_id: "RD0022", date: "02032016", cost: 5.0}
      ]},

      {driver_id: "DR0003", trips: [
        {
          rating:  5.0,
          rider_id: "RD0066",
          date: "02042016",
          cost: 5.0
        },
        {
          rating: 2.0,
          rider_id: "RD0003",
          date: "02052016",
          cost: 50.0
        }
      ]
    },

    {driver_id: "DR0002", "trips": [
      {
        rating: 5.0,
        rider_id: "RD0073",
        date: "02032016",
        cost: 25.0
      },
      {
        rating: 1.0,
        rider_id: "RD0013",
        date: "02042016",
        cost: 15.0
      },
      {
        rating: 3.0,
        rider_id: "RD0066",
        date: "02052016",
        cost: 35.0
      }
    ]
  },

  {driver_id: "DR0001", trips: [
    {
      rating: 3.0,
      rider_id: "RD0003",
      date: "02032016",
      cost: 10.0
    },
    {
      rating: 4.0,
      rider_id: "RD0015",
      date: "02032016",
      cost: 30.0
    },
    {
      rating: 2.0,
      rider_id: "RD0003",
      date: "02052016",
      cost: 45.0
    }
  ]
}
]

#The number of rides each driver has given
def sum_total_rides(drivers)

  drivers.each do |driver|
    puts "#{driver[:driver_id]} made #{driver[:trips].length} trips."
  end

end


# Puts total each driver earned to console
def sum_total_earned(drivers)

  drivers.each do |driver|
    sum = 0

    driver[:trips].each do |trip|
      sum += trip[:cost]
    end

    # TEST: puts "\nCurrent driver: #{driver[:driver_id].inspect} OUTPUT\n"
    # TEST: puts "Total earned: #{sum.inspect} OUTPUT\n"
    driver[:total] = sum

    puts "#{driver[:driver_id]} earned $#{driver[:total]}."
  end

end

# The average rating for each driver
def average_rating(drivers)

  drivers.each do |driver|
    sum = 0
    average_rating = 0

    driver[:trips].each do |trip|
      sum += trip[:rating]
      # TEST: ---> puts "Current rating: #{trip[:rating]} and sum: #{sum}"
    end

    average_rating = sum / driver[:trips].length

    puts "#{driver[:driver_id]} has an average rating of #{average_rating}."
  end

end

# Which driver made the most money?
def highest_earned(drivers)
  max = 0
  highest_driver = ""

  drivers.each do |driver|
    sum = 0

    driver[:trips].each do |trip|
      sum += trip[:cost]
      #----> TEST: puts "current: #{driver[:driver_id]} and #{sum}"
    end

    if max < sum
      max = sum
      highest_driver = driver[:driver_id]
    end

  end

  puts "#{highest_driver} earned the most with $#{max}."
end

# Which driver has the highest average rating?
def highest_rating(drivers)
  highest_average = 0
  highest_rated_driver = ""

  drivers.each do |driver|
    sum = 0
    average_rating = 0

    driver[:trips].each do |trip|
      sum += trip[:rating]
    end

    average_rating = sum / driver[:trips].length
    # TEST---> puts "Average rating: #{average_rating}"

    if highest_average < average_rating
      highest_average = average_rating
      highest_rated_driver = driver[:driver_id]
      # TEST---> puts "current driver: #{driver[:driver_id]}, current average: #{average_rating}, highest_average: #{highest_average}, highest rated: #{highest_rated_driver}"
    end

  end

  puts "#{highest_rated_driver} has the highest rating with #{highest_average} stars."
end

# OPTIONAL: For each driver, on which day did they make the most money?
def each_highest_earning_day(drivers)


  drivers.each do |driver|
    max = 0
    max_date = ""

    # TEST----> puts "START Max: #{max} / Date: #{max_date}"
    # TEST----> puts "\nCurrent driver: #{driver[:driver_id]}"

    driver[:trips].each do |trip|

      current_cost = 0
      current_cost = trip[:cost]
      # TEST----> puts "CURRENT Cost : #{current_cost} / Date: #{trip[:date]}"

      if max < current_cost
        max = current_cost
        max_date = trip[:date].insert(2, "/")
        max_date.insert(5, "/")
      end

      # TEST----> puts "END Max: #{max} / Date: #{max_date}"
    end

    puts "#{driver[:driver_id]} earned the most on #{max_date} with $#{max}."
  end

end

puts "\nDriver Report: \n\n"

sum_total_rides(ride_share_drivers)
sum_total_earned(ride_share_drivers)
highest_earned(ride_share_drivers)
average_rating(ride_share_drivers)
highest_rating(ride_share_drivers)
each_highest_earning_day(ride_share_drivers)
