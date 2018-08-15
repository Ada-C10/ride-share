def highest (max, hash)
  top_dog = hash.select {|id, info| info == max}
  return top_dog
end

def ride_cost (array)
  total = 0
  array.each do |each_trip|
    total += each_trip[:cost]
  end
  return total
end

ride_data = [
  {
    "DR0001" =>
    [
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
    ]
  },
  {
    "DR0002" =>
    [
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
    ]
  },
  {
    "DR0003" =>
    [
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
    ]
  },
  {
    "DR0004" =>
    [
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
]

earnings = {}
ratings = {}

ride_data.each do |drivers|
  drivers.each do |driver_id, data_array|
    amount_made = 0
    average_rating = 0
    max = 0
    best_day_ever = []
    earned_per_day = []

    puts "Driver ID: #{driver_id}"
    puts "Number of Rides Given: #{data_array.length}"

    # Group rides by date (date_hash) and creates a new array (earned_per_day)
    # that stores the sums of how much the driver earned per day (taking into
    # account that they might have given multiple rides on the same day)
    date_hash = data_array.group_by{|ride| ride[:date]}
    date_hash.each do |date, rides|
      cost = 0
      cost = ride_cost(rides)
      earned_per_day << {date => cost}
    end

    # Finds the day that the driver earned the most money and stores that
    # information in best_day_ever. Also takes into account if they had
    # multiple days in which they made a max profit.
    max = earned_per_day.max_by {|each_day| each_day.values}
    best_day_ever = earned_per_day.select {|each_day| each_day.values == max.values}

    # Calculates how much the driver made overall and their average rating
    amount_made = ride_cost(data_array)
    data_array.each do |each_trip|
      average_rating += each_trip[:rating]
    end

    puts "Amount Made: $#{amount_made}"
    puts "Average Rating: #{'%.2f' % (average_rating.to_f / data_array.length)}"
    print "Earned the most money on: "
    print best_day_ever
    puts "\n\n"

    earnings[driver_id] = amount_made
    ratings[driver_id] = average_rating.to_f / data_array.length
  end
end

print "Highest Earner(s): "
puts "#{highest(earnings.values.max, earnings)}"

print "Driver(s) with Highest Average Rating: "
puts "#{highest(ratings.values.max, ratings)}"
