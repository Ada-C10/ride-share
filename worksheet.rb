########################################################
# Step 1: Establish the layers

  # Write a list of the layers here
  1. drivers
  2. driver
  3. ride number
  4. ride detail (date, cost, riderid, rating)
  5. date (day, month, year)

########################################################
# Step 2: Assign a data structure to each layer

  # Copy your list from above, and write what data structure each layer should have
  1. drivers (hash of drivers)
  2. driver (each driver is a hash key)
  3. rides (all rides of a driver listed inside an array)
  4. ride details (hash with date, cost, riderid, rating keys)
  5. date (hash of day, month, year keys)
########################################################
# Step 3: Make the data structure!

    # Setup the data structure and manually write in data presented in rides.csv

driver_data = {DR0001: [{date: {day: 3, month: "February", year: 2016}, cost: 10, rider_id: "RD0003", rating: 3},
                         {date: {day: 3, month: "February", year: 2016}, cost: 30, rider_id: "RD0015", rating: 4},
                         {date: {day: 5, month: "February", year: 2016}, cost: 45, rider_id: "RD0003", rating: 2}],
                DR0002: [{date: {day: 3, month: "February", year: 2016}, cost: 25, rider_id: "RD0073", rating: 5},
                         {date: {day: 4, month: "February", year: 2016}, cost: 15, rider_id: "RD0013", rating: 1},
                         {date: {day: 5, month: "February", year: 2016}, cost: 35, rider_id: "RD0066", rating: 3}],
                DR0003: [{date: {day: 4, month: "February", year: 2016}, cost: 5, rider_id: "RD0066", rating: 5},
                         {date: {day: 5, month: "February", year: 2016}, cost: 50, rider_id: "RD0003", rating: 2}],
                DR0004: [{date: {day: 3, month: "February", year: 2016}, cost: 5, rider_id: "RD0022", rating: 5},
                         {date: {day: 4, month: "February", year: 2016}, cost: 10, rider_id: "RD0022", rating: 4},
                         {date: {day: 5, month: "February", year: 2016}, cost: 20, rider_id: "RD0073", rating: 5}]}


########################################################
# Step 4: Total Driver's Earnings and Number of Rides

  # Use an iteration block to print driver's total rides and money made
