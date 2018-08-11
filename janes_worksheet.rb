drivers = {
  "DR0001" => [
    ride_one: {
      DATE: "3rd Feb 2016",
      COST: 10,
      RIDER_ID:	"RD0003",
      RATING: 3
    },
    ride_two: {
      DATE: "3rd Feb 2016",
      COST: 30,
      RIDER_ID: "RD0015",
      RATING: 4
    },
    ride_three: {
      DATE: "5th Feb 2016",
      COST: 45,
      RIDER_ID: "RD0003",
      RATING: 2
    }
  ],
  "DR0002" => [
    ride_one: {
      DATE: "3rd Feb 2016",
      COST: 25,
      RIDER_ID:	"RD0073",
      RATING: 5
    },
    ride_two: {
      DATE: "4rd Feb 2016",
      COST: 15,
      RIDER_ID: "RD0013",
      RATING: 1
    },
    ride_three: {
      DATE: "5th Feb 2016",
      COST: 35,
      RIDER_ID: "RD0066",
      RATING: 3
    }
  ],
  "DR0003" => [
    ride_one: {
      DATE: "4rd Feb 2016",
      COST: 5,
      RIDER_ID:	"RD0066",
      RATING: 5
    },
    ride_two: {
      DATE: "5rd Feb 2016",
      COST: 50,
      RIDER_ID: "RD0003",
      RATING: 2
    }
  ],
  "DR0004" => [
    ride_one: {
      DATE: "3rd Feb 2016",
      COST: 5,
      RIDER_ID:	"RD0022",
      RATING: 5
    },
    ride_two: {
      DATE: "4rd Feb 2016",
      COST: 10,
      RIDER_ID: "RD0022",
      RATING: 4
    },
    ride_three: {
      DATE: "5th Feb 2016",
      COST: 20,
      RIDER_ID: "RD0073",
      RATING: 5
    }
  ]
}

# - The number of rides each driver has given X
# - The total amount of money each driver has made X
# - The average rating for each driver X
# - Which driver made the most money? X
# - Which driver has the highest average rating? X
# - For each driver, on which day did they make the most money? X

total_money_made = {}
ratings_average = {}


drivers.each do |driver_id, driver_info|
  sum = 0
  rating_sum = 0
  most_money = 0
  best_day = ""
  driver_info.each do |rides|
    puts "#{driver_id} had #{rides.length} rides."
    rides.each do |ride_number, ride_info|
      sum += rides[ride_number][:COST]
      rating_sum += rides[ride_number][:RATING]
      if most_money < rides[ride_number][:COST]
        most_money = rides[ride_number][:COST]
        best_day = rides[ride_number][:DATE]
      end
    end
    puts "#{driver_id} made $#{sum} total."
    puts "#{driver_id} has a #{rating_sum / rides.length} star average rating."
    total_money_made[driver_id] = sum
    ratings_average[driver_id] = rating_sum / rides.length
  end
  puts "#{driver_id} made the most money on #{best_day}.\n \n"
end

def highest(drivers)
  most = 0
  most_driver = ""
  drivers.map do |key, value|
    if value > most
      most = value
      most_driver = key
    end
  end
  return most_driver
end

puts "#{highest(total_money_made)} made the most money."
puts "#{highest(ratings_average)} had the highest average rating."
