data = {
  "DR0001":[
    {
      "date": [03, 02, 2016],
      "rider_ID": "RD0003",
      "rating": 3,
      "cost": 10
    },
    {
      "date": [03, 02, 2016],
      "rider_ID": "RD0015",
      "rating": 4,
      "cost": 30
    },
    {
      "date": [05, 02, 2016],
      "rider_ID": "RD0003",
      "rating": 2,
      "cost": 45
    }
  ],
  "DR0002":[
    {
      "date": [03, 02, 2016],
      "rider_ID": "RD0073",
      "rating": 5,
      "cost": 25
    },
    {
      "date": [04, 02, 2016],
      "rider_ID": "RD0013",
      "rating": 1,
      "cost": 15
    },
    {
      "date": [05, 02, 2016],
      "rider_ID": "RD0066",
      "rating": 3,
      "cost": 35
    }
  ],
  "DR0003":[
    {
      "date": [04, 02, 2016],
      "rider_ID": "RD0066",
      "rating": 5,
      "cost": 5
    },
    {
      "date": [05, 02, 2016],
      "rider_ID": "RD0003",
      "rating": 2,
      "cost": 50
    }
  ],
  "DR0004":[
    {
      "date": [03, 02, 2016],
      "rider_ID": "RD0022",
      "rating": 5,
      "cost": 5
    },
    {
      "date": [04, 02, 2016],
      "rider_ID": "RD0022",
      "rating": 4,
      "cost": 10
    },
    {
      "date": [05, 02, 2016],
      "rider_ID": "RD0073",
      "rating": 5,
      "cost": 20
    }
  ]
}

# method argument: entire data structure
# method return: array of strings
def num_rides( data )
  # iterate per driver the length of array within driver hash
  output = []
  num_rides = nil

  data.each do | driver, info |
    num_rides = data[driver].length
    output <<  "Driver #{driver} made #{num_rides} ride(s)."
  end
  return output
end

# method argument: entire data structure
# method return: array of hashes for driver and total money
def total_money( data )
  output = []
  total_money = 0

  data.each_pair do |driver_id, info|

    # for each driver, iterate through each trip and add cost
    info.each do |trip|
      total_money += trip[:cost]
    end

    output << {driver: driver_id, money: total_money}
    puts "Driver #{driver_id} made $#{total_money}."

    # set total_money to 0 for next driver
    total_money = 0
  end
  return output
end

# method argument: entire data structure
# method return: array of hashes for driver and average money
def avg_rating( data )
  output = []
  sum_rating = 0.0

  data.each_pair do |driver_id, info|

    # for each driver, iterate through each trip and add the rating together to a sum_rating
    info.each do |trip|
      sum_rating += trip[:rating]
    end

    # divide sum_rating by the number of trips and add avg_rating to output
    avg_rating = (sum_rating / info.length).round(2)
    output << {driver: driver_id, rating: avg_rating}

    puts "Driver #{driver_id}'s average rating is: #{avg_rating}."

    # set sum_rating to 0 for next driver
    sum_rating = 0.0
  end
  return output
end

# method argument: array from total_money (tm) method
# method return: string of driver ID
def most_money( tm_data )
  greatest = tm_data[0][:money]
  index = 0

  # iterate and replace greatest and index values while comparing :money
  tm_data.each_index do |i|
    if tm_data[i][:money] > greatest
      greatest = tm_data[i][:money]
      index = i
    end
  end

  richest_driver = tm_data[index][:driver]
  return richest_driver
end

# method argument: array from best_rating (br) method
# method return: string of driver ID
def best_rating( br_data )
  greatest = br_data[0][:rating]
  index = 0

  # iterate and replace greatest and index values while comparing :rating
  br_data.each_index do |i|
    if br_data[i][:rating] > greatest
      greatest = br_data[i][:rating]
      index = i
    end
  end

  best_ranked_driver = br_data[index][:driver]
  return best_ranked_driver
end


puts  num_rides(data)

money_data = total_money(data)
puts "Driver #{most_money(money_data)} made the most money."

rating_data = avg_rating(data)
puts "Driver #{best_rating(rating_data)} has the highest rating."
