########################################################
# Step 1: Establish the layers

# A variable to store all our data, a layer for the driver, and a layer for the rides given by each driver.

########################################################
# Step 2: Assign a data structure to each layer
=begin
The highest level will be an array of hashes to represent each driver. (first layer)
The driver ID will be the key for each of these hashes (2nd layer) and the value associated with
with the driver will be an array filled with hashes for each ride. (3rd layer)
=end
########################################################
# Step 3: Make the data structure!

# Setup the data structure and manually write in data presented in rides.csv


driver_data = [{
  DR0004: [
    {
      date: "3rd Feb 2016",
      cost: 5,
      riderID: "RD0022",
      rating: 5
    },
    {
      date: "4th Feb 2016",
      cost: 10,
      riderID: "RD0022",
      rating: 4
    },
    {
      date: "5th Feb 2016",
      cost: 20,
      riderID: "RD0073",
      rating: 5
    }
    ]},
    {
      DR0001: [
        {
          date: "3rd Feb 2016",
          cost: 10,
          riderID: "RD0073",
          rating: 5
        },
        {
          date: "3rd Feb 2016",
          cost: 30,
          riderID: "RD0015",
          rating: 4
        },
        {
          date: "5th Feb 2016",
          cost: 45,
          riderID: "RD0003",
          rating: 2
        }
        ]},
        {
          DR0003: [
            {
              date: "4th Feb 2016",
              cost: 5,
              riderID: "RD0066",
              rating: 5
            },
            {
              date: "5th Feb 2016",
              cost: 50,
              riderID: "RD0003",
              rating: 2
            }
            ]},
            {
              DR0002: [
                {
                  date: "4th Feb 2016",
                  cost: 15,
                  riderID: "RD0013",
                  rating: 1
                },
                {
                  date: "5th Feb 2016",
                  cost: 35,
                  riderID: "RD0063",
                  rating: 3
                },
                {
                  date: "3rd Feb 2016",
                  cost: 25,
                  riderID: "RD0073",
                  rating: 5
                }
                ]}]

                #variables later used to find highest paid driver
                max_payment = 0
                money_bags = ""

                #variables used to find driver with highest average rating
                max_rating = 0
                vip = ""

                puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
                #Inside the driver_data array
                driver_data.each do |driver_hash|
                  #iterating through each driver hash (key is driver ID)
                  driver_hash.each do |driver, ride_data|

                    ride_count = ride_data.count
                    payments = ride_data.reduce(0) {|sum, ride| sum + ride[:cost] }
                    rating = (ride_data.reduce(0) {|sum, ride| sum + ride[:rating]}).to_f.round(2) / 2
                    max_ride = ride_data.max_by {|ride| ride[:cost] }
                    max_paydate = max_ride[:date]

                    puts "#{driver} has given #{ride_count} rides."
                    puts "#{driver} has been paid $#{payments}.00 total."
                    puts "#{driver} has an average rating of #{rating}"
                    puts "#{driver} made the most money on #{max_paydate}"
                    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

                    # finding the highest paid driver
                    if payments > max_payment
                      max_payment = payments
                      money_bags = driver.to_s
                    end
                    # finding the driver with the highest rating
                    if rating > max_rating
                      max_rating = rating
                      vip = driver.to_s
                    end
                  end
                end

                puts "#{money_bags} made the most money out of all the drivers."
                puts "#{vip} had the highest rating out of all the drivers."
                puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
