########################################################
# Step 1: Establish the layers

  # Write a list of the layers here

trip
driver
date
rider
cost 
rating 

########################################################
# Step 2: Assign a data structure to each layer

  # Copy your list from above, and write what data structure each layer should have
trip = []
info = {:driver, :date, :rider, :cost, :rating}

########################################################
# Step 3: Make the data structure!

    # Setup the data structure and manually write in data presented in rides.csv
trip = [
  {:driver=> driverid
   :date => mdy
   :rider => riderid
   :cost => cost $
   :rating => some_integer
    },
    {:driver=> driverid
   :date => mdy
   :rider => riderid
   :cost => cost $
   :rating => some_integer
    }
   ]

########################################################
# Step 4: Total Driver's Earnings and Number of Rides

  # Use an iteration block to print driver's total rides and money made
