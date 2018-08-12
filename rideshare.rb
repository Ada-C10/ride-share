# -Iterate through the data structure to display, by printing in terminal, the following info:-

# create a hash to store all driver data.
# in that hash, each driver will have an array of hashes that contain all the ride info

drivers =
    {
      DR0001:
      [
        {
          date: "2006-02-03",
          rider_id: "RD0003",
          cost: 10,
          rating: 3
        },
        {
          date: "2006-02-03",
          rider_id: "RD0015",
          cost: 30,
          rating: 4
        },
        {
          date: "2006-02-05",
          rider_id: "RD0003",
          cost: 45,
          rating: 2
        }
      ],


      DR0002:
      [
        {
          date: "2006-02-03",
          rider_id: "RD0073",
          cost: 25,
          rating: 5
        },
        {
          date: "2006-02-04",
          rider_id: "RD0013",
          cost: 15,
          rating: 1
        }
      ],


      DR0003:
      [
        {
          date: "2006-02-04",
          rider_id: "RD0066",
          cost: 5,
          rating: 5
        },
        {
          date: "2006-02-05",
          rider_id: "RD0003",
          cost: 50,
          rating: 3
        },
      ],

      DR0004:
      [
        {
          date: "2006-02-04",
          rider_id: "RD0022",
          cost: 5,
          rating: 5
        },
        {
          date: "2006-02-05",
          rider_id: "RD0073",
          cost: 20,
          rating: 5
        }
      ]
    }

# drivers {driver => [rides => {each trip}] }

# -The number of rides each driver has given-
# find how to acess each element
# puts drivers.length
# puts drivers[:DR0001][0][:rating]
# while iterating over hashes, the first variable is always the key, the second the value

drivers.each do |driver, rides|
  puts "Driver #{driver} had #{rides.length} trips."
end


# -The total amount of money each driver has made-
# create an each loop to access the rides/trips
# in that loop, do ANOTHER loop to access the value of the rides/trips (cost)

drivers.each do |driver, rides| #outer driver hash
  total = 0 #make a variable to find the sum. set it to 0
  rides.each do |ride| #rides/trip array
    total += ride[:cost]  #access the value in the hash. Add the value of the cost to the total
  end
  puts "Driver #{driver} made $#{total}"
end



  # -The average rating for each driver-
drivers.each do |driver, rides|
  sum = 0
  rides.each do |ride|
    sum += ride[:rating]

  end
  average = sum / rides.length
  puts "Driver #{driver} made an average rating of #{average}"

end

  # -Which driver made the most money?-
  # use max_by? get the sum of all the drivers values divide by the # of rides?
  # make a hash to store driver and total
  # put that into a new array for each driver, total up the array and find the highest earner

sum_array = []
drivers.each do |driver, rides| #in the drivers hash, iterating over the rides
  sum = 0
  rides.each do |ride| #iterating over the rides array
    sum += ride[:cost]
  end
    # puts sum

    sum_hash = {driver: driver, total: sum} # create a hash to store the total associated with the driver
    # puts "#{sum_hash}"
    sum_array << sum_hash # put that hash into an array to iterate to find the max_by
    # puts sum_array
end
  # puts sum_array

highest_num = sum_array.max_by do |value| # max_by finds the largest in the array. assign to a variable to access the value
   value[:total]
end

puts "Driver #{highest_num[:driver]} made the most with a total of $#{highest_num[:total]}."


    # -Which driver has the highest average rating?-
    # use the average rating for each driver
    # put the driver and their averages into a hash

  average_array = []
  drivers.each do |driver, rides|
    sum = 0
    rides.each do |ride|
      sum += ride[:rating]
    end

      average = sum / rides.length
      # puts "#{average}"
      average_hash = {driver: driver, rating: average}
      average_array << average_hash
      # puts "#{average_array}"
      # average_array << average
end

# puts "#{average_array}"

# do max_by to iterate over the array

highest_num = average_array.max_by do |value|
   value[:rating]
 end
puts "Driver #{highest_num[:driver]} had the highest average at #{highest_num[:rating]}."
