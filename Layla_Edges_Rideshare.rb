# Using the provided data, created an array to hold hashes for each entry.

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

# Based on the information provided, created a hash to hold the driver information.

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
puts """

+-+-+-+-+-+-+-+-+-+-+-+-+
Based on the provided data,
here are some statistics for our rideshare drivers:
+-+-+-+-+-+-+-+-+-+-+-+-+

"""

# Loop that iterates through the hash and provides information on the money each driver made and their average rating. 

drivers.each do |driver, data|
  data[:average_rating] = data[:ratings].sum / data[:rides]
  puts "Driver ID: #{driver}, drove #{data[:rides]} times and made a total of $#{data[:money]}."
  puts "The average rating for this driver is #{data[:average_rating]} stars."
  puts
end

# Created a method to determine which driver made the most money.

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

# Created a method to determine which driver has the highest average rating. 

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
