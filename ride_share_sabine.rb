########################################################
# Step 1: Establish the layers
# Write a list of the layers here

  # ride_share = {driver1: => {data}}
  # data { date => trips}
  # trips [ {riderID:, cost: rating:}]
########################################################
# Step 2: Assign a data structure to each layer
# Copy your list from above, and write what data structure each layer should have

  #### ride_share = {driver1: => {date}}
      # ride_share is an array with key (driver), value (data) pair
  #### data {date => trips}
      # data is a set of ashes that will contain drivers'data organized by
      # date ashes
  #### trips [ {riderID:, cost: rating:}]
     # trips is an arary containing many ashes of key value data sets
     # capturing the values associated with each trip on that date
########################################################
# Step 3: Make the data structure!

    # Setup the data structure and manually write in data presented in rides.csv

ride_share = {

  DR0001: {

    Feb3_2016: {
      trips: [

        {
          riderid: "RD0003",
          cost:10,
          rating:3
        },
        {
          riderid: "RD0015",
          cost:30,
          rating:4

        },

      ]

    },

    Feb5_2016: {
      trips: [

        {
          riderid: "RD0003",
          cost:45,
          rating:2
        }

      ]

    }

  },

  DR0002: {

    Feb3_2016: {
      trips: [

        {
          riderid:"RD0073",
          cost:25,
          rating:5
        }

      ]

    },

    Feb4_2016: {
      trips: [

        {
          riderid: "RD0013",
          cost:15,
          rating:1
        }

      ]

    },

    Feb5_2016: {
      trips: [

        {
          riderid: "RD0066",
          cost:35,
          rating:3
        }

      ]

    }

  },

  DR0003: {

    Feb4_2016: {
      trips: [

        {
          riderid: "RD0066",
          cost:5,
          rating:5
        }

      ]

    },

    Feb5_2016: {
      trips: [

        {
          riderid: "RD0003",
          cost:50,
          rating:2
        }

      ]

    }

  },

  DR0004: {

    Feb3_2016: {
      trips: [

        {
          riderid:"RD0022",
          cost:5,
          rating:5
        }

      ]

    },

    Feb4_2016: {
      trips: [

        {
          riderid: "RD0022",
          cost:10,
          rating:4
        }

      ]

    },

    Feb5_2016: {
      trips: [

        {
          riderid: "RD0003",
          cost:20,
          rating:5
        }

      ]

    }

  }

}


# puts ride_share[:DR0001]
# puts
# puts ride_share[:DR0002]
# puts
# puts ride_share[:DR0003]
# puts
# puts ride_share[:DR0004]

#######################################################
# Step 4: Total Driver's Earnings and Number of Rides

  # Use an iteration block to print driver's total rides and money made

############### this code below works with RUBY

def ride_numbers (number)
    total_rides = []
    ride_tally.each do |driver|
     # need to let RUBY know what value to search for
      total_rides << driver_1
end

 ride_share[:DR0001][:Feb3_2016][:trips].length
 ride_share[:DR0001][:Feb5_2016][:trips].length
 driver_1 = ride_share[:DR0001][:Feb3_2016][:trips].length + ride_share[:DR0001][:Feb5_2016][:trips].length
 puts "Total of rides for driver 1 is #{driver_1}"

 d2_day_1 = ride_share[:DR0002][:Feb3_2016][:trips].length
 d2_day_2 = ride_share[:DR0002][:Feb4_2016][:trips].length
 d2_day_3 = ride_share[:DR0002][:Feb5_2016][:trips].length
 driver_2 = d2_day_1 + d2_day_2 + d2_day_3
 puts "Total of rides for driver 2 is #{driver_2}"

 d3_day_1 = ride_share[:DR0003][:Feb4_2016][:trips].length
 d3_day_2 = ride_share[:DR0003][:Feb5_2016][:trips].length
 driver_3 = d3_day_1 + d3_day_2
 puts "Total of rides for driver 3 is #{driver_3}"

 d4_day_1 = ride_share[:DR0004][:Feb3_2016][:trips].length
 d4_day_2 = ride_share[:DR0004][:Feb4_2016][:trips].length
 d4_day_3 = ride_share[:DR0004][:Feb5_2016][:trips].length
 driver_4 = d4_day_1 + d4_day_2 + d4_day_3
 puts "Total of rides for driver 4 is #{driver_4}"

###############################

# def ride_cost (cost)
#   total_cost = []
#   cost_tally.each do |driver|
#     # I need to let RUBY know what value I am searching
#     total_cost <<
# end


driver_1_total_cost = []
cost1_1 = ride_share[:DR0001][:Feb3_2016][:trips][0][:cost]
cost1_2 = ride_share[:DR0001][:Feb3_2016][:trips][1][:cost]
cost1_3 = ride_share[:DR0001][:Feb5_2016][:trips][0][:cost]
//
driver_1_total_cost << cost1_1
driver_1_total_cost << cost1_2
driver_1_total_cost << cost1_3
# driver_one_cost << cost1_3.to_i
# puts driver_1_total_cost
driver1_final_cost = driver_1_total_cost[0] + driver_1_total_cost[1] + driver_1_total_cost[2]
#
puts "This is how much driver one made in total for day 1 $#{driver1_final_cost}"

#################################
driver_2_total_cost = []
cost2_1 = ride_share[:DR0002][:Feb3_2016][:trips][0][:cost]
cost2_2 = ride_share[:DR0002][:Feb4_2016][:trips][0][:cost]
cost2_3 = ride_share[:DR0002][:Feb5_2016][:trips][0][:cost]
//
driver_2_total_cost << cost2_1
driver_2_total_cost << cost2_2
driver_2_total_cost << cost2_3
# driver_one_cost << cost1_3.to_i
# puts driver_2_total_cost
driver2_final_cost = driver_2_total_cost[0] + driver_2_total_cost[1] + driver_2_total_cost[2]
#
puts "This is how much driver two made in total for day 1 $#{driver2_final_cost}"


# Need to create a case statement here to identity driver who made the most $

if
  driver1_final_cost > driver2_final_cost
  puts "The driver that made the most money is Driver 1"
elsif
  driver2_final_cost > driver3_final_cost && driver2_final_cost > driver1_final_cost
  puts "The driver that made the most money is Driver 2"
elsif
  driver3_final_cost > driver4_final_cost && driver3_final_cost > driver2_final_cost && driver3_final_cost > driver1_final_cost
  puts "The driver that mads the most money is Driver 3"
elsif
  driver4_final_cost > driver1final_cost && driver4_final_cost > driver2_final_cost && driver4_final_cost > driver3_final_cost
  puts "The driver that made the most money is Driver 4"

end
