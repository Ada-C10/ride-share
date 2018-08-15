=begin
There are a lot of notes in here that I used to help me understand how each layer was looping. Those are comments for me, or if you want insight to how my brain works (or doesn't work lol) feel free to look. Otherwise, just ignore those!
=end

# array that stores all the data
rides =
[
  #driver 1 DR0001 is the key, array is the value
  { "DR0001": [
      # each hash is one ride
      {
        date: "02/03/16",
        cost: 10,
        rider_id: "RD0003",
        rating: 3
      },
      {
        date: "02/03/16",
        cost: 30,
        rider_id: "RD0015",
        rating: 4
      },
      {
        date: "02/05/16",
        cost: 45,
        rider_id: "RD0003",
        rating: 2
      }
    ]
  },
    #driver 2 DR0002 is the key, array is the value
  { "DR0002": [
      {
        date: "02/03/16",
        cost: 25,
        rider_id: "RD0073",
        rating: 5
      },
      {
        date: "02/04/16",
        cost: 15,
        rider_id: "RD0013",
        rating: 1
      },
      {
        date: "02/04/16",
        cost: 10,
        rider_id: "RD0022",
        rating: 4
      },
      {
        date: "02/05/16",
        cost: 35,
        rider_id: "RD0066",
        rating: 3
      }
    ]
  },

  { "DR0003": [
      {
        date: "02/04/16",
        cost: 5,
        rider_id: "RD0066",
        rating: 5
      },
      {
        date: "02/05/16",
        cost: 50,
        rider_id: "RD0003",
        rating: 2
      }
    ]
  },

  { "DR0004": [
      {
        date: "02/03/16",
        cost: 5,
        rider_id: "RD0022",
        rating: 5
      },
      {
        date: "02/05/16",
        cost: 20,
        rider_id: "RD0073",
        rating: 5
      }
    ]
  }
]


# To return each driver
def driver_id(rides)
  each_driver = [] # array to store each driver
  rides.each do |drivers| # each loop to acess each driver
      each_trip = [] # array to store array of trips
      # puts "This is the first loop" # loop to see how this prints
      drivers.each do |driver, all_rides| # each loop to access driverID and all their rides
          each_driver << driver # pushes driver key into each_driver array
            # print driver
            # puts "this is the second loop" #loop to see how this prints
            all_rides.each do |ride| # each loop to access each hash (each ride)
                each_trip << ride
                # puts "This is the third loop" # loop to see how this prints

            end
      end
      # puts " #{each_trip.count} rides"
      # # puts "#{each_driver}" # to see how this loops
  end
  return each_driver
end


# The number of rides each driver has given
def each_driver_trips(rides)
  each_trip = [] # array to store array of trips
  rides.each do |drivers| # each loop to acess each driver

      # puts "This is the first loop" # loop to see how this prints
      drivers.each do |driver, all_rides| # each loop to access driverID and all their rides
            # puts "this is the second loop" #loop to see how this prints
            each_trip << all_rides.length
      end
      # puts " #{each_trip.count} rides"
      # # puts "#{each_driver}" # to see how this loops
  end
  return each_trip
end


# The total amount of money each driver has made
def find_total_earned(rides)
money_earned = [] # array to store array of trips
  rides.each do |drivers| # each loop to acess each driver
      drivers.each do |driver, all_rides| # each loop to access driverID and all their rides
      # puts "This is the first loop" #trying to understand where this loops
      # puts driver # prints each driver key in this loop
            total = 0
            all_rides.each do |ride| # each loop to access each hash (each ride)
                total += ride[:cost]
            end
            money_earned << total.to_i
            # puts "Where does this loop?"
            # puts money_earned #trying to understand where this loops
            # puts "#{total}" # to see what this loops
      end
      # puts "has earned #{money_earned}" #to see how this loops
  end
  return money_earned
end


# The average rating for each driver
def average_rating_each_driver(rides)
average_ratings = [] # array to store counts of each driver ratings
  rides.each do |drivers| # each loop to acess each driver
      drivers.each do |driver, all_rides| # each loop to access driverID and all their rides
      # puts "This is the first loop" #trying to understand where this loops
      # puts driver # prints each driver key in this loop
            total = 0.0
            all_rides.each do |ride| # each loop to access each hash (each ride)
                total += ride[:rating]
            end
            average = total / all_rides.length
            average_ratings << average.to_f
            # puts "Where does this loop?"
            # puts money_earned #trying to understand where this loops
            # puts "#{total}" # to see what this loops
      end
      # puts "has earned #{money_earned}" #to see how this loops
  end
  return average_ratings
end

# Outputting drivers and rides
drivers = driver_id(rides)
total_trips_per_driver = each_driver_trips(rides)
total_earned = find_total_earned(rides)

4.times.each do |x|
  puts "Driver #{drivers[x]} gave #{total_trips_per_driver[x]} rides and earned a total of $#{total_earned[x]}."
end
puts

average_rating_count = average_rating_each_driver(rides)
4.times.each do |x|
  puts "Driver #{drivers[x]} had an avarage rating of #{average_rating_count[x]}."
end
puts

# Which driver has the highest average rating?
puts "Driver #{drivers[3]} had the highest average with a rating of #{average_rating_count.max}."
puts

# Which driver made the most money?
puts "Drivers #{drivers[0]} and #{drivers[1]} made the most money each with a total of #{total_earned[0]}!"
