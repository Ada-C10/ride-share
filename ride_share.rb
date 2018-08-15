########################################################
# Step 1: Establish the layers

  # Write a list of the layers here
  # 1. One big array
  # 2. 11 small hashes
  # 3. Each hash has 5 symbols and 5 values
########################################################
# Step 2: Assign a data structure to each layer

  # Copy your list from above, and write what data structure each layer should have
  # Write a list of the layers here
  # 1. One big array
    # This array should have 11 small hashes
  # 2. 11 small hashes
    # Each has should have 5 symbols as keys with 5 values
  # 3. Each hash has 5 symbols and 5 values
    # Each hash should have a symbol and value
########################################################
# Step 3: Make the data structure!

  # Setup the data structure and manually write in data presented in rides.csv

# shows the data of a rideshare service and the ride history
# each ride history shows the driver id, date, cost,
# rider id, and rating
# there's total of 11 history shown below
ride_share_total_data = [
  {
    :driver_id => "DR0004",
    :date => "3rd Feb 2016",
    :cost => 5,
    :rider_id => "RD0022",
    :rating => 5
  },
  {
    :driver_id => "DR0001",
    :date => "3rd Feb 2016",
    :cost => 10,
    :rider_id => "RD0003",
    :rating => 3
  },
  {
    :driver_id => "DR0002",
    :date => "3rd Feb 2016",
    :cost => 25,
    :rider_id => "RD0073",
    :rating => 5
  },
  {
    :driver_id => "DR0001",
    :date => "3rd Feb 2016",
    :cost => 30,
    :rider_id => "RD0015",
    :rating => 4
  },
  {
    :driver_id => "DR0003",
    :date => "4th Feb 2016",
    :cost => 5,
    :rider_id => "RD0066",
    :rating => 5
  },
  {
    :driver_id => "DR0004",
    :date => "4th Feb 2016",
    :cost => 10,
    :rider_id => "RD0022",
    :rating => 4
  },
  {
    :driver_id => "DR0002",
    :date => "4th Feb 2016",
    :cost => 15,
    :rider_id => "RD0013",
    :rating => 1
  },
  {
    :driver_id => "DR0003",
    :date => "5th Feb 2016",
    :cost => 50,
    :rider_id => "RD0003",
    :rating => 2
  },
  {
    :driver_id => "DR0002",
    :date => "5th Feb 2016",
    :cost => 35,
    :rider_id => "RD0066",
    :rating => 3
  },
  {
    :driver_id => "DR0004",
    :date => "5th Feb 2016",
    :cost => 20,
    :rider_id => "RD0073",
    :rating => 5
  },
  {
    :driver_id => "DR0001",
    :date => "5th Feb 2016",
    :cost => 45,
    :rider_id => "RD0003",
    :rating => 2
  }
]
########################################################
# Step 4: Total Driver's Earnings and Number of Rides

  # first question:
  # The number of rides each driver has given

# created empty arrays to store each driver's information
# and to access the information later on
first_driver = []
second_driver = []
third_driver = []
fourth_driver = []

# sorts the big data by driver id
# then stores it into each array
ride_share_total_data.each do |data|
  if data.value?("DR0001")
    first_driver << data
  elsif data.value?("DR0002")
    second_driver << data
  elsif data.value?("DR0003")
    third_driver << data
  elsif data.value?("DR0004")
    fourth_driver << data
  end
end

# displays the number of times the driver has drove recently
puts "The number of rides each driver has given is shown below:"
puts "Driver with ID: DR0001, drove #{first_driver.length} times."
puts "Driver with ID: DR0002, drove #{second_driver.length} times."
puts "Driver with ID: DR0003, drove #{third_driver.length} times."
puts "Driver with ID: DR0004, drove #{fourth_driver.length} times."

############################################
# second question
# The total amount of money each driver has made

# empty array to store amount of money earned
# by each driver
everyones_total_income = []

# empty array to store all driver's id
all_drivers_ids = []

# adds up all the income the driver has earned
# throughout the ride share history
def money_earned_by_driver(driver)
  sum = 0.0

  driver.each do |money|
    earned = money[:cost]
    sum += earned.round(2)
  end

  return sum
end

# stores each driver's total income earned throughout
# rideshare history and stores it into array
first_drivers_income = money_earned_by_driver(first_driver)
everyones_total_income << first_drivers_income

second_drivers_income = money_earned_by_driver(second_driver)
everyones_total_income << second_drivers_income

third_drivers_income = money_earned_by_driver(third_driver)
everyones_total_income << third_drivers_income

fourth_drivers_income = money_earned_by_driver(fourth_driver)
everyones_total_income << fourth_drivers_income

# finds the driver_id
def each_drivers_id(driver_info)
  id = driver_info.first[:driver_id]
  return id
end

# stores the id of each driver into thes same array
all_drivers_ids << each_drivers_id(first_driver)
all_drivers_ids << each_drivers_id(second_driver)
all_drivers_ids << each_drivers_id(third_driver)
all_drivers_ids << each_drivers_id(fourth_driver)

# displays result to user
puts "\nThe total amount each driver has made is shown below:"

# shows the id and income earned by each driver
everyones_total_income.zip(all_drivers_ids).each do |amount, id|
  puts "Driver with id: #{id}, earned $ #{amount.round(2)}."
end

#########################################
# question 3
# average rating for each driver

# empty array to store each driver's rating
everyones_ratings = []

# calculates the average rating of each driver
def average_rating(driver)
  sum = 0.0
  
  driver.each do |find_rating|
    driver_rating = find_rating[:rating]
    sum += driver_rating
  end

  average = sum / driver.length

  return average
end

# stores the average rating in the array to access
# the rating later on
first_drivers_rating = average_rating(first_driver)
everyones_ratings << first_drivers_rating

second_drivers_rating= average_rating(second_driver)
everyones_ratings << second_drivers_rating

third_drivers_rating = average_rating(third_driver)
everyones_ratings << third_drivers_rating

fourth_drivers_rating = average_rating(fourth_driver)
everyones_ratings << fourth_drivers_rating

# displays result to user by showing the driver id with
# average rating
puts "\nThe average rating of each driver is shown below:"
everyones_ratings.zip(all_drivers_ids).each do |rating, id|
  puts "Driver with id: #{id}, received average score of #{rating.round(1)}."
end

##############################################
# question 4
# which driver made the most money?

# finds the highest number from the array that
# holds all the driver's total income
highest_amount_earned = everyones_total_income.max

# the driver that has the same income as the highest income
# is displayed to the user as the driver who made the most money
everyones_total_income.zip(all_drivers_ids).each do |amount, id|
  if amount == highest_amount_earned
    puts "\nThe driver who made the most money is: #{id}"
  end
end

##############################################
# question 5
# Which driver has the highest average rating?

# finds the highest number from the array that
# holds all the driver's average ratings
highest_rating = everyones_ratings.max

# the driver that has the same rating as the highest rating
# is displayed to the user as the driver who got the highest rating
everyones_ratings.zip(all_drivers_ids).each do |rating, id|
  if rating == highest_rating 
    puts "\nThe driver who receiced the highest rating is: #{id}"
  end
end
