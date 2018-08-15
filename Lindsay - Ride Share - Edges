#create a data structure based on info from rides.csv
driver_data = [
  {"Driver 1" =>
    [
      {
        date: "2/3",
        rider: "rd0003",
        cost: 10,
        rating: 3
      },
      {
        date: "2/3",
        rider: "rd0015",
        cost: 30,
        rating: 4
      },
      {
        date: "2/5",
        rider: "rd003",
        cost: 45,
        rating: 2
      }
    ]
  },
  {"Driver 2" =>
    [
      {
        date: "2/3",
        rider: "rd0073",
        cost: 25,
        rating: 5
      },
      {
        date: "2/4",
        rider: "rd0013",
        cost: 15,
        rating: 1
      },
      {
        date: "2/5",
        rider: "rd0066",
        cost: 35,
        rating: 3
      }
    ]
  },
  {"Driver 3" =>
    [
      {
        date: "2/4",
        rider: "rd0066",
        cost: 5,
        rating: 5
      },
      {
        date: "2/5",
        rider: "rd0003",
        cost: 50,
        rating: 2
      }
    ]
  },
  {"Driver 4" =>
    [
      {
        date: "2/3",
        rider: "rd0022",
        cost: 5,
        rating: 5
      },
      {
        date: "2/4",
        rider: "rd0022",
        cost: 10,
        rating: 4
      },
      {
        date: "2/5",
        rider: "rd0073",
        cost: 20,
        rating: 5
      }
    ]
  }
]


#define a method to find all rides by driver
#return the length as an integer
def find_total_rides(rides)
    length = rides.length
    return length
end

#iterate over data from each driver
#invoke the method to find total rides
#for the argument, use the array of hashes that represents all rides by driver
puts "********* total rides by driver *********"
x = 0
driver_data.each do
  total = find_total_rides(driver_data[x]["Driver #{x+1}"])
  puts "Driver #{x+1} total rides = #{total}"
  x += 1
end
puts "\n"


#define a method to find the total amount of money made by driver
#return the total as an integer
def find_total_pay(rides)
  moneys = 0
  rides.each do |key, value|
    moneys += key[:cost]
  end
  return moneys
end

#iterate over data from each driver
#invoke the method to find total money
#pass the array of hashes that represents all rides by driver
puts "********* total pay by driver *********"
x = 0
driver_data.each do
  total_pay = find_total_pay(driver_data[x]["Driver #{x+1}"])
  puts "Driver #{x+1} total pay = $#{total_pay}"
  x += 1
end
puts "\n"


#define a method to find the average rating of each driver
#return the average as a float
def find_average_rating(rides)
  rating = 0.0
  rides.each do |key, value|
    rating += key[:rating]
  end
  average = rating / rides.length
  return average.round(2)
end

#iterate over data from each driver
#invoke the method to find average rating
#pass the array of hashes that represents all rides by driver
puts "********* average rating by driver *********"
x = 0
driver_data.each do
  average_rating = find_average_rating(driver_data[x]["Driver #{x+1}"])
  puts "Driver #{x+1} average rating = #{average_rating}"
  x += 1
end
puts "\n"


#define a method to figure out the highest pay of all drivers
#return the maximum as a hash with two key/value pairs
#the first pair represents the driver with the maximum pay
#the second pair represents the maximum pay
def find_highest_pay(drivers)
  maximum = 0
  max = {}
  driver = "Default"
  drivers.each do |driver_data|
    driver_data.each do |driver_id, rides|
      money = find_total_pay(rides)
      if maximum < money
        maximum = money
        driver = driver_id
      end
    end
    max[:driver_id] = driver
    max[:max_pay] = maximum
    end
    return max
end

#invoke the method to the maximum pay
#pass the entire array that represents all driver data
puts "********* maximum pay *********"
maximum = find_highest_pay(driver_data)
puts "#{maximum[:driver_id]} made the most money with $#{maximum[:max_pay]}."
puts "\n"


#define a method to figure out the highest rating of all drivers
#return the maximum as a hash with two key/value pairs
#the first pair represents the driver with the highest rating
#the second pair represents the highest rating
def find_highest_rating(drivers)
  maximum = 0
  max = {}
  driver = "Default"
  drivers.each do |driver_data|
    driver_data.each do |driver_id, rides|
      average = find_average_rating(rides)
      if maximum < average
        maximum = average
        driver = driver_id
      end
    end
    max[:driver_id] = driver
    max[:max_rating] = maximum
  end
  return max
end

#invoke the method to the maximum pay
#pass the entire array that represents all driver data
puts "********* highest rating *********"
maximum = find_highest_rating(driver_data)
puts "#{maximum[:driver_id]} had the highest average rating with #{maximum[:max_rating]}."
