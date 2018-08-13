# Laura Barrera Martinez
# Last edited August 12, 2018
########################################################
# Step 1: Establish the layers
# best to achieve goal

# Write a list of the layers here
# 1. big array of drivers
# 2. a hash per each driver
# 3. an array for money made, and another one for trip dates
########################################################
# Step 2: Assign a data structure to each layer
# Copy your list from above, and write what data structure each layer should have
# see above
########################################################
# Step 3: Make the data structure!

# Setup the data structure and manually write in data presented in rides.csv
drivers = [
  {
    :driver_id => "DR0001",
    :rating => [3,4,2],
    :rider_id => ["RD0003","RD0015","RD0003"],
    :dates => ["3rd Feb 2016","3rd Feb 2016","5rd Feb 2016"],
    :transactions => [10, 30, 45]
  },
  {
    :driver_id => "DR0002",
    :rating => [5, 1, 3],
    :rider_id => ["DR0073", "DR0013", "DR0066"],
    :dates => ["3rd Feb 2016","4rd Feb 2016","5rd Feb 2016"],
    :transactions => [25, 15, 35]
  },
  {
    :driver_id => "DR0003",
    :rating => [5, 2],
    :rider_id => ["RD0066","RD0003"],
    :dates => ["4rd Feb 2016","4rd Feb 2016"],
    :transactions => [5, 50]
  },
  {
    :driver_id => "DR0004",
    :rating => [5, 4, 5],
    :rider_id => ["RD0022","RD0022","RD0073"],
    :dates => ["3rd Feb 2016","4rd Feb 2016","5rd Feb 2016"],
    :transactions => [5, 10, 20]
  }
]

########################################################
# Step 4: Total Driver's Earnings and Number of Rides

# Use an iteration block to print driver's total rides and money made
# prints required output for each driver

# initialize variables
totals_money = []
totals_rating = []

# merge repeated dates
# example:
# before: dates = ["3rd Feb 2016","3rd Feb 2016","5rd Feb 2016"]
#         transactions = [10, 10, 30]
# after: {"3rd Feb 2016"=>[10, 10], "5rd Feb 2016"=>[30]}
# key words: ruby hash of arrays - appending to one of the arrays
def merge(dates, transactions)
  hash = Hash.new()
  dates.each_with_index do |date, index|
    # if key is not present in the hash, create it with an array as the value
    hash[date] ||= [] # hash[key] = hash[key] || []
    hash[date] << transactions[index]
  end
  return hash
end

# reduce arrays in a hash
# example:
# before: {"3rd Feb 2016"=>[10, 10], "5rd Feb 2016"=>[30]}
# example: {"3rd Feb 2016"=>[20], "5rd Feb 2016"=>[30]}
def add_values_hash(hash)
  newhash = Hash.new()
  hash.each do |k, v|
    newhash[k] = v.reduce(:+)
  end
  return newhash
end

# select date that has the maximum value
def largest_hash_key(hash)
  hash.max_by { |k, v| v }[0]
end

# returns driver name that matches key-value pair
def find_driver(value, key, drivers)
  driver_name = ""
  drivers.each do |driver|
    if driver[key] == value
      driver_name = driver[:driver_id]
    end
  end
  return driver_name
end

# for each driver
drivers.each do |driver|
  driver[:money] = driver[:transactions].sum
  driver[:rides] = driver[:dates].count
  driver[:average_rating] = driver[:rating].sum / driver[:rating].count

  # append money made and rating to totals arrays
  # this will be used for calculating the maximum money made and highest rating
  totals_money << driver[:money]
  totals_rating << driver[:average_rating]

  # calculate the date in which the highest money was made
  if driver[:dates].uniq.length == driver[:dates].length # one trip per day
    max_money = driver[:transactions].max
    index_max_money = driver[:transactions].index(max_money)
    date_max_money = driver[:dates][index_max_money]
  else # multiple trips in one day
    driver[:transactions_per_date] = merge(driver[:dates],driver[:transactions])
    driver[:money_per_date] = add_values_hash(driver[:transactions_per_date])
    date_max_money = largest_hash_key(driver[:money_per_date])
  end
  puts "#{driver[:driver_id]}:\nhas given #{driver[:rides]} rides, has made a total of $#{driver[:money]}, \nher/his average rate is #{driver[:average_rating]}, and made the most money on #{date_max_money}\n\n"
end

# find the driver with the maximun amount made
max_money = totals_money.max
driver_max_money = find_driver(max_money,:money, drivers)

# find the driver with the maximun amount average rating
max_ave_rate = totals_rating.max
driver_max_ave_rate = find_driver(max_ave_rate,:average_rating,drivers)

puts "The driver that made the most money was #{driver_max_money}"
puts "The driver that had the highest average rating #{driver_max_ave_rate}"
