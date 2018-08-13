########################################################
# Step 1: Establish the layers

# One layer for drivers.
# One layer for each drive under a driver.
# One layer to show the different types of info about the drive.

########################################################
# Step 2: Assign a data structure to each layer

  # First we will need a hash to encapsulate a list of drivers
  # and their respective information. The key of this will be the driver id, and the
  # hash is a list of hashes (rides).
  # Within each array will be a hash to show date, cost, and rider_id, and rating of each ride.

########################################################
# Step 3: Make the data structure!

drivers = {
  DR0001:
    [
      {
        rider_id: 'RD0022',
        cost: 5,
        rating: 5,
        date: '3 feb 2016'

      },
      {
        rider_id: 'RD0015',
        cost: 30,
        rating: 4,
        date: '3 feb 2016'
      },
      {
        rider_id: 'RD0003',
        cost: 45,
        rating: 2,
        date: '5 feb 2016'
      },
    ],
  DR0002:
    [
      {
        rider_id: 'RD0073',
        cost: 25,
        rating: 5,
        date: '3 feb 2016'
      },
      {
        rider_id: 'RD0013',
        cost: 15,
        rating: 1,
        date: '4 feb 2016'
      },
    ],
  DR0003:
    [
      {
        rider_id: 'RD0066',
        cost: 5,
        rating: 5,
        date: '4 feb 2016'
      },
      {
        rider_id: 'RD0003',
        cost: 50,
        rating: 2,
        date: '5 feb 2016'
      },
    ],
  DR0004:
    [
      {
        rider_id: 'RD0022',
        cost: 5,
        rating: 5,
        date: '3 feb 2016'
      },
      {
        rider_id: 'RD0022',
        cost: 10,
        rating: 4,
        date: '4 feb 2016'
      },
      {
        rider_id: 'RD0022',
        cost: 20,
        rating: 5,
        date: '5 feb 2016'
      },
    ]
}

########################################################
# Step 4: Total Driver's Earnings and Number of Rides

#  Use an iteration block to print driver's total rides and money made

# Calculating info for respective drivers
driver_info = {}

drivers.each do |driver, rides|

  driver_info[driver] = {:total_rides => rides.length,
              :average_rating => (1.0 * rides.sum{ |ride| ride[:rating] } / rides.length).round(2),
              :total_revenue => rides.sum{ |ride| ride[:cost]},
              :profitable_day => rides.max_by{ |ride| ride[:cost] }[:date]
            }

  puts "\nDriver: #{driver} has"

  puts "\tdriven #{driver_info[driver][:total_rides]} rides."
  puts "\tearned $#{driver_info[driver][:total_revenue]}. "
  puts "\tan average rating of #{driver_info[driver][:average_rating]}."
  puts "\tearned the most on #{driver_info[driver][:profitable_day]}."
end


# Calculating drivers with highest revenue and rating
revenue_driver = driver_info.max_by{|driver, info| info[:total_revenue]}
rating_driver = driver_info.max_by{|driver, info| info[:average_rating]}

puts "\n#{revenue_driver[0]} earned the most revenue with $#{revenue_driver[1][:total_revenue]}"
puts "#{rating_driver[0]} earned the highest rating with #{rating_driver[1][:average_rating]}"
