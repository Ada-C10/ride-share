########################################################
# Step 1: Establish the layers
# all_data
# driver_id
# date - day, month, and year
# cost
# rider_id
# rating (customer rating of driver?)
#
#
# ########################################################
# # Step 2: Assign a data structure to each layer
#
# trips array filled with hashes of the following info:
#   driver_id:
#   date: - filled with a hash of various pieces.  day:, month:, year:
#   cost:
#   rider_id:
#   rating: (customer rating of driver?)

########################################################
# Step 3: Make the data structure!

trips = [
  {
    driver_id: "DR0004",
    date:
      {
        day: "3rd",
        month: "February",
        year: "2016"
      },
    cost: 5.0,
    rider_id: "RD0022" ,
    rating: 5.0 ,
  },
  {
    driver_id: "DR0001",
    date:
      {
        day: "3rd",
        month: "February",
        year: "2016"
      },
    cost: 10.0,
    rider_id: "RD0003" ,
    rating: 3.0 ,
  },
  {
    driver_id: "DR0002",
    date:
      {
        day: "3rd",
        month: "February",
        year: "2016"
      },
    cost: 25.0,
    rider_id: "RD0073" ,
    rating: 5.0 ,
  },
  {
    driver_id: "DR0001",
    date:
      {
        day: "3rd",
        month: "February",
        year: "2016"
      },
    cost: 30.0,
    rider_id: "RD0015" ,
    rating: 4.0 ,
  },
  {
    driver_id: "DR0003",
    date:
      {
        day: "4th",
        month: "February",
        year: "2016"
      },
    cost: 5.0,
    rider_id: "RD0066" ,
    rating: 5.0 ,
  },
  {
    driver_id: "DR0004",
    date:
      {
        day: "4th",
        month: "February",
        year: "2016"
      },
    cost: 10.0,
    rider_id: "RD0022" ,
    rating: 4.0 ,
  },
  {
    driver_id: "DR0002",
    date:
      {
        day: "4th",
        month: "February",
        year: "2016"
      },
    cost: 15.0,
    rider_id: "RD0013" ,
    rating: 1.0 ,
  },
  {
    driver_id: "DR0003",
    date:
      {
        day: "5th",
        month: "February",
        year: "2016"
      },
    cost: 50.0,
    rider_id: "RD0003" ,
    rating: 2.0 ,
  },
  {
    driver_id: "DR0002",
    date:
      {
        day: "5th",
        month: "February",
        year: "2016"
      },
    cost: 35.0,
    rider_id: "RD0066" ,
    rating: 3.0 ,
  },
  {
    driver_id: "DR0004",
    date:
      {
        day: "5th",
        month: "February",
        year: "2016"
      },
    cost: 20.0,
    rider_id: "RD0073" ,
    rating: 5.0 ,
  },
  {
    driver_id: "DR0001",
    date:
      {
        day: "5th",
        month: "February",
        year: "2016"
      },
    cost: 45.0,
    rider_id: "RD0003" ,
    rating: 2.0 ,
  },
]

# Step 4: Total Driver's Earnings and Number of Rides
# Iterate through the data structure to display, by printing in terminal, the following info:
#
# 1. The number of rides each driver has given
puts "Answer 1:"

#Creating an array of all of the Driver IDs
ids = []
trips.each_with_index do |i|
  ids << i[:driver_id]
end

# Determining how many rides each driver had.
ids.uniq.each do |i|
  number_of_trips = ids.count(i)
  puts "Driver ##{i} gave #{number_of_trips} rides."
end


# Creating a sorted array of each driverID -- without multiples
ids_unique = []
ids_unique = ids.uniq.sort


# 2. The total amount of money each driver has made

puts
puts "Answer 2:"
driver_earnings = []
4.times do |index|
# Why can't I use ids_unique.length or ids_unique.each rather than 4.times?  Similar question for below.
  current_driver_earnings = 0
  11.times do |i|
    if trips[i][:driver_id] == ids_unique[index]
      current_driver_earnings = trips[i][:cost] + current_driver_earnings
    end
  end
puts "Driver ##{ids_unique[index]} earned $#{current_driver_earnings.to_i}."
# Shovelling the driver earnings into a larger array for each driver.  This will be used later
driver_earnings << current_driver_earnings
end


# I can't figure out why the below method doesn't work for this program...

# big_array = []
# def gathering_info_from_unique_ids (overall , drivers)
#
# driver_earnings = 0
#
#   overall.length do |i|
#   driver_earnings_array = []
#     if i[:driver_id] == drivers[i]
#       driver_earnings = i[:cost] + driver_earnings
#       driver_earnings_array << driver_earnings
#     end
#   end
#   return driver_earnings_array
# end
#
# big_array = gathering_info_from_unique_ids(trips, ids_unique)
#
# puts "#{big_array}"


# 3. The average rating for each driver

#creating seperate arrays of driver ids and their ratings by pulling them out of the larger hashes
drivers = []
ratings = []
trips.each_with_index do |i|
  drivers << i[:driver_id]
  ratings << i[:rating]
end

#merging the above arrays into one larger array of smaller arrays
def merge_arrays (first, second)

large_array = []

  11.times do |i|
  smaller_array = []
    smaller_array << first[i]
    smaller_array << second[i]
    large_array << smaller_array
  end
  return large_array

end
driver_ratings_merged = merge_arrays(drivers, ratings)

puts
puts "Answer 3:"

#iterating through each of the unique driver IDs and pulling out the driver ratings for each driver, merging those into seperate arrays

driver_ratings = []
4.times do |index|
    current_driver_rating = []
    11.times do |i|
      if driver_ratings_merged[i][0] == ids_unique[index]
        current_driver_rating << driver_ratings_merged[i][1]
      end
    end

    # Determining the average, by dividing the sum of all of the ratings for the driver by the amount of rides that driver gave.
    current_driver_average_rating = current_driver_rating.reduce(:+)/current_driver_rating.count
    puts "Driver ##{ids_unique[index]} had an average driver rating of #{current_driver_average_rating.round(1)}."
    # inputting the average rating of each driver into a larger array that will be used in Question #5
    driver_ratings << current_driver_average_rating
end

# Can't figure out why creating a method like this doesn't workk either :(

# ratings = []
# def merging_arrays (name , rating)
#   driver_ratings = []
#
#    name.each_with_index do |names, rates|
#    current_driver_rating = 0
#      if names[i][0] == rates[i]
#        current_driver_rating = rates[i][1]
#          driver_ratings << current_driver_rating
#      end
#    end
#    return driver_ratings
# end
#
# ratings = merging_arrays(ids_unique, driver_ratings_merged)
# puts "#{ratings}"


# 4. Which driver made the most money?

# Creating an array of hashes with driver ID and earnings
merged_array = []
def merging_arrays_into_a_hash (list , earnings)

  driver_array = []
   list.each_with_index do |drivers , index|
     driver_info = {}
     driver_info[:name] = drivers
     driver_info[:earnings] = earnings[index]
     driver_array << driver_info
   end
   return driver_array
end

merged_array = merging_arrays_into_a_hash(ids_unique, driver_earnings)

#Sorting by earnings
merged_array_sorted = merged_array.sort_by {|name, earnings| earnings}

puts
puts "Answer 4:"
puts "The driver who earned the most is driver ##{merged_array_sorted[0][:name]} who earned $#{merged_array_sorted[0][:earnings].to_i}."


# 5. Which driver has the highest average rating?

#Creating a method to bring pair the 4 unique driver IDs with the corresponding average driver ratings determined above.
merged_array = []
def merging_arrays_into_a_hash (list , ratings)

  driver_array = []
   list.each_with_index do |drivers , index|
     driver_info = {}
     driver_info[:name] = drivers
     driver_info[:rating] = ratings[index]
     driver_array << driver_info
   end
   return driver_array
end

merged_array = merging_arrays_into_a_hash(ids_unique, driver_ratings)

#sorting through the array of hashes by the average rating
highest_rating = merged_array.sort_by {|name, rating| rating}
#
puts
puts "Answer 5:"
puts "The driver with the highest rating was driver #{highest_rating.last[:name]} with an average rating of #{highest_rating.last[:rating].round(1)} out of 5 stars."
