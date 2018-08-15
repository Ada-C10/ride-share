# #######################################################
# # Step 1: Establish the layers
#
#   # Write a list of the layers here
#   # layer 1:  all drivers
#   # layer 2:  each drivers  driver_ID :   string  , rides: array
#   # layer 3:  array of rides
#   # layer 4:  hash rides information    ride_ID :    ride_rate:  ride_cost:   ride_date:
#
# ########################################################
# # Step 2: Assign a data structure to each layer
#
#   # layer 1:  all drivers  - array
#   # layer 2:  each drivers  - hash
#   # layer 3:  all rides  -array
#   # layer 4:  each ride  -hash
#
# ########################################################
# # Step 3: Make the data structure!

# set up an array list for all dirvers . each driver has a hash to input the driver's id and a array for all the rides.
def create_drivers(arr_id)
  result = arr_id.map do |item|
    {id:item, rides:[]}
  end
  return result
end

# read the rides detail information, create a hash for each ride, and put it into the rides array created for each driver
def create_rides(arr_file, arr_id)
  drivers = create_drivers(arr_id)

  arr_file.each do |item|
    arr_input = item.split(",")
    h_ride = {date:arr_input[1], cost:arr_input[2].to_f, ride:arr_input[3], rate:arr_input[4].to_i}
    id = arr_input[0]
    idx = arr_id.index(id)
    drivers[idx][:rides].push(h_ride)
  end

  return drivers
end

# main, crate the data structure and input all the rides informations
id_list = ["DR0001","DR0002","DR0003","DR0004"]
file = ["DR0004,3rd Feb 2016,5,RD0022,5","DR0001,3rd Feb 2016,10,RD0003,3","DR0002,3rd Feb 2016,25,RD0073,5","DR0001,3rd Feb 2016,30,RD0015,4","DR0003,4th Feb 2016,5,RD0066,5","DR0004,4th Feb 2016,10,RD0022,4","DR0002,4th Feb 2016,15,RD0013,1","DR0003,5th Feb 2016,50,RD0003,2","DR0002,5th Feb 2016,35,RD0066,3","DR0004,5th Feb 2016,20,RD0073,5","DR0001,5th Feb 2016,45,RD0003,2"]

arr_drivers = create_rides(file, id_list)
puts "\nHere is the data structure: \n\n"
puts "#{arr_drivers}"

########################################################
# Step 4: Total Driver's Earnings and Number of Rides

  # Use an iteration block to print driver's total rides and money made

# calculate the money made by each driver and the average rates of each driver
def calculate_per_driver(driver_data)
  driver_sum = []
  driver_data.each do |item|
    ride_num = item[:rides].length
    arr_money = item[:rides].map { |ride| ride[:cost] }
    total_money = arr_money.sum
    total_rates = item[:rides].map { |ride| ride[:rate] }
    aver_rate = (1.0 * total_rates.sum / ride_num).round(1)
    driver_sum.push({id: item[:id], ride_num:ride_num, total_money:total_money, aver_rate: aver_rate})
  end
  return driver_sum
end

# find the drivers who made the most money
def money_top(driver_sum)
  arr_money = driver_sum.map { |driver|  driver[:total_money]}
  money_max = arr_money.max
  money_name = ""

  driver_sum.each do |item|
    if item[:total_money] == money_max
      money_name << item[:id] << " "
    end
  end

  money_result = [money_max, money_name]
  return money_result
end

# find the dirver who has the highest rating
def rate_top(driver_sum)
  arr_rate = driver_sum.map { |driver| driver[:aver_rate]}
  rate_max = arr_rate.max
  rate_name = ""

  driver_sum.each do |item|
    if item[:aver_rate] == rate_max
      rate_name << item[:id] << " "
    end
  end

  rate_result = [rate_max, rate_name]
  return rate_result
end

# print out performance report
def report(driver_sum, money_result, rate_result)
  puts "\nPerformance Report: \n\n"

  driver_sum.each do |item|
    puts "Driver ##{item[:id]}:  #{item[:ride_num]} rides, made $#{item[:total_money]}, averate rate #{item[:aver_rate]}"
  end

  puts "\nDriver(s) made the most money $#{money_result[0]}: #{money_result[1]}"
  puts "Driver(s) got the highese average rating #{rate_result[0]}: #{rate_result[1]}\n\n"
end

# run the program
driver_info = calculate_per_driver(arr_drivers)
money_info = money_top(driver_info)
rate_info = rate_top(driver_info)
report(driver_info, money_info, rate_info)
