# Katricia Smith
# Ada-C10/ride-share
# https://github.com/Ada-C10/ride-share

# Create array of hashes from table data: each hash is one ride
drives = [
  #2
  {
  driver_id: "DR0004",
  date: {day: "3", day_suffix: "rd", month: "Feb", year: 2016},
  cost: 5.00,
  rider: "RD0022",
  rating: 5
},

#3
{
driver_id: "DR0001",
date: {day: "3", day_suffix: "rd", month: "Feb", year: 2016},
cost: 10.00,
rider: "RD0003",
rating: 3
},

#4
{
driver_id: "DR0002",
date: {day: "3", day_suffix: "rd", month: "Feb", year: 2016},
cost: 25.00,
rider: "RD0073",
rating: 5
},

#5
{
  driver_id: "DR0001",
  date: {day: "3", day_suffix: "rd", month: "Feb", year: 2016},
  cost: 30.00,
  rider: "RD0015",
  rating: 4
},

#6
{
driver_id: "DR0003",
date: {day: "4", day_suffix: "th", month: "Feb", year: 2016},
cost: 5.00,
rider: "RD0066",
rating: 5
},

#7
{
driver_id: "DR0004",
date: {day: "4", day_suffix: "th", month: "Feb", year: 2016},
cost: 10.00,
rider: "RD0022",
rating: 4
},


#8
{
driver_id: "DR0002",
date: {day: "4", day_suffix: "th", month: "Feb", year: 2016},
cost: 15.00,
rider: "RD0013",
rating: 1
},

#9
{
driver_id: "DR0003",
date: {day: "5", day_suffix: "th", month: "Feb", year: 2016},
cost: 50.00,
rider: "RD0003",
rating: 2
},

#10
{
driver_id: "DR0002",
date: {day: "5", day_suffix: "th", month: "Feb", year: 2016},
cost: 35.00,
rider: "RD0066",
rating: 3
},

#11
{
driver_id: "DR0004",
date: {day: "5", day_suffix: "th", month: "Feb", year: 2016},
cost: 20.00,
rider: "RD0073",
rating: 5
},

#12
{
driver_id: "DR0001",
date: {day: "5", day_suffix: "th", month: "Feb", year: 2016},
cost: 45.00,
rider: "RD0003",
rating: 2
}
]

# Define method for displaying numbers as string with two numbers after decimal
def print_decimal(variable)
  sprintf('%.2f', variable)
end

# Define method for comparing highest values  ## needs fixing
def compare_drivers(symbol, record, title, driver)

  if symbol > record
    record = symbol
    title = driver
  end

  highest_in_comparison = [record, title, driver]
  return highest_in_comparison
end

# Make new array of drivers
# all_drives_driver_array = []
#
# drives.each do |hash|
#   driver = hash[:driver_id]
#   all_drives_driver_array << driver
# end
all_drives_driver_array = drives.map {|hash| hash[:driver_id]}


# Create array of only unique drivers
unique_driver_array = all_drives_driver_array.uniq.sort!

# Create hash for each driver's stats and array for all hashes together
driver_stats_each = {}
driver_stats_all = []

unique_driver_array.each do |driver|
  # number_drives = all_drives_driver_array.count(driver)
  driver_stats_each = {"#{driver}" => {drives: 0, profits: 0, avg_rtg: 0.0}}
  driver_stats_all << driver_stats_each
end


# total_profit = 0
#
# drives.each.sum do |hash|
#   # total_profit = hash[:cost]  => 45 - only last cost
#   total_profit += hash[:cost] # => 250 -total of all drivers
# end
#
# puts "Total profits of all drivers: #{total_profit}"
# puts
# # if driver is x driver, + cost to :drives in stats array
# profit = 0


driver = "undefined"
total_drives = 0
current_earnings = 0
added_profit = 0
average_rating = 0
highest_rating = 0
highest_rated_driver = "unknown"
highest_profit = 0
highest_earner = "unknown"

# Output program heading text for user
puts "-"*4 + "Rideshare Driver Summary " + "-"*4

# Transform data from array of rides to array of individual driver summary hashes
driver_stats_all.each do |hash| #  {"DR0004"=>{:drives=>"3", :profits=>0}}
  hash.each do |key, value|  # |"DR0004" , {:drives=>"3", :profits=>0} |
    driver = key
    puts "\nDriver: #{driver}"
    ind_stats = value # => {:drives=>2, :profits=>0, :avg_rtg=>0}

    # Populate individual stats hashes by iterating over array of all drives
    drives.each do |hash|     # {:driver_id=>"DR0004", :date=>{:day=>"3", :day_suffix=>"rd", :month=>"Feb", :year=>2016}, :cost=>5.0, :rider=>"RD0022", :rating=>5}
      if hash.value?(driver)      # driver.class = string
      # Increase drive count by one
      ind_stats[:drives] += 1
      total_drives = ind_stats[:drives]

      # Add profits from drive array to individual stats hash
      previous_earnings = ind_stats[:profits]
      added_profit = hash[:cost]
      ind_stats[:profits] = previous_earnings + added_profit
      current_earnings = ind_stats[:profits]

      # Assign the drive rating average to individual rating key
      ind_stats[:avg_rtg] = (ind_stats[:avg_rtg] + hash[:rating]) / ind_stats[:drives]
      average_rating = ind_stats[:avg_rtg]
      end

    end

    # Print summary of each driver's rides, rating, and profits
      puts "   Total rides: #{total_drives}"
      puts "   Total earnings: $" + print_decimal(current_earnings)
      puts "   Average rating: " + print_decimal(average_rating)

    # Compare total profit to previous driver profit to check if highest
    
    # compare_drivers(ind_stats[:profits], highest_profit, highest_earner, driver)    #method does not work properly

    if ind_stats[:profits] > highest_profit
      highest_profit = ind_stats[:profits]
      highest_earner = driver
    end

    if ind_stats[:avg_rtg] > highest_rating
      highest_rating = ind_stats[:avg_rtg]
      highest_rated_driver = driver
    end

  end
end

# Which driver made the most money?
puts "\nHighest earner: Driver ##{highest_earner}- $" + print_decimal(highest_profit)
# Which driver has the highest average rating?
puts "Highest rated overall: Driver ##{highest_rated_driver} - " + print_decimal( highest_rating)


# Optionally, print in the terminal:
#
# For each driver, on which day did they make the most money?
