# array stores information to be used for calculations
  drivers = {
        "DR001": [{"date": "02/03/2016",
                     "cost": 10,
                     "rider_id": "RD0003",
                     "rating": 3},

                 {"date": "02/03/2016",
                   "cost": 30,
                   "rider_id": "RD0015",
                  "rating": 4},

                 {"date": "02/05/2016",
                   "cost": 45,
                   "rider_id": "RD003",
                   "rating": 2}],

        "DR002": [{"date": "02/03/2016",
                  "cost": 25,
                  "rider_id": "RD0073",
                  "rating": 5},

                 {"date": "02/04/2016",
                  "cost": 15,
                  "rider_id": "RD0013",
                  "rating": 1},

                 {"date": "02/05/2016",
                  "cost": 35,
                  "rider_id": "RD0066",
                  "rating": 3}],

        "DR003": [{"date": "02/04/2016",
                  "cost": 5,
                  "rider_id": "RD0066",
                  "rating": 5},

                 {"date": "02/05/2016",
                  "cost": 50,
                  "rider_id": "RD0003",
                  "rating": 2}],

        "DR004":[{"date": "02/03/2016",
                  "cost": 5,
                  "rider_id": "RD0022",
                  "rating": 5},

                 {"date": "02/04/2016",
                  "cost": 10,
                  "rider_id": "RD0022",
                  "rating": 4},

                 {"date": "02/05/2016",
                  "cost": 20,
                  "rider_id": "RD0073",
                  "rating": 5}]
                  }


# calculates number of rides per driver
def number_rides(whatever)
  whatever.each do |key,value|
  y = "Driver #{key} has #{(value.length)} ride(s)."
  puts y
  end
puts
end

# calls the function number_rides
number_rides(drivers)

# calculates amount earned per driver
# calculates & returns maximum amount earned amongst drivers
def amt_per_driver(red)
sum_array = []
names_array = []
  red.each do |key,value|
    sum = 0
    value.each do |hash|
      sum += hash.fetch(:"cost")
    end
    puts "Driver #{key} has earned $#{sum}."
    sum_array << sum
    names_array << key
  end
r =  sum_array.max
winner = names_array[sum_array.find_index(r)]
return winner
end

q = amt_per_driver(drivers)
puts "MOST MONEY EARNED BY: #{q}"
puts

# calculates average rating per driver
# calculates and returns highest average rating amongst drivers
def average_rating(blue)
  average_array = []
  names1_array = []
  blue.each do |key,value|
  sum = 0
    value.each do |hash|
      sum += hash.fetch(:"rating")
    end
    converted = sum.to_f
    puts "Driver #{key} has an average rating of #{(converted/value.length).round(3)}."
    average_array << (converted/value.length).round(3)
    names1_array << key
  end
  s =  average_array.max
  winner2 = names1_array[average_array.find_index(s)]
  return winner2
puts
end

w = average_rating(drivers)
puts "HIGHEST AVERAGE RATING FOR: #{w}"

