########################################################
# Step 1: Establish the layers

all_driver_data => driver_id => date => 'rides' (rider_id, cost, rating)

########################################################
# Step 2: Assign a data structure to each layer

all_driver_data => hash
driver_id => hash
date => hash
'rides' => array
(rider_id, cost, rating) => hash

########################################################
# Step 3: Make the data structure!

all_driver_data = {
  DR0004:
    {
      "020316" => [
        {
          rider_id: "RD0022",
          cost: 5,
          rating: 5
        }
      ],

      "020416" => [
        {
          rider_id: "RD0022",
          cost: 10,
          rating: 4
        }
      ],

      "020516" => [
        {
          rider_id: "RD0073",
          cost: 20,
          rating: 5
        }
      ]
    },

  DR0001:
  {
    "020316" => [
      {
        rider_id: "RD0003",
        cost: 10,
        rating: 3
      },
      {
        rider_id: "RD0015",
        cost: 30,
        rating: 4
      }
    ],

    "020516" => [
      {
        rider_id: "RD0003",
        cost: 45,
        rating: 2
      }
    ]
  },

  DR0002:
  {
    "020316" => [
      {
        rider_id: "RD0073",
        cost: 25,
        rating: 5
      }
    ],

    "020416" => [
      {
        rider_id: "RD0013",
        cost: 15,
        rating: 1
      }
    ],

    "020516" => [
      {
        rider_id: "RD0066",
        cost: 35,
        rating: 3
      }
    ]
  },

  DR0003:
  {
    "020416" => [
      {
        rider_id: "RD0066",
        cost: 5,
        rating: 5
      }
    ],

    "020516" => [
      {
        rider_id: "RD0003",
        cost: 50,
        rating: 2
      }
    ]
  }
}
    

########################################################
# Step 4: Total Driver's Earnings and Number of Rides

puts "********** Summarized Data For Each Driver **********"
puts
# Assigning an array containing all driver id's
all_driver_ids = all_driver_data.keys

# This hash will have keys = driver_id and value = total_money_made_by_driver
total_money_made_by_all_drivers = {}

# This hash will have keys = driver_id and value = average_rating_by_driver
average_rating_of_all_drivers = {}

# Iterating through the all_driver_ids array
all_driver_ids.each do |driver_id|

  # Extracting the keys (which are the dates) from the driver specific hashes
  date_keys = all_driver_data[driver_id].keys

  total_money_made_by_driver = 0
  total_rides_by_driver = 0
  sum_of_all_ratings_by_driver = 0

  # Iterating through the date_keys array
  date_keys.each do |date|

    # Determining the total number of rides per driver by summing the number of ride hashes per date per driver
    date_key = all_driver_data[driver_id][date]
    date_key_length = date_key.length
    total_rides_by_driver += date_key_length

    # Determining total money made per driver by summing the value associated with the ':cost' key per ride hash per date per driver. Also summing the ratings by driver, to be used later to determine the average rating per driver
    index = 0
    while index < date_key_length do
      total_money_made_by_driver += date_key[index][:cost]
      sum_of_all_ratings_by_driver += date_key[index][:rating]

      index += 1
    end
    
  end

  average_rating_by_driver = ((sum_of_all_ratings_by_driver.to_f)/total_rides_by_driver).round(1)
  total_money_made_by_all_drivers[driver_id] = total_money_made_by_driver
  average_rating_of_all_drivers[driver_id] = average_rating_by_driver

  puts "Total money made by driver #{driver_id}: $ #{total_money_made_by_driver}"
  puts "Total number of rides by driver #{driver_id}: #{total_rides_by_driver}"
  puts "Average rating for driver #{driver_id}: #{average_rating_by_driver}"
  puts
end

# These will return an array that contains the key/value pair of the maximum value in the originating hash
driver_that_made_the_most_money_total = total_money_made_by_all_drivers.max_by{|k,v| v}
driver_with_highest_avg_rating = average_rating_of_all_drivers.max_by{|k,v| v}

highest_paid_driver_id = driver_that_made_the_most_money_total[0]
highest_paid_driver_income = driver_that_made_the_most_money_total[1]
highest_rating_driver_id = driver_with_highest_avg_rating[0]
highest_rating_by_driver = driver_with_highest_avg_rating[1]

puts "****** Highest Performing Driver ******"
puts
puts "Most profitable driver: #{highest_paid_driver_id}, total $ #{highest_paid_driver_income}"
puts
puts "Highest average rating driver: #{highest_rating_driver_id}, rating of #{highest_rating_by_driver}"
puts
