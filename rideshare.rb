# Hardcode the data. Organized by driver, then by date, then by individual ride

drivers = [
  {
    "driverid": "DR0001",
    "ride_dates": [
      {
        "date": "02032016",
        "rides": [
          {
            "cost": 10,
            "rider_id": "RD0003",
            "rating": 3
          },

          {
            "cost": 30,
            "rider_id": "RD0015",
            "rating": 4
          },
        ]
      },

      {
        "date": "02052016",
        "rides": [
          {
            "cost": 45,
            "rider_id": "RD0003",
            "rating": 2
          }
        ]
      }
    ]
  },

  {
    "driverid": "DR0002",
    "ride_dates": [
      {
        "date": "02032016",
        "rides":[
          {
            "cost": 25,
            "rider_id": "RD0073",
            "rating": 5
          }
        ]
      },

      {
        "date": "02042016",
        "rides": [
          {
            "cost": 15,
            "rider_id": "RD0013",
            "rating": 1
          }
        ]
      },

      {
        "date": "02052016",
        "rides": [
          {
            "cost": 35,
            "rider_id": "RD0066",
            "rating": 3
          }
        ]
      }
    ]
  },

  {
    "driverid": "DR0003",
    "ride_dates": [
      {
        "date": "02042016",
        "rides": [
        {
          "cost": 5,
          "rider_id": "RD0066",
          "rating": 5
        }
      ]
      },

      {
        "date": "02052016",
        "rides": [
          {
            "cost": 50,
            "rider_id": "RD0003",
            "rating": 2
          }
        ]
      }
    ]
  },

  {
    "driverid": "DR0004",
    "ride_dates": [
      {
        "date": "02032016",
        "rides": [
          {
            "cost": 5,
            "rider_id": "RD0022",
            "rating": 5
          }
        ]
      },

      {
        "date": "02042016",
        "rides": [
          {
            "cost": 10,
            "rider_id": "RD0022",
            "rating": 4
          }
        ]
      },

      {
        "date": "02052016",
        "rides": [
          {
            "cost": 20,
            "rider_id": "RD0073",
            "rating": 5
          }
        ]
      }
    ]
  },
]



# Method to find the date with the highest average rating per driver

def highest_average_day(data)

  # Define an array to store the final data
  drivers_array = []

  # Loop that exposes each driver's hash
  data.each do |driver|

    # Define new hash to store averages data for each driver iteration; define variables for average calculation
    driver_hash = Hash.new
    highest_avg = 0
    highest_avg_date = nil

    # Loop that exposes each date the driver gave rides on; defines an accumulator variable to find sum of all ride ratings per date; also assigns a variable with the total number of rides per date
    driver[:ride_dates].each do |ride_date|
      ride_date_sum = 0
      number_of_rides = ride_date[:rides].length

      ride_date[:rides].each do |ride|
        ride_date_sum += ride[:rating]
      end

      # Assign the average per date to a variable
      date_avg = ride_date_sum.to_f / number_of_rides

      # Check the average per date against the prior reigning highest average
      if date_avg > highest_avg
        highest_avg_date = ride_date[:date]
        highest_avg = date_avg
      elsif date_avg == highest_avg
        highest_avg_date << "; " + ride_date[:date]
      end

    end

    # Populate the driver hash with details of highest average day
    driver_hash[:driverid] = driver[:driverid]
    driver_hash[:best_day] = highest_avg_date
    driver_hash[:avg_rating] = highest_avg

    # Push driver hash to the final data array
    drivers_array << driver_hash
  end

  return drivers_array
end


# Display the data
highest_average_day_array = highest_average_day(drivers)

puts "The day with the highest average rating for each driver was:"

puts highest_average_day_array





# Method to find the total rides per driver

def total_rides(data)
  rides_array = Array.new

  # Loop that exposes each driver's hash
  data.each do |driver|

    # Define a new hash to contain the output data
    rides = Hash.new
    rides[:driverid] = driver[:driverid]

    # Initialize an accumulator variable to count total rides; iterate over each date and find the number of rides on that date; add this value to accumulator
    total_rides = 0
    driver[:ride_dates].each do |date|
      total_rides += date[:rides].length
    end

    # Assign value for total number of rides to the output hash; push hash to the final data array
    rides[:number_of_rides] = total_rides
    rides_array << rides
  end

  return rides_array
end


# Display the data
rides_array = total_rides(drivers)

rides_array.each do |driver|
  puts "#{driver[:driverid]}: #{driver[:number_of_rides]} rides"
end



# Method to find total revenue per driver

def total_revenue(data)
  revenue_array = Array.new

  # Loop that exposes each driver's hash; create new hash to store driver's total revenue; assign zero to accumulator variable
  data.each do |driver|
    revenue = Hash.new
    total = 0

    # Find the sum of revenue from all rides
    driver[:ride_dates].each do |date|
      date[:rides].each do |ride|
        total += ride[:cost]
      end
    end

    # Store driver id and total revenue values in the new hash
    revenue[:driverid] = driver[:driverid]
    revenue[:total_revenue] = total

    # Push hash to final data array
    revenue_array << revenue
  end

  return revenue_array
end

# Display the data
revenue_array = total_revenue(drivers)

revenue_array.each do |driver|
  puts "#{driver[:driverid]}: $#{driver[:total_revenue]}"
end




# Method to find each driver's average rating

def average_rating(data)
  average_rating_array = Array.new

  # Loop that exposes each driver's hash; initialize variables for total number of rides and sum of all ratings; define new hash to contain output data
  data.each do |driver|
    rating = Hash.new
    ratings_sum = 0.0
    total_rides = 0

    # Find the total number of rides and the sum of all ratings per driver
    driver[:ride_dates].each do |date|
      total_rides += date[:rides].length

      date[:rides].each do |ride|
        ratings_sum += ride[:rating].to_f
      end
    end

    # Assign the driver id and average rating to the new hash
    rating[:driverid] = driver[:driverid]
    rating[:avg_rating] = ratings_sum / total_rides

    # Push hash to final data array
    average_rating_array << rating
  end

  return average_rating_array
end

# Display the data
average_ratings_array = average_rating(drivers)

average_ratings_array.each do |driver|
  puts "#{driver[:driverid]}: #{driver[:avg_rating]} stars average"
end




# Method to find the highest earning driver

def highest_earner(data)
  highest_earner = nil
  highest_earner_value = 0

  # Loop that exposes each driver's hash; initialize accumulator variable to contain individual driver's revenue
  data.each do |driver|
    driver_revenue = 0

    # Nested loops that expose each ride date and then each individual ride to add individual ride cost to total accumulator
    driver[:ride_dates].each do |date|
      date[:rides].each do |ride|
        driver_revenue += ride[:cost]
      end
    end

    # Find highest earning driver by conditionally overwriting highest earner variable
    if driver_revenue > highest_earner_value
      highest_earner_value = driver_revenue
      highest_earner = driver[:driverid]
    end
  end

  return highest_earner
end

# Display the data
puts "Looks like #{highest_earner(drivers)} made the most money!"




# Method to find highest average rating

def highest_avg_rating(data)
  highest_avg_rating = nil
  highest_avg_rating_value = 0

  # Loop that exposes each driver's hash; initialize two accumulator variables to store sum of all ratings and total rides per driver
  data.each do |driver|
    ratings_sum = 0.0
    total_rides = 0

    # Expose each date hash to add the number of rides on that date to the total rides accumulator
    driver[:ride_dates].each do |date|
      total_rides += date[:rides].length

      # Expose each individual ride to add its rating to the ratings sum accumulator
      date[:rides].each do |ride|
        ratings_sum += ride[:rating].to_f
      end
    end

    # Find the average rating for the driver
    avg_rating = ratings_sum / total_rides

    # Conditionally assign the driver's id and average rating to highest average variables
    if avg_rating > highest_avg_rating_value
      highest_avg_rating = driver[:driverid]
      highest_avg_rating_value = avg_rating
    end
  end

  # Assign highest average variables to final data array
  driver_and_rating_array = [highest_avg_rating, highest_avg_rating_value]
  return driver_and_rating_array
end

# Display the data
puts "Looks like #{highest_avg_rating(drivers)[0]} had the highest average rating, with an average rating of #{highest_avg_rating(drivers)[1]}!"
