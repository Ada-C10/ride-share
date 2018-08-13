##################################################
######

# Step 1: Establish the layers

# DRIVER: driver_id,
  # RIDES:
    #RIDER ID: id,
    # DATE: date,
    # COST: cost,
    # RATING: rating,

########################################################
# Step 2: Assign a data structure to each layer

# [
  #{ DRIVER: DRIVER_ID},
  # RIDE INFO: [
    # {DATE: DATE}
    # {RIDER ID: ID}
      # {COST: COST}
      # {RATING: RATING},
    # ]
    # },
# ]

########################################################
# Step 3: Make the data structure!

ride_info =
[
  {
    driver_id: "DR0001",
    rides:
    [
      {
      date: "3rd Feb 2016",
      cost: 10,
      rider_id: "RD0003",
      rating: 3
      },

      {
      date: "3rd Feb 2016",
      cost: 30,
      rider_id: "RD0015",
      rating: 4
      },

      {
      date: "5th Feb 2016",
      cost: 45,
      rider_id: "RD0003",
      rating: 2
      }
    ]
  },

  {driver_id: "DR0002", rides:
    [
      {
      date: "3rd Feb 2016",
      cost: 25,
      rider_id: "RD0073",
      rating: 5
      },

      {
      date: "4th Feb 2016",
      cost: 15,
      rider_id: "RD0013",
      rating: 1
      },

      {
      date: "5th Feb 2016",
      cost: 35,
      rider_id: "RD0066",
      rating: 3
      }
    ]
  },

  {driver_id: "DR0003", rides:
    [
      {
      date: "4th Feb 2016",
      cost: 5,
      rider_id: "RD0066",
      rating: 5
      },

      {
      date: "5th Feb 2016",
      cost: 50,
      rider_id: "RD0003",
      rating: 2
      }

    ]
  },

  {driver_id: "DR0004", rides:
    [
      {
      date: "3rd Feb 2016",
      cost: 5,
      rider_id: "RD0022",
      rating: 5
      },

      {
      date: "4th Feb 2016",
      cost: 10,
      rider_id: "RD0022",
      rating: 4
      },

      {
      date: "5th Feb 2016",
      cost: 20,
      rider_id: "RD0073",
      rating: 5
      }
    ]
  }
]


########################################################
# Step 4: Total Driver's Earnings and Number of Rides

  # Use an iteration block to print driver's total rides and money made

#  - Iterate through the data structure to display, by printing in terminal, the following info:
#
# x- The number of rides each driver has given
# x- The total amount of money each driver has made
# x- The average rating for each driver
# x- Which driver made the most money?
# x- Which driver has the highest average rating?
#
# Optionally, print in the terminal:
#
# x- For each driver, on which day did they make the most money?


# find the total amount of money each driver made overall
def finds_total_cost(ride_info)

  # initialize blank array
  total_cost_holder = []

  ride_info.each do |driver|
    # this variable needs to reset with each new driver
    total_cost = 0

    driver[:rides].each do |ride|
    # add the cost of each ride together by driver
      total_cost += ride[:cost]
    end

    # add totdal ride costs to an array
    total_cost_holder << total_cost
  end

  # return array of total costs by driver
  return total_cost_holder
end

# find the rating average each driver earned
def finds_avg_rating(ride_info)

  # initialize blank array
  ratings_holder = []

  ride_info.each do |driver|

    # these variables need to reset with each new driver
    rating_sum = 0.0
    average_rating = 0.0
    rides_total = 0

    # find total amount of rides given by driver
    rides_total = driver[:rides].length

    # add together all of the ride ratings by driver
    driver[:rides].each do |ride|
      rating_sum += ride[:rating]
    end

    # by driver, calculate an average rating
    average_rating = rating_sum / rides_total
    # place those ratings into an array
    ratings_holder << average_rating
  end

  # return an array of average ratings for each driver
  return ratings_holder
end

# check which driver made the most money
# store that driver's id
def finds_who_made_most_money(ride_info)

  #initialize variables
  most_money = 0
  driver_made_most_money = ""

  # grabs list containing total cost for each driver
  money_made_each = finds_total_cost(ride_info)

  ride_info.length.times do |index|
    # compare total amount per driver to find driver who made the most money
    if money_made_each[index] > most_money
      most_money = money_made_each[index]
      driver_made_most_money = ride_info[index][:driver_id]
    end
  end

  # return driver id as a string
  # this is the driver who made the most money
  return driver_made_most_money
end

# check which driver had the highest rating average
# store that driver's id
def finds_highest_avg_rating(ride_info)

  # initialize variables
  highest_rating = 0
  driver_with_highest_rating = ""

  # grabs list containing average rating for each driver
  avg_each = finds_avg_rating(ride_info)

  ride_info.length.times do |index|
    # compare average ratings by driver to find the driver with the highest rating
    if avg_each[index] > highest_rating
      highest_rating = avg_each[index]
      driver_with_highest_rating = ride_info[index][:driver_id]
    end
  end

  # return driver id as a string
  # this is the driver with the highest rating
  return driver_with_highest_rating
end

# find the day when each driver made the most money
def finds_most_profitable_dates(ride_info)

  # initialize blank list
  max_cost_dates = []

  ride_info.each do |driver|
    # initialize variables that need to reset with each new driver
    max_cost_day = ""
    current_date = ""
    max_cost = 0

    driver[:rides]. each do |ride|
    # initialize variable that needs to reset with each new ride
      day_cost = 0

    # the dates are listed in order, so we can check if we are looking at a new date or the same one was we saw on the last trip
    # if this is a new date, set day_cost to the current ride cost
    # if this date is identical to the previous trip's date, then we should add those values together
      if current_date == ride[:date]
        day_cost += ride[:cost]
      else
        day_cost = ride[:cost]
      end

      # set current_date to this ride's date so we can use the above conditional while inspecting the driver's next ride
      current_date = ride[:date]

      # if the total cost for the day is greater than the max_cost value, then set current total cost as max_cost value AND set highest earning day to the current date we are inspecting
      if day_cost > max_cost
        max_cost = day_cost
        max_cost_day = current_date

      end
    end

    # for each driver, add the highest earning dates to an array
    max_cost_dates << current_date

  end

  # return array of highest earning dates per driver
  return max_cost_dates
end


# invoke methods and declare variables
made_most_money = finds_who_made_most_money(ride_info)
highest_avg_rating = finds_highest_avg_rating(ride_info)

# grab info for each driver
ride_info.length.times do |index|
  # invoke methods during iteration and declare variables
  driver_id = ride_info[index][:driver_id]
  amount_of_rides = ride_info[index][:rides].length

  total_cost = finds_total_cost(ride_info)
  avg_rating = finds_avg_rating(ride_info)
  highest_cost_day = finds_most_profitable_dates(ride_info)

  # print results for each driver
  puts "Driver #{driver_id} gave #{amount_of_rides} total rides and made $#{total_cost[index]} with an average rating of #{avg_rating[index]}."
  puts "Additionally, this driver made the most money on #{highest_cost_day[index]}."

  puts ""

end

# find stand out drivers
puts "Driver #{made_most_money} made the most money!"
puts "Driver #{highest_avg_rating} had the highest rating!"
