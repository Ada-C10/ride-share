########################################################
# Step 1: Establish the layers

  # Write a list of the layers here

# Within the drivers hash, there are 3 layers: driver id, rides/money/rating and the ratings layer
# is an array to hold the values. 

########################################################
# Step 2: Assign a data structure to each layer

  # Hash for drivers. Driver ID hash holds rides, money and rating. Ratings data in an array. 

########################################################
# Step 3: Make the data structure!

    # Setup the data structure and manually write in data presented in rides.csv

rides = [
  {
    driver_ID: 'DR0004',
    date: '3rd Feb 2016',
    cost:  5,
    rider_id: 'RD0022',
    rating: 5
  },
  {
    driver_ID: 'DR0001',
    date: '3rd Feb 2016',
    cost:  10,
    rider_id: 'RD0003',
    rating: 3
  },
  {
    driver_ID: 'DR0002',
    date: '3rd Feb 2016',
    cost:  25,
    rider_id: 'RD0073',
    rating: 5
  },
  {
    driver_ID: 'DR0001',
    date: '3rd Feb 2016',
    cost:  30,
    rider_id: 'RD0015',
    rating: 4
  },
  {
    driver_ID: 'DR0003',
    date: '4th Feb 2016',
    cost:  5,
    rider_id: 'RD0066',
    rating: 5
  },
  {
    driver_ID: 'DR0004',
    date: '4th Feb 2016',
    cost:  10,
    rider_id: 'RD0022',
    rating: 4
  },
  {
    driver_ID: 'DR0002',
    date: '4th Feb 2016',
    cost:  10,
    rider_id: 'RD0013',
    rating: 1
  },
  {
    driver_ID: 'DR0003',
    date: '5th Feb 2016',
    cost:  50,
    rider_id: 'RD0003',
    rating: 2
  },
  {
    driver_ID: 'DR0002',
    date: '5th Feb 2016',
    cost:  35,
    rider_id: 'RD0066',
    rating: 3
  },
  {
    driver_ID: 'DR0004',
    date: '5th Feb 2016',
    cost:  20,
    rider_id: 'RD0073',
    rating: 5,
  },
  {
    driver_ID: 'DR0001',
    date: '5th Feb 2016',
    cost:  45,
    rider_id: 'RD0073',
    rating: 2,
  },
]


drivers = {
  'DR0001': {
    rides: 3,
    money: 85,
    ratings: [3, 4, 2]
  },
  'DR0002': {
    rides: 3,
    money: 75,
    ratings: [5, 1, 3]
  },
  'DR0003': {
    rides: 2,
    money: 55,
    ratings: [5, 2]
  },
  'DR0004': {
    rides: 3,
    money: 35,
    ratings: [5, 4, 5]
  }
}

########################################################
# Step 4: Total Driver's Earnings and Number of Rides

  # Use an iteration block to print driver's total rides and money made


puts """

+-+-+-+-+-+-+-+-+-+-+-+-+
Based on the provided data,
here are some statistics for our rideshare drivers:
+-+-+-+-+-+-+-+-+-+-+-+-+

"""


drivers.each do |driver, data|
  data[:average_rating] = data[:ratings].sum / data[:rides]
  puts "Driver ID: #{driver}, drove #{data[:rides]} times and made a total of $#{data[:money]}."
  puts "The average rating for this driver is #{data[:average_rating]} stars."
  puts
end

def most_money(driver_data)
  driver_id = nil
  most_money = 0

  driver_data.each do |driver, data|
    if data[:money] > most_money
      driver_id = driver
      most_money = data[:money]
    end
  end

  return driver_id

end

puts "Overall: "
puts "#{most_money(drivers)} made the most money."


def get_top_rating(driver_data)
  driver_id = nil
  top_rating = 0

  driver_data.each do |driver, data|
    if data[:average_rating] > top_rating
      driver_id = driver
      top_rating = data[:average_rating]
    end
  end

  return driver_id

end

puts "#{get_top_rating(drivers)} has the current highest average rating."

puts 

