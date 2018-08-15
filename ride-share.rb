# Ride Share Project Worksheet - 8.12.18

########################################################
# Step 1: Establish the layers

  # Write a list of the layers here
  # layer one - assign all data to variable
  # layer two - driver information
  # layer three - rides information

########################################################
# Step 2: Assign a data structure to each layer

  # Copy your list from above, and write what data structure each layer should have
  # layer one - assign all data to variable - array
  # layer two - driver information - hash for each driver
  # layer three - rides information - arrays

########################################################
# Step 3: Make the data structure!

    # Setup the data structure and manually write in data presented in rides.csv

all_rides =
[
  {
    driver_id: "DR0001",
    dates: %w[02/03/16 02/03/16 02/05/16],
    costs: [10, 30, 45],
    rider_ids: %w[RD0003 RD0015 RD0003],
    ratings: [3, 4, 2]
  },
  {
    driver_id: "DR0002",
    dates: %w[02/03/16 02/04/16 02/05/16],
    costs: [25, 15, 35],
    rider_ids: %w[RD0073 RD0013 RD0066],
    ratings: [5, 1, 3]
  },
  {
    driver_id: "DR0003",
    dates: %w[02/04/16 02/05/16],
    costs: [5, 50],
    rider_ids: %w[RD0066, RD0003],
    ratings: [5, 2]
  },
  {
    driver_id: "DR0004",
    dates: %w[02/03/16 02/04/16 02/05/16],
    costs: [5, 10, 20],
    rider_ids: %w[RD0022 RD0022 RD0073],
    ratings: [5, 4, 5]
  }
]

########################################################
# Step 4: Total Driver's Earnings and Number of Rides

  # Use an iteration block to print driver's total rides and money made

# method to display hash contents
def display_hash(hash, symbol = nil)
  outputs = []

  hash.each do |key, value|
    outputs << "#{key}- #{symbol}#{value}"
  end

  return outputs
end


# create and display total_rides hash
total_rides = {}
all_rides.each do |item|
  total_rides[item[:driver_id]] = item[:dates].length
end

puts "Total rides per driver:"
puts display_hash(total_rides)


# create and display total_earnings hash
total_earnings = {}
all_rides.each do |item|
  total_earnings[item[:driver_id]] = item[:costs].sum
end

puts "Total earnings per driver:"
puts display_hash(total_earnings, "$")


# create and display average_ratings hash
average_ratings = {}
all_rides.each do |item|
    ratings_floats = item[:ratings].map do |r| r.to_f end
    average = ratings_floats.sum / ratings_floats.length
    average_ratings[item[:driver_id]] = '%.1f' % average
end

puts "Average rating per driver:"
puts display_hash(average_ratings)


# method to return key of highest hash value
def find_highest_hash_value(hash)

  highest_value = ""

  hash.each do |key, value|
    if value == hash.values.max
      highest_value = key
    end
  end

  return highest_value

end


# display highest earning driver
puts "Driver with highest earnings:"
puts find_highest_hash_value(total_earnings)


# display highest rated driver
puts "Driver with highest average rating:"
puts find_highest_hash_value(average_ratings)


# find date of highest earnings per driver
x = all_rides.length

highest_earnings_dates = []

x.times do |i|
  cost = all_rides[i][:costs]
  date = all_rides[i][:dates]
  max_index = cost.each_with_index.max[1]
  highest_earnings_dates << date[max_index]
end

# display date of highest earnings per driver
puts "Date of highest earnings per driver:"
x.times do |i|
  driver = all_rides[i][:driver_id]
  date =  highest_earnings_dates[i]
  puts "#{driver}: #{date}"
end
