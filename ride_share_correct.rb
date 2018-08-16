require "awesome_print"

def max_value(hash)
  hash.max_by{ |k, v| v }
end

ap drivers ={
  dr0001: [
    {
      rider: :RD0003,
      cost: 10,
      date: "3rd Feb 2016",
      rating: 3
    },
    {
      rider: :RD00015,
      cost: 30,
      date: "3rd Feb 2016",
      rating: 4
    },
    {
      rider: :RD0003,
      cost: 45,
      date: "5th Feb 2016",
      rating: 2
    }
  ],
  dr0002: [
    {
      rider: :RD0073,
      cost: 25,
      date: "3rd Feb 2016",
      rating: 5
    },
    {
      rider: :RD0013,
      cost: 15,
      date: "4th Feb 2016",
      rating: 1
    },
    {
      rider: :RD0066,
      cost: 35,
      date: "5th Feb 2016",
      rating: 3
    }
  ],
  dr0003: [
    {
      rider: :RD0066,
      cost: 5,
      date: "4th Feb 2016",
      rating: 5
    },
    {
      rider: :RD0003,
      cost: 50,
      date: "5th Feb 2016",
      rating: 2
    }
  ],
  dr0004: [
    {
      rider: :RD0022,
      cost: 5,
      date: "3rd Feb 2016",
      rating: 5
    },
    {
      rider: :RD0022,
      cost: 10,
      date: "4th Feb 2016",
      rating: 4
    },
    {
      rider: :RD0073,
      cost: 20,
      date: "5th Feb 2016",
      rating: 5
    }
  ]
}

total_money_made ={}
total_averages = {}
rider_dates = []
best_day = ""

drivers.keys.each.with_index do |driver, x|
  money_made = 0
  total_rating = 0
  average_rating = 0
  best_day_money = 0
  rider_dates = []
  merged_rider_dates = []

  puts "\n\n#{driver.upcase} INFO:"

  puts "Total Rides: #{drivers[driver].length}"

  drivers[driver].length.times do |x|
    money_made += drivers[driver][x][:cost]
    total_rating += drivers[driver][x][:rating]
    rider_dates << {date: drivers[driver][x][:date],
      cost: (drivers[driver][x][:cost])}
  end
  # money_earned
  total_money_made[driver] = money_made
  puts "Money Made: $#{money_made}"

  #average ratings
  average_rating = total_rating.to_f / drivers[driver].length
  total_averages[driver] = average_rating.round(2)
  puts "Average Rating: #{average_rating.round(2)}"

  # most profitable day
    # https://stackoverflow.com/questions/24233493/merge-duplicates-in-array-of-hashes
    # grouping by date (3rd Feb 2016, etc.)
  merged_rider_dates = rider_dates.group_by { |ride| ride[:date] }.map do |k,v|
    { :date => k, :cost => v.map { |same_day_ride| same_day_ride[:cost] }.sum }
  end

  best_day = merged_rider_dates.max_by { |hash| hash[:cost] }[:date]

  print "Most profitable day: #{best_day}"
end

money_winner = max_value(total_money_made)

# .first puts key
# .last puts value
puts "\n\n#{money_winner.first} made the most money with a total of \
$#{money_winner.last}"

#Driver with best average
average_winner = max_value(total_averages)

print "\n#{average_winner.first} had the best average \
with #{average_winner.last} stars"
