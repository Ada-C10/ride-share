########################################################
# Step 1: Establish the layers

  # Write a list of the layers here
  # - Main array
  #    + drivers, rides
  #       * date
  #       * cost
  #       * rider id
  #       * rating

########################################################
# Step 2: Assign a data structure to each layer
# +[main_array] - stores data by ordered index, is a collection of driver hashes and their sub data
#    - {driver hash} - stores symbol :driver_id and the string of driver_id as a key value  pair, and the symbol :rides as the key with as an ordered array as the value
#       * [{drive data}]  - the data of each individual drive is a hash of :date, :cost, :rider_id, and :rating stored in an ordered array

########################################################
# Step 3: Make the data structure!
#DRIVER_ID  DATE	       COST	 RIDER_ID	 RATING

# DR0001	 3rd Feb 2016	 10	   RD0003	   3
# DR0001	 3rd Feb 2016	 30	   RD0015	   4
# DR0001	 5th Feb 2016	 45	   RD0003	   2

# DR0002	 3rd Feb 2016	 25	   RD0073	   5
# DR0002	 4th Feb 2016	 15	   RD0013	   1
# DR0002	 5th Feb 2016	 35	   RD0066	   3

# DR0003	 4th Feb 2016	 5	   RD0066	   5
# DR0003	 5th Feb 2016	 50	   RD0003	   2

# DR0004	 3rd Feb 2016	 5	   RD0022	   5
# DR0004	 4th Feb 2016	 10	   RD0022	   4
# DR0004	 5th Feb 2016	 20	   RD0073	   5

uber_big_data = [
    { driver: "DR0001", rides: [
      { date: "3rd Feb 2016", cost: 10, rider_id: "RD0003", rating: 3 },
      { date: "3rd Feb 2016", cost: 30, rider_id: "RD0015", rating: 4 },
      { date: "5th Feb 2016", cost: 45, rider_id: "RD0003", rating: 2 },
      ]
    },
    { driver: "DR0002", rides: [
      { date: "3rd Feb 2016", cost: 25, rider_id: "RD0073", rating: 5 },
      { date: "4th Feb 2016", cost: 15, rider_id: "RD0013", rating: 1 },
      { date: "5th Feb 2016", cost: 35, rider_id: "RD0066", rating: 3 },
      ]
    },
      { driver: "DR0003", rides: [
      { date: "4th Feb 2016", cost: 5, rider_id: "RD0066", rating: 5 },
      { date: "5th Feb 2016", cost: 50, rider_id: "RD0003", rating: 2 },
      ]
    },
    { driver: "DR0004", rides: [
      { date: "3rd Feb 2016", cost: 5, rider_id: "RD0022", rating: 5 },
      { date: "4th Feb 2016", cost: 10, rider_id: "RD0022", rating: 4 },
      { date: "5th Feb 2016", cost: 20, rider_id: "RD0073", rating: 5 },
      ]
    }
 ]

########################################################
# Step 4: Total Driver's Earnings and Number of Rides
#
# 1: The number of rides each driver has given
def find_number_of_rides(data)
  ride_count = data.map do |driver|
    "#{driver[:driver]}: #{driver[:rides].count}"
  end
return ride_count
end
# 2: The total amount of money each driver has made

def total_each_earned(data)
  money_made = data.map do |driver|
    driver_made = 0
    driver[:rides].each do |ride|
      driver_made += ride[:cost]
    end
  "#{driver[:driver]}: #{driver_made}"
  end
return money_made
end

# # 3: The average rating for each driver

def find_driver_rating_averages(data)
  drivers_rating = data.map do |driver|
  rating = 0.0
  driver[:rides].each do |ride|
    rating += ride[:rating]
  end
  rating /= driver[:rides].length
  "#{driver[:driver]}: #{"%.2f" % rating}"
  end
  return drivers_rating
end

# # 4: Which driver made the most money?

def find_driver_with_most_money(data)
money_made = data.map do |driver|
  driver_made = 0
  driver[:rides].each do |ride|
  driver_made += ride[:cost]
end
{ driver_id: driver[:driver], made: driver_made }
end

most_money_made = money_made.max { |a, b| a[:made] <=> b[:made]}

return most_money_made
end
# # 5: Which driver has the highest average rating?

def find_driver_with_highest_rating(data)
drivers_rating = data.map do |driver|
  rating = 0.0
  driver[:rides].each do |ride|
    rating += ride[:rating]
  end
rating /= driver[:rides].length
{driver_id: driver[:driver], driver_rating: "%.2f" % rating}
end

highest_driver_rating = drivers_rating.max { |a, b| a[:driver_rating] <=> b[:driver_rating]}

return highest_driver_rating
end

def determine_output(data)
  input = gets.chomp.to_i
  if input == 1
    puts find_number_of_rides(data)
    print "\n: "
  elsif input == 2
    puts total_each_earned(data)
    print "\n: "
  elsif input == 3
    puts find_driver_rating_averages(data)
    print "\n: "
  elsif input == 4
    puts find_driver_with_most_money(data)
    print "\n: "
  elsif input == 5
    puts find_driver_with_highest_rating(data)
    print "\n: "
  elsif input == 6
    exit
  end
end

  puts "***** FooBER Driver Data System *****"
  puts "Enter selection to retrieve data."
  puts "1. Number of Rides, per driver"
  puts "2. Pay Earned, per driver"
  puts "3. Driver Ratings"
  puts "4. Highest Earning Driver"
  puts "5. Highest Rated Driver"
  puts "6. Exit"
  print "(1-6): "

loop do
  determine_output(uber_big_data)
end

# OPTIONAL - NOT FINISHED!
# For each driver, on which day did they make the most money?
  #
  # money_made = uber_big_data.map do |driver|
  #   driver_ride_compare = []
  #   count = 0
  #   driver[:rides].each do |ride|
  #     driver_ride_date = {ride[:date] => ride[:cost]}
  #     driver_ride_compare[count] = driver_ride_date
  #       count += 1
  #   end
  #   puts driver_ride_compare
  # end
  #
  # puts money_made
