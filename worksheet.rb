########################################################
# Step 1: Establish the layers

  # Write a list of the layers here

  # 1- The driver layer: a list of all the drivers who work for the rideshare company
  # 2- The driver details layer: a collection of the details of the driver ID number, fares collected, ratings from riders, dates of rides, and rider id numbers
  # 3- The ride details layer:  another list which provides details of rides for each of layer 2's catagories pertaining to individual rides.

########################################################
# Step 2: Assign a data structure to each layer

  # Copy your list from above, and write what data structure each layer should have
  # 1- ARRAY The driver layer: a list of all the drivers who work for the rideshare company
  # 2- HASH The driver details layer: a collection of the details of the driver ID number, fares collected, ratings from riders, dates of rides, and rider id numbers
  # 3- ARRAY The ride details layer:  another list which provides details of rides for each of layer 2's catagories pertaining to individual rides.

#########################

########################################################
# Step 3: Make the data structure!

  # Setup the data structure and manually write in data presented in rides.csv

  rideshare_drivers = [
  
    # DR0001
    {
      id: "DR0001",
      date: [ "Feb 3, 2016", "Feb 3, 2016", "Feb 5, 2016" ],
      fares: [ 10, 30, 45 ],
      ratings: [ 3, 4, 2 ],
      riders: [ "RD003", "RD0015", "RD002" ]
    },
  
    # DR0002
    {
      id: "DR0002",
      date: [ "Feb 3, 2016", "Feb 4, 2016", "Feb 5, 2016" ],
      fares: [ 25, 15, 35 ],
      ratings: [ 5, 1, 3],
      riders: [ "RD0073", "RD0013", "RD0066"]
    },
  
    # DR0003
    {
      id: "DR0003",
      date: [ "Feb 4, 2016", "Feb 5, 2016" ],
      fares: [ 5, 50 ],
      ratings: [ 5, 2 ],
      riders: [ "RD0066", "RD0003" ]
    },
  
    # DR0004
    {
      id: "DR0004",
      date: [ "Feb 3, 2016", "Feb 4, 2016", "Feb 5, 2016" ],
      fares: [ 5, 10, 20 ],
      ratings: [ 5, 4, 5 ],
     riders: [ "RD0022", "RD0022", "RD0073" ]
    }
  ]

########################################################
# Step 4: Total Driver's Earnings and Number of Rides

  # Use an iteration block to print DRIVERS TOTAL RIDE and MONEY MADE

  # The number of rides each driver has given
  def rides_given(arr_rideshare)
    rides_by_driver = []
    arr_rideshare.each do | hashes |
    sentence_string = "Driver with ID ##{hashes[:id]} gave a total of  #{hashes[:date].count} rides"
    rides_by_driver << sentence_string
   end
   return rides_by_driver
  end

  # The total amount of money each driver has made
  def driver_payday(arr_rideshare)
    driver_mula = []
    arr_rideshare.each do | hashes |
    sentence_string = "Driver with ID ##{hashes[:id]} made $#{hashes[:fares].sum}.00"
    driver_mula << sentence_string
  end
  return driver_mula
  end

  # Most money methods
  # Find max money made from all the drivers
  def find_max(arr_rideshare)
    driver_fares = []
    arr_rideshare.each do | hashes |
      fare_sum = hashes[:fares].sum
      driver_fares << fare_sum
    end
  max_moneymaker = driver_fares.max
  return max_moneymaker
  end

  # Match individual sums to max, store a variable containing a sentence for max sum in an array (accounts for potential ties in the future)
  def find_biggest_payday(arr_rideshare)
    most_money = []
    arr_rideshare.each do | hashes |
      if hashes[:fares].sum == find_max(arr_rideshare)
        string_sentence = "Driver with ID ##{hashes[:id]} had the biggest payday"
        most_money << string_sentence
      end
    end
  return most_money
  end

  # Total rides print outs
  driver_rides = rides_given(rideshare_drivers)
  puts driver_rides

  # Total money print outs
  driver_money = driver_payday(rideshare_drivers)
  puts driver_money

  # Most money print outs
  most_money = find_biggest_payday(rideshare_drivers)
  puts most_money
