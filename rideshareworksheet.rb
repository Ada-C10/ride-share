########################################################
# Step 1: Establish the layers
  # Write a list of the layers here
# Outer layer is the file itself, then it is broken down
# into drivers, dates, cost, rider, and the rating for each of the rides.
########################################################
# Step 2: Assign a data structure to each layer
  # Copy your list from above, and write what data structure each layer should have
# the outer structure is a hash, each key in the hash is a driver, the values of the
# hash is an array of hashes that contain all trip information.
########################################################
# Step 3: Make the data structure!
    # Setup the data structure and manually write in data presented in rides.csv
# The data structure is below. If I had to do it over again, I would change my data strcture
#   it became difficult to iterate over the information in a loop. My code repeats WAY too much because
#   I wasn't clear how to iterate over it cleanly. I might have tried to made this backwards, as in I would think about
# what data I was going to have to access and how my iteration blocks would look BEFORE settling on a data structure.
########################################################
# Step 4: Total Driver's Earnings and Number of Rides
  # Use an iteration block to print driver's total rides and money made
  # As I said above, my code is not as dry as I would like it. I shouldn't be repeating so much, but I was
  # unable to clearly iterate through some parts of code to make it dry. I did incorporate enumerables like map and inject
  # and that made my code better.
  ######################################################

  rideshare=


  { DR0001: [{
    driverID: 'DR0001',
    date: "3rd Feb 2016",
    cost:10,
    riderID: 'RD0003',
    rating:3
  },
  {
    driverID: 'DR0001',
    date: "3rd Feb 2016",
    cost:30,
    riderID: 'RD0015',
    rating:4
  },
  {
    driverID: 'DR0001',
    date: "5th Feb 2016",
    cost:45,
    riderID: 'RD0003',
    rating:2
  }],

  DR0002: [{
    driverID: 'DR0002',
    date: "3rd Feb 2016",
    cost: 25,
    riderID: 'RD0073',
    rating:5
  },
  {
    driverID: 'DR0002',
    date: "4th Feb 2016",
    cost:15,
    riderID: 'RD0013',
    rating:1
  },
  {
    driverID: 'DR0002',
    date: "5th Feb 2016",
    cost: 35,
    riderID: 'RD0066',
    rating: 3
  }],

  DR0003: [{
    driverID: 'DR0003',
    date: "4th Feb 2016",
    cost:5,
    riderID: 'RD0066',
    rating:5
  },
  {
    driverID: 'DR0003',
    date: "5th Feb 2016",
    cost:50,
    riderID: 'RD0003',
    rating:2
  }],

  DR0004: [{
    driverID: 'DR0004',
    date: "3rd Feb 2016",
    cost:5,
    riderID: 'RD0022',
    rating:5
  },
  {
    driverID: 'DR0004',
    date: "4th Feb 2016",
    cost:10,
    riderID: 'RD0022',
    rating:4
  },
  {
    driverID: 'DR0004',
    date: "5th Feb 2016",
    cost:20,
    riderID: 'RD0073',
    rating:5
    }]}

    drivers = rideshare.map do |key, value|
      "#{key}"
    end

    rideshare.each do |key, value|
      puts "Total rides given by #{key}: #{value.length}"
    end

    puts "******" * 10

    driver1_total = []
    driver1_rate = []
    driver1_average_rating = 0
    i = 0
    until i == rideshare[:DR0001].length
      driver1_total << rideshare[:DR0001][i][:cost]
      driver1_rate << rideshare[:DR0001][i][:rating]
      driver1_average_rating =  driver1_rate.inject(:+) / rideshare[:DR0001].length
      i += 1
    end
    puts "Total $ made by #{drivers[0]}: #{driver1_total.inject(:+)}"
    puts "Average rating for #{drivers[0]}: #{driver1_average_rating}"
    puts "******" * 10

    driver2_total = []
    driver2_rate = []
    driver2_average_rating = 0
    i = 0
    until i == rideshare[:DR0002].length
      driver2_total << rideshare[:DR0002][i][:cost]
      driver2_rate << rideshare[:DR0002][i][:rating]
      driver2_average_rating = driver2_rate.inject(:+) / rideshare[:DR0002].length
      i += 1
    end
    puts "Total $ made by #{drivers[1]}: #{driver2_total.inject(:+)}"
    puts "Average rating for #{drivers[1]}: #{driver2_average_rating}"
    puts "******" * 10

    driver3_total = []
    driver3_rate = []
    driver3_average_rating = 0
    i = 0
    until i == rideshare[:DR0003].length
      driver3_total << rideshare[:DR0003][i][:cost]
      driver3_rate << rideshare[:DR0003][i][:rating]
      driver3_average_rating =  driver3_rate.inject(:+) / rideshare[:DR0003].length
      i += 1
    end
    puts "Total $ made by #{drivers[2]}: #{driver3_total.inject(:+)}"
    puts "Average rating for #{drivers[2]}: #{driver3_average_rating}"
    puts "******" * 10

    driver4_total = []
    driver4_rate = []
    driver4_average_rating = 0
    i = 0
    until i == rideshare[:DR0004].length
      driver4_total << rideshare[:DR0004][i][:cost]
      driver4_rate << rideshare[:DR0004][i][:rating]
      driver4_average_rating = driver4_rate.inject(:+) / rideshare[:DR0004].length
      i += 1
    end
    puts "Total $ made by #{drivers[3]} : #{driver4_total.inject(:+)}"
    puts "Average rating for #{drivers[3]}: #{driver4_average_rating}"
    puts "******" * 10


    money_totals = [driver1_total.inject(:+),driver2_total.inject(:+),driver3_total.inject(:+),driver4_total.inject(:+)]
    driver_most = money_totals.max

    i = 0
    while i < 5
      if money_totals [i] == driver_most
        puts "#{drivers[i]} made the most money: $#{driver_most}"
      end
      i += 1
    end

    rating_totals = [driver1_average_rating, driver2_average_rating, driver3_average_rating, driver4_average_rating]
    highest_rating = rating_totals.max
    i = 0
    while i < 5
      if rating_totals [i] == highest_rating
        puts "#{drivers[i]} has the highest rating: #{highest_rating}"
      end
      i += 1
    end
