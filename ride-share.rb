# Write a list of the layers here
# 1. Hash
# 2. Array
# 3. Hash
#    - string
#    - interger
#    - string
#    - interger

# Step 2: Assign a data structure to each layer
# 1. Hash
#   Driver History
# 2. Array
#   Driver Ids
# 3. Hash
#   Riders History

#Step 3: Make the data structure!
driver_history = {
  DR0001: [
    {
      DATE: "3rd Feb 2016",
      COST: 10,
      RIDER_ID: "RD0003",
      RATING: 3
    },
    {
      DATE: "3rd Feb 2016",
      COST: 30,
      RIDER_ID: "RD0015",
      RATING: 4
    },
    {
      DATE: "5th Feb 2016",
      COST: 45,
      RIDER_ID: "RD0003",
      RATING: 2
    }
  ],
  DR0002: [
    {
      DATE: "3rd Feb 2016",
      COST: 25,
      RIDER_ID: "RD0073",
      RATING: 5
    },
    {
      DATE: "4th Feb 2016",
      COST: 15,
      RIDER_ID: "RD0013",
      RATING: 1
    },
    {
      DATE: "5th Feb 2016",
      COST: 35,
      RIDER_ID: "RD0066",
      RATING: 3
    }
  ],
  DR0003: [
    {
      DATE: "4th Feb 2016",
      COST: 5,
      RIDER_ID: "RD0066",
      RATING: 5
    },
    {
      DATE: "5th Feb 2016",
      COST: 50,
      RIDER_ID: "RD0003",
      RATING: 2
    }
  ],
  DR0004: [
    {
      DATE: "3rd Feb 2016",
      COST: 5,
      RIDER_ID: "RD0022",
      RATING: 5
    },
    {
      DATE: "4th Feb 2016",
      COST: 10,
      RIDER_ID: "RD0022",
      RATING: 4
    },
    {
      DATE: "5th Feb 2016",
      COST: 20,
      RIDER_ID: "RD0073",
      RATING: 5
    }
  ]
}
puts

money_earned = {}
highest_rating = {}
highest_rating = {}
date = []

driver_history.map do |driver, ride|
  # 1. The number of rides each driver has given
  puts "DRIVER ID: #{driver}"
  puts " RIDES: #{ride.length} "

  earned = 0
  rating = 0
  max = 0

  ride.map do |ride|
    # Highest earning date per driver
    # Add ride cost only if it is greater than the max value
    # ride[:COST] => 24 > 0 <= max
    # Max will reset to 24 until number is greater
    if ride[:COST] > max
      max = ride[:COST]
      date = ride[:DATE], max
    end
    # Adding the sum of money each driver made
    earned = earned + ride[:COST]
    # Adding the sum of ratings for each driver
    rating = rating + ride[:RATING]
  end
  # Store sum of earnings for each driver
  money_earned[driver] = earned
  # Find Average divided by each ride length
  average = rating.to_f / ride.length
  # Store average rating in highest_rating
  highest_rating[driver] = average
  # Output to console earnings, average rating, highest earning date
  puts " EARNINGS: $#{'%.2f' % earned}"
  puts " AVERAGE RATING: #{'%.2f' % average} Stars"
  print " HIGHEST EARNING DATE: #{date.first} TOTAL: $#{'%.2f' % date.last}\n"
  puts
end
puts

# Storing equation to calculate which driver made the most money
def most_money(earnings)
  earnings.each do |driver, amount|
    if amount == earnings.values.max
      return [driver, amount]
    end
  end
end

puts  "#{most_money(money_earned).first} made the most money totalling $#{'%.2f' % most_money(money_earned).last} "
puts

#Storing equation to calculate which driver had the highest rating
def driver_rating(highest)
  highest.max_by do |driver, rating|
    if rating == highest.values.max
      return [driver, rating]
    end
  end
end

puts "#{driver_rating(highest_rating).first} has the hightest rating at: #{'%.2f' % driver_rating(highest_rating).last} stars"
puts
