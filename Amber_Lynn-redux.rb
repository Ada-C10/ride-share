rideshare = {
  :DR0001 => [
    {
      :date => "3rd Feb 2016",
      :rider_id => "RD0003",
      :cost => 10.00,
      :rating => 3
    },
    {
      :date => "3rd Feb 2016",
      :rider_id => "RD0015",
      :cost => 30.00,
      :rating => 4,
    },
    {
      :date => "5th Feb 2016",
      :rider_id => "RD0003",
      :cost => 45.00,
      :rating => 2
    }
  ],
  :DR0002 => [
    {
      :date => "3rd Feb 2016",
      :rider_id => "RD0073",
      :cost => 25.00,
      :rating => 5,
    },
    {
      :date => "4th Feb 2016",
      :rider_id => "RD0013",
      :cost => 15.00,
      :rating => 1,
    },
    {
      :date => "5th Feb 2016",
      :rider_id => "RD0003",
      :cost => 45.00,
      :rating => 2
    },
    {
      :date => "5th Feb 2016",
      :rider_id => "RD0066",
      :cost => 35.00,
      :rating => 3
    }
  ],
  :DR0003 => [
    {
      :date => "4th Feb 2016",
      :rider_id => "RD0066",
      :cost => 5.00,
      :rating => 5
    },
    {
      :date => "5th Feb 2016",
      :rider_id => "RD0003",
      :cost => 50.00,
      :rating => 2
    }
  ],
  :DR0004 => [
    {
      :date => "3rd Feb 2016",
      :rider_id => "RD0022",
      :cost => 5.00,
      :rating => 5
    },
    {
      :date => "4th Feb 2016",
      :rider_id => "RD0022",
      :cost => 10.00,
      :rating => 4
    },
    {
      :date => "45h Feb 2016",
      :rider_id => "RD0073",
      :cost => 20.00,
      :rating => 2
    }
  ]
}

puts " "

rideshare[:DR0001].each do |x|
  puts "Driver 1 data = #{x}"
end

puts " "

rideshare[:DR0002].each do |x|
  puts "Driver 2 data = #{x}"
end

puts " "

rideshare[:DR0003].each do |x|
  puts "Driver 3 data = #{x}"
end

puts " "

rideshare[:DR0004].each do |x|
  puts "Driver 4 data = #{x}"
end

puts " "

def get_total_rides(hash, key)
  total_rides = 0
  x = []

  hash[key].map.each_with_index do |(key, value), index|
    x << "key: #{key}, value: #{value}, index: #{index}\n"
    total_rides += 1
  end

  return total_rides
end


driver_1_cost_total = get_total_rides(rideshare, :DR0001)
puts "Driver 1 had a total of #{driver_1_cost_total} rides."

driver_2_cost_total = get_total_rides(rideshare, :DR0002)
puts "Driver 2 had a total of #{driver_2_cost_total} rides."

driver_3_cost_total = get_total_rides(rideshare, :DR0003)
puts "Driver 3 had a total of #{driver_3_cost_total} rides."

driver_4_cost_total = get_total_rides(rideshare, :DR0004)
puts "Driver 4 had a total of #{driver_4_cost_total} rides."

puts "=" * 30

def get_total_amt(hash, key)
  total_amt = 0.0

  x = hash[key].map.count.times do |i|
    total_amt += "#{hash[key][i][:cost]}".to_f
  end

  return total_amt
end

driver_1_amt = get_total_amt(rideshare, :DR0001)
puts "Driver 1 = $#{driver_1_amt}"

driver_2_amt = get_total_amt(rideshare, :DR0002)
puts "Driver 2 = $#{driver_2_amt}"

driver_3_amt = get_total_amt(rideshare, :DR0003)
puts "Driver 3 = $#{driver_3_amt}"

driver_4_amt = get_total_amt(rideshare, :DR0004)
puts "Driver 4 = $#{driver_4_amt}"


driver_amt_array = [driver_1_amt, driver_2_amt, driver_3_amt, driver_4_amt]


def most_made?(drivers, drivers_sum)
  max = 0
  maxStore = ""
  drivers_sum.length.times do |i|
    if drivers_sum[i] > max
      max = drivers_sum[i]
      maxStore = drivers[i]
    end
  end
  return maxStore
end
    
mostest = most_made?(rideshare.keys, driver_amt_array)
puts "\nThe driver that made the most was #{mostest}"


puts "=" * 30


def get_avg_rating(hash, key)
  total_rating = 0
  avg = 0.00

  x = hash[key].map.count.times do |i|
    total_rating += "#{hash[key][i][:rating]}".to_f
  end

  avg = total_rating / (hash[key].count)

  return avg.to_f
end


driver_1_avg = get_avg_rating(rideshare, :DR0001)
puts "Driver 1's average was #{driver_1_avg}"

driver_2_avg = get_avg_rating(rideshare, :DR0002)
puts "Driver 2's average was #{driver_2_avg}"

driver_3_avg = get_avg_rating(rideshare, :DR0003)
puts "Driver 3's average was #{driver_3_avg}"

driver_4_avg = get_avg_rating(rideshare, :DR0004)
puts "Driver 4's average was #{driver_4_avg}"


driver_avg_array = [driver_1_avg, driver_2_avg, driver_3_avg, driver_4_avg]


def highest_avg?(drivers, drivers_avg)
  max = 0
  maxStore = ""
  drivers_avg.length.times do |i|
    if drivers_avg[i] > max
      max = drivers_avg[i]
      maxStore = drivers[i]
    end
  end
  return maxStore
end

highest = highest_avg?(rideshare.keys, driver_avg_array)
puts "\nThe driver with the highest average was #{highest}"
