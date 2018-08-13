########################################################
# OBJECTIVE:
### Refactor array of hashes used in original solution
# Step 1: Establish the layers
# Write a list of the layers here
# - Collection of drivers as an array
# -- containing a collection of driver data (driver_id, rides, total_earn, avg_rating)
# -- driver id, total_earn, and avg_rating each only have one value associated 
# --- rides contains a collection of data for each ride given (date, cost, rider, rating)

########################################################
# Step 2: Assign a data structure to each layer
# Copy your list from above, and write what data structure each layer should have
# drivers_arr: array of hashes containing the following data for each hash
# -- driver_id(key)  => driver's id number(value) 
# -- total_earning(key) ==> calculated total earnings for all rides(value)
# -- average_rating(key) ==> calculated average rating all rides(value)
# -- rides(key) ==> array of hashes storing each ride's data(value)
# --- each ride hash: 
#                     date(key) ==> date of ride(value)
#                     cost(key) ==> cost of ride(value)
#                     rider(key) ==> rider id(value)
#                     rating(key) ==> rateing for ride(value)

########################################################
# find driver w/ most earnings
def find_highest_earners(input_arr)
  # look through drivers array to find driver hash with greatest
  # total earnings -> apply max_by to the hash of drivers to find
  # the greatest value associated with the [:total_earn] key
  # -> set max_earn_val to the value identified from the returned
  # max_by hash
  max_earn_val = input_arr.max_by { |k| k[:total_earn] }[:total_earn]
  # p max_earn_val
  # handle multiple top earners
  # create an array that selects driver_hash(es) that match the
  # established max earn value
  top_earn_arr = input_arr.select { |k| k[:total_earn] == max_earn_val }
                          .map { |h| h[:driver_id] }
  return top_earn_arr
end

# determine the max avg rating value within drivers hash
def find_best_rated(input_arr)
  max_rate_val = input_arr.max_by { |k| k[:avg_rate] }[:avg_rate]
  top_rated_arr = input_arr.select { |k| k[:avg_rate] == max_rate_val }
                           .map { |h| h[:driver_id] }
  return top_rated_arr
end

# Data structure
drivers_arr = [
  {
    driver_id: 'DR0001',
    rides: [{
      date: '03/02/2016',
      cost: 10,
      rider_id: 'RD0003',
      rating: 3
    }, {
      date: '03/02/2016',
      cost: 30,
      rider_id: 'RD0015',
      rating: 4
    }, {
      date: '05/02/2016',
      cost: 45,
      rider_id: 'RD0003',
      rating: 2
    }]
  },
  {
    driver_id: 'DR0002',
    rides: [{
      date: '03/02/2016',
      cost: 25,
      rider_id: 'RD0073',
      rating: 5
    }, {
      date: '04/02/2016',
      cost: 15,
      rider_id: 'RD0013',
      rating: 1
    }, {
      date: '05/02/2016',
      cost: 35,
      rider_id: 'RD0066',
      rating: 3
    }]
  },
  {
    driver_id: 'DR0003',
    rides: [{
      date: '04/02/2016',
      cost: 5,
      rider_id: 'RD0066',
      rating: 5
    }, {
      date: '05/02/2016',
      cost: 50,
      rider_id: 'RD0003',
      rating: 2
    }]
  },
  {
    driver_id: 'DR0004',
    rides: [{
      date: '03/02/2016',
      cost: 5,
      rider_id: 'RD0022',
      rating: 5
    }, {
      date: '04/02/2016',
      cost: 5,
      rider_id: 'RD0022',
      rating: 4
    }, {
      date: '05/02/2016',
      cost: 20,
      rider_id: 'RD0073',
      rating: 5
    }]
  }
]


########################################################
# Iterate through the data structure to display, by printing in
# terminal, the following info:
# - The number of rides each driver has given
# - The total amount of money each driver has made
# - The average rating for each driver
puts "\n\nWelcome to Ubyftier, the Rubyist's Rideshare!\n\n"
drivers_arr.each do |driver_hash|
  # determine of rides
  count = driver_hash[:rides].count
  # p driver_hash[:rides]
  # determine total earnings
  # b/c working with an array of hashes need to map the cost of
  # each ride to a temp array -> apply sum operation to reduce
  # that array to a single value equaling the total money made
  total_earn = driver_hash[:rides].map { |ride_hash| ride_hash[:cost] }.reduce(:+)
  # p total_earn
  # to find the avg rating use similar approach to methods used
  # to find the total earnings using long format
  # ????? why does using this approach require the 'inital' parameter to be 0 ?????
  # ????? why does this error out when no 0 ??????????????? 
  sum_rate = driver_hash[:rides].reduce(0) do |sum, ride|
    sum + ride[:rating]
  end
  # determin avg rating for each driver
  avg_rate = (sum_rate / count.to_f).round(1)
  puts %(Driver #{driver_hash[:driver_id]} made $#{sprintf('%0.2f', total_earn)} \
providing #{count} rides with an average rating of #{avg_rate}.)
  # store the calculated k,v pairs to each driver hash
  driver_hash[:total_earn] = total_earn
  driver_hash[:avg_rate] = avg_rate
  # determine which day the driver made the most money
  money_ride = driver_hash[:rides].max_by { |k| k[:cost] }
  puts "They earned the most on #{money_ride[:date]}.\n"
end

top_earners_arr = find_highest_earners(drivers_arr)
# p top_earners_arr
# count items in top earn array to determine if
# tie among multiple top earners
puts
puts '$' * 50
if top_earners_arr.count > 1
  puts 'There was a tie!'
  (top_earners_arr.count - 1).times do |i|
    print top_earn_arr[i] + ', '
  end
  print "and #{top_earners_arr[-1]} has the most earnings!"
else
  puts "#{top_earners_arr[0]} has the most earnings!"
end

best_rated_arr = find_best_rated(drivers_arr)
puts '*' * 50
if best_rated_arr.count > 1
  puts 'There was a tie!'
  (best_rated_arr.count - 1).times do |i|
    print best_rated_arr[i] + ', '
  end
  print "and #{best_rated_arr[-1]} has the highest average rating!"
else
  puts "#{best_rated_arr[0]} has the highest average rating!"
end
puts

