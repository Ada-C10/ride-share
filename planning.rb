
########################################################
# Step 1: Establish the layers

# Write a list of the layers here

# driver_IDs
# ride share instances / rides
# date, cost, rider_id, rating

########################################################
# Step 2: Assign a data structure to each layer

# Copy your list from above, and write what data structure each layer should have

# driver_IDs --> Hash
# rideshare instances --> Array
# date, cost, rider_id, rating --> Hash

########################################################
# Step 3: Make the data structure!

# Setup the data structure and manually write in data presented in rides.csv

# see rideshare.rb

########################################################
# Step 4: Total Driver's Earnings and Number of Rides

# Use an iteration block to print driver's total rides and money made

# method get_earnings to get a single day's earnings
# method get_average_rating to get a person's average rating

# iterates through the hash of driver_ids (keys) and list_of_rides (array containing hashes of a single ride's details) to print out a single driver's details

# use max_by and sum to determine the driver with the most earnings and highest average rating
