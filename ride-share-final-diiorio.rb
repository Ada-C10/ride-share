
rides_by_driver = {
  DR0001:[
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
  ],

  DR0002:[
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
  ],

  DR0003:[
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
  ],

  DR0004:[
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

########################################################
# Step 4: Total Driver's Earnings and Number of Rides

#store information later about maximum earnings and ratings
max_money = {driver_name: "nobody", earnings: 0 }
max_rating = {driver_name: "nobody", rating: 0}

puts "\nDRIVER SUMMARY:"

rides_by_driver.each do |driver, ride_info|

  #find total earnings for each driver
  earnings = 0
  ride_info.each do |i|
    earnings += i[:cost]
  end

  #find sum of all ratings for each driver
  ratings_sum = 0
  ride_info.each do |i|
    ratings_sum += i[:rating]
  end
  average_rating = ratings_sum.to_f / ride_info.length


  puts "\n#{driver.to_s} gave #{ride_info.length} rides for a total of $#{earnings}. \nTheir average rating is #{average_rating.round(2)}."

#make a new hash to accumulate the earnings by date for each driver.
#if there is already an entry for that date, add the cost of the ride to the entry's value
#if not, add a new key-value pair for that date and cost
  cumulative_earnings = {}
  ride_info.each do |ride|

    if cumulative_earnings[ride[:date]]
      cumulative_earnings[ride[:date]] += ride[:cost]
    else
      cumulative_earnings[ride[:date]] = ride[:cost]
    end
  end

  biggest_day = cumulative_earnings.max_by {|day, pay| pay}
  puts "They earned the most money ($#{biggest_day[1]}) on #{biggest_day[0]}."


  #adds a new hash to the original array containing total earnings and average rating for each driver
  #DO NOT ATTEMPT ANY ride_info.each LOOPS or AFTER THIS POINT - NEW HASHES DON'T HAVE THE SAME KEYS
  #if you want to count the number of rides after this point with ride_info.length, REMEMBER TO SUBTRACT THE 2 HASHES BEING ADDED HERE
  #could refactor to have total_earnings and average_rating get stored in a brand new hash containing an array of hashes (one hash for each driver)


  ride_info << {total_earnings: earnings}
  ride_info.last[:average_rating] = ratings_sum.to_f / (ride_info.length - 1)

  #checks to see if each driver's earnings are higher than the current max.  if so, replaces the current max.
  if ride_info.last[:total_earnings] > max_money[:earnings]
    max_money[:driver] = driver
    max_money[:earnings] = ride_info.last[:total_earnings]
  end

  #checks to see if each driver's rating is higher than the current max.  if so, replaces the current max.
  if ride_info.last[:average_rating] > max_rating[:rating]
    max_rating[:driver] = driver
    max_rating[:rating] = ride_info.last[:average_rating]
  end




end

puts "\n\nThe driver who earned the most money is #{max_money[:driver]}, with $#{max_money[:earnings]}."
puts "\n\nThe driver with the highest rating is #{max_rating[:driver]}, with an average rating of #{max_rating[:rating].round(2)}."
puts "\n\n"

