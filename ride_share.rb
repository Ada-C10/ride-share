begin
Total Driver's Earnings and Number of Rides
Iterate through the data structure to display, by printing in terminal, the following info:
- The number of rides each driver has given
- The total amount of money each driver has made
- The average rating for each driver
- Which driver made the most money?
- Which driver has the highest average rating?

Optionally, print in the terminal:
- For each driver, on which day did they make the most money?
=end

drivers = { #Data stored in hash with 4 keys
  "DR0004": [ #values of key stored in array of hash
    {
      "name": "Rixos The Palm Dubai",
      "location": [25.1212, 55.1535],
      "rating": 5,
      "cost": 5,
      "rider_id": "RD0022",
      "date": "3rd Feb 2016"
    },
    {
      "name": "Broad Beach",
      "location": [34.037440, -118.866996],
      "rating": 4,
      "cost": 10,
      "rider_id": "RD0022",
      "date": "4th Feb 2016"
    },
    {
      "name": "Carlton Centre",
      "location": [26.2057, 28.0468],
      "rating": 5,
      "cost": 20,
      "rider_id": "RD0073",
      "date": "5th Feb 2016"
    }
  ],

"DR0001": [
    {
      "name": "Shangri-La Hotel",
      "location": [25.2084, 55.2719],
      "rating": 3,
      "cost": 10,
      "rider_id": "RD0003",
      "date": "3rd Feb 2016"
    },
    {
      "name": "Barasti Beach",
      "location": [25.1212, 55.1535],
      "rating": 4,
      "cost": 30,
      "rider_id": "RD0015",
      "date": "3rd Feb 2016"
    },
    {
      "name": "Times Square",
      "location": [40.7589, 73.9851],
      "rating": 2,
      "cost": 45,
      "rider_id": "RD0003",
      "date": "5th Feb 2016"
    }
  ],

  "DR0002": [
    {
      "name": "Grand Hyatt",
      "location": [25.2285, 55.3273],
      "rating": 5,
      "cost": 25,
      "rider_id": "RD0073",
      "date": "3rd Feb 2016"
    },
    {
      "name": "Big Ben",
      "location": [51.500936, -0.124271],
      "rating": 1,
      "cost": 15,
      "rider_id": "RD0013",
      "date": "4th Feb 2016"
    },
    {

      "name": "Mosaic House",
      "location": [50.0775, 14.4180],
      "rating": 3,
      "cost": 35,
      "rider_id": "RD0066",
      "date": "5th Feb 2016"
      }
  ],

  "DR0003":[
    {
      "name": "Seattle Children's Museum",
      "location": [47.621664, -122.350404],
      "rating": 5,
      "cost": 5,
      "rider_id": "RD0066",
      "date": "4th Feb 2016"
    },
    {
      "name": "Kennington Park Business Centre",
      "location": [51.481031, -0.107890],
      "rating": 2,
      "cost": 50,
      "rider_id": "RD0003",
      "date": "5th Feb 2016"
    }
  ]
}



max_avg_driver = ""
max_driver = ""
max_cost = 0
highest_avg = 0
drivers.each do |driver, rides| #Iterate over driver's ID and its values
  total_cost = 0
  sum_ratings = 0


puts "Driver: #{driver} gave #{rides.count} rides." #driver & rides "extracted" in line 123
rides.each do |ride|
  ride_cost = ride[:cost] #use symbol because cost is in hash
  total_cost = total_cost + ride_cost
  rating = ride[:rating]
  sum_ratings = sum_ratings + rating
end

average = sum_ratings / rides.count
puts "The average rating is a #{average}."
puts "The total made from the driver is $#{total_cost}.\n\n"
if total_cost > max_cost #defining max value
  max_cost = total_cost
  max_driver = driver #defining driver with max value
end
if highest_avg < average #defining highest avg
  highest_avg = average
  max_avg_driver = driver #defining driver with highest avg
end

end
puts "Driver that made the most money is #{max_driver}."
puts "Driver with the highest average is #{max_avg_driver}."
