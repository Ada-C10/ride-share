RIDES = [
  {
    driver_id: 'DR0004',
    date: '2016-02-03',
    cost: 5,
    rider_id: 'RD0022',
    rating: 5
  },
  {
    driver_id: 'DR0001',
    date: '2016-02-03',
    cost: 100,
    rider_id: 'RD0003',
    rating: 3
  },
  {
    driver_id: 'DR0002',
    date: '2016-02-03',
    cost: 25,
    rider_id: 'RD0073',
    rating: 5
  },
  {
    driver_id: 'DR0001' ,
    date: '2016-02-03',
    cost: 30,
    rider_id: 'RD0015',
    rating: 4
  },
  {
    driver_id: 'DR0003',
    date: '2016-02-04',
    cost: 5,
    rider_id: 'RD0066',
    rating: 5
  },
  {
    driver_id: 'DR0004',
    date: '2016-02-04',
    cost: 10,
    rider_id: 'RD0022',
    rating: 4
  },
  {
    driver_id: 'DR0002',
    date: '2016-02-04',
    cost: 15,
    rider_id: 'RD0013',
    rating: 1
  },
  {
    driver_id: 'DR0003',
    date: '2016-02-05',
    cost: 50,
    rider_id: 'RD0003',
    rating: 2
  },
  {
    driver_id: 'DR0002',
    date: '2016-02-05',
    cost: 35,
    rider_id: 'RD0066',
    rating: 3
  },
  {
    driver_id: 'DR0004',
    date: '2016-02-05',
    cost: 20,
    rider_id: 'RD0073',
    rating: 5
  },
  {
    driver_id: 'DR0001',
    date: '2016-02-05',
    cost: 45,
    rider_id: 'RD0003',
    rating: 2
  }
]

def print_driver_with_highest_ratings(driver_dets)
  puts "The Driver with the highest ratings was '#{find_highest_rated(driver_dets)}' with #{find_highest_ratings(driver_dets)} stars."
end

def print_driver_with_highest_earnings(driver_dets)
  puts "The Driver with the highest earnings was '#{find_highest_earner(driver_dets)}' with $#{find_highest_earnings(driver_dets)}."
end

def print_driver_details(drivers, num_of_rides, total_earnings, avg_rating, highest_paid_date)
  puts "\n========================DRIVER DETAILS========================"
  i = 0
  drivers.each do |driver_id|
    puts "#{i+1}. '#{driver_id}' || Number of Rides Given: #{num_of_rides[i]} | Total Earnings: $#{total_earnings[i]} | Average Rating: #{avg_rating[i]} | Date Most made: #{highest_paid_date[i].values[0][0]} (Amount: $#{highest_paid_date[i].values[0][1]})"
    i += 1
  end
  puts ""
end

def merge_hashes(date)
  return date.inject{|date, cost| date.merge( cost ){|k, old_v, new_v| old_v + new_v}}.max_by{ |date, cost| cost  }
end

def find_highest_ratings(driver_dets)
  return driver_dets.max_by{ |driver_info| driver_info[:rating] }[:rating]
end

def find_highest_rated(driver_dets)
  return driver_dets.max_by{ |driver_info| driver_info[:rating] }[:driver_id]
end

def find_highest_earnings(driver_dets)
  return driver_dets.max_by{ |driver_info| driver_info[:earnings] }[:earnings]
end

def find_highest_earner(driver_dets)
  return driver_dets.max_by{ |driver_info| driver_info[:earnings] }[:driver_id]
end

def rounded_float(num)
  sprintf('%.2f', num.to_f.round(2))
end

def find_avg_rating(driver_id)
  total_ratings = []
  RIDES.each do |ride|
    if driver_id == ride[:driver_id]
      total_ratings << ride[:rating]
    end
  end
  average = (total_ratings.reduce(:+) / total_ratings.length)
  return rounded_float(average)
end

def find_driver_earnings(driver_id)
  driver_total = 0

  RIDES.each do |ride|
    if driver_id == ride[:driver_id]
      driver_total += ride[:cost]
    end
  end
  return rounded_float(driver_total)
end

def find_total_rides(driver_id)
  total_rides = 0
  RIDES.each do |ride|
    if driver_id == ride[:driver_id]
      total_rides += 1
    end
  end
  return total_rides
end

drivers = RIDES.map { |ride| ride[:driver_id] }.uniq

num_of_rides = []
total_earnings = []
avg_rating = []

drivers.each do |driver_id|
  num_of_rides << "#{find_total_rides(driver_id)}"
  total_earnings << "#{find_driver_earnings(driver_id)}"
  avg_rating << "#{find_avg_rating(driver_id)}"
end

driver_dets = []
i = 0
drivers.each do |driver|
  driver_info  = {}
  driver_info[:driver_id] = driver
  driver_info[:earnings] = total_earnings[i]
  driver_info[:rating] = avg_rating[i]
  driver_dets << driver_info
  i += 1
end

rides_by_date = RIDES.group_by{ |h| h[:driver_id]}
.each{|_, v| v.map!{ |h| { h[:date] => h[:cost] } } }

rides_by_date.values.each do |date|
  date.group_by{|h| h.keys.first}.values
  .map{|a| {
    a.first.keys.first =>
    a.inject(0){|sum, h| sum + h.values.first}
    }}
end

highest_paid_date = []

rides_by_date.values.each do |date|
  driver_highest  = {}
  driver = drivers[i]
  driver_highest[driver] = merge_hashes(date)
  i += 1
  highest_paid_date << driver_highest
end

print_driver_details(drivers, num_of_rides, total_earnings, avg_rating, highest_paid_date)
print_driver_with_highest_earnings(driver_dets)
print_driver_with_highest_ratings(driver_dets)
