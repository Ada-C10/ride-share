rideshare_data = {
  DR0001: [
    {
      DATE: "02_03_2016",
      COST: 10,
      RIDER_ID: "RD0003",
      RATING: 3
    },
    {
      DATE: "02_03_2016",
      COST: 30,
      RIDER_ID: "RD0015",
      RATING: 4
    },
    {
      DATE: "02_05_2016",
      COST: 45,
      RIDER_ID: "RD0003",
      RATING: 2
    }
  ],
  DR0002: [
    {
      DATE: "02_03_2016",
      COST: 25,
      RIDER_ID: "RD0073",
      RATING: 5
    },
    {
      DATE: "02_04_2016",
      COST: 15,
      RIDER_ID: "RD0013",
      RATING: 1
    },
    {
      DATE: "02_5_2016",
      COST: 35,
      RIDER_ID: "RD0066",
      RATING: 3
    }
  ],
  DR0003: [
    {
      DATE: "02_04_2016",
      COST: 5,
      RIDER_ID: "RD0066",
      RATING: 5
    },
    {
      DATE: "02_05_2016",
      COST: 50,
      RIDER_ID: "RD0003",
      RATING: 2
    }
  ],
  DR0004: [
    {
      DATE: "02_03_2016",
      COST: 5,
      RIDER_ID: "RD0022",
      RATING: 5
    },
    {
      DATE: "02_04_2016",
      COST: 10,
      RIDER_ID: "RD0022",
      RATING: 4
    },
    {
      DATE: "02_05_2016",
      COST: 20,
      RIDER_ID: "RD0073",
      RATING: 5
    }
  ]
}

def calculate_total_profit (array) #method to calculate profit
  total_profit = 0
  array.each do |rides|
    total_profit += rides[:COST]
  end
  return total_profit
end

def calculate_rating_sum (array) #method to calculate ratings
  total_rating = 0
  array.each do |rides|
    total_rating += rides[:RATING]
  end
  return total_rating
end

max_profit_array = []
max_rating_array = []
profit_hash = {}
rating_hash = {}

rideshare_data.each do |driver_id, driver_data_array| #iterating over entire hash
  number_of_rides = driver_data_array.length #finding length of the array to see #of rides
  puts "#{driver_id} completed #{number_of_rides} rides"

  total_profit = calculate_total_profit(driver_data_array) #invoking method for profit
  profit_hash = {driver_id: driver_id, profit: total_profit} #creating a hash to contain the driver id and profit
  max_profit_array.push profit_hash #pushing the hash into an array so we can find the max later on
  puts "#{driver_id} earned $#{total_profit} total"

  average_rating = calculate_rating_sum(driver_data_array).to_f / number_of_rides.to_f #invoking method for rating and dividing by number of rides
  rating_hash = {driver_id: driver_id, rating: average_rating} #creating hash with driver id and rating
  max_rating_array.push rating_hash #pushing the hash into an array to find the max later on
  puts "#{driver_id}'s average rating is #{'%.2f' % average_rating}"
end

#finding the max profit and rating by using .max_by
max_profit = max_profit_array.max_by do |profit|
  profit [:profit]
end

max_rating = max_rating_array.max_by do |rating|
  rating [:rating]
end

puts "Driver #{max_profit[:driver_id]} earned the most with a profit of $#{max_profit[:profit]}."
puts "Driver #{max_rating[:driver_id]} earned the highest average rating of #{'%.2f' % max_rating[:rating]}."
