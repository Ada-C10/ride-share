# Step 1
# Drivers container
  # Container per driver
    # Driver container has:
      #driver id, ride information, total earned, average rating

# Step 2
# Array of drivers
  # Each driver has a hash
    # Hash has key/value pairs for
      # Driver ID - String
      # Rides - Array of ride hashes
        # Ride hash - Key/value pairs for
          # Date
          # Cost
          # Rider_id
          # Rating
        # Total earned
        # Averagerating

# Step 3
# Creating array of drivers
drivers = [
  # Each driver has a hash
  {
    driver_id: "DR0001",
    rides: [
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
    total_earned: 0,
    average_rating: 0
  },
  {
    driver_id: "DR0002",
    rides: [
      {
        date: "3rd Feb 2016",
        cost: 25,
        rider_id: "RD0073",
        rating: 5
      },
      {
        date: "4th Feb 2016",
        cost: 15,
        rider_id: "RD0015",
        rating: 1
      },
      {
        date: "5th Feb 2016",
        cost: 35,
        rider_id: "RD0066",
        rating: 3
      }
    ],
    total_earned: 0,
    average_rating: 0
  },
  {
    driver_id: "DR0003",
    rides: [
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
    total_earned: 0,
    average_rating: 0
  },
  {
    driver_id: "DR0004",
    rides: [
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
      },
    ],
    total_earned: 0,
    average_rating: 0
  },
]

# Step 4
drivers.each do |driver|
  # CREATING SUM of driver's rating by adding all ratings for the driver
  rating_sum = driver[:rides].map {|ride| ride[:rating] }.reduce(0, :+)
  # CREATING SUM of driver's amount earned by adding all ride costs for the driver
  driver[:total_earned] = driver[:rides].map { |ride| ride[:cost] }.reduce(0, :+)
  # CREATING AVERAGE driver rating by dividing the rating sum by the number of rides
  driver[:average_rating] = rating_sum / driver[:rides].length
  # Adding a visual separator between each driver
  puts "*" * 30

  # PRINTING driver information
  puts "Driver: #{driver[:driver_id]}"
  puts "Total Number of Rides: #{driver[:rides].length}"
  puts "Earned: $#{'%.2f' % driver[:total_earned]}"
  puts "Average Rating: #{driver[:average_rating]}"
end

# CREATING MAX earned value for which driver earned the most
most_earned = drivers.max_by { |driver| driver[:total_earned] }[:total_earned]
puts "\nThe following drivers earned the most at $#{'%.2f' % most_earned}:"

# PRINTING drivers that earned the most
puts drivers.max_by{ |driver| driver[:total_earned] }[:driver_id]

# PRINTING drivers with the top average rating
puts "The following drivers had the top average rating at:"
puts drivers.max_by{ |driver| driver[:average_rating] }[:driver_id]
