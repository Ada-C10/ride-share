ride_share = [

  {
  driver_id: "DR0001",
  driver_data: [
    {
        date: "3rd Feb 2016",
        cost: 10,
        riderid: "RD0003",
        rating: 3
      },
      {
        date: "3rd Feb 2016",
        cost: 30,
        riderid: "RD0015",
        rating: 4
      },
      {
        date: "5th Feb 2016",
        cost: 45,
        riderid: "RD0003",
        rating: 2,
        }]
  },

  {
    driver_id: "DR0002",
    driver_data: [
      {
         date: "3rd Feb 2016",
         cost: 25,
         riderid: "RD0073",
         rating: 5
       },
       {
         date: "4th Feb 2016",
         cost: 15,
         riderid: "RD0013",
         rating: 1
       },
       {
         date: "5th Feb 2016",
         cost: 35,
         riderid: "RD0066",
         rating: 3
         }]
    },

    {
      driver_id: "DR0003",
      driver_data:[
        {
            date: "4th Feb 2016",
            cost: 5,
            riderid: "RD0066",
            rating: 5,
          },
          {
            date: "5th Feb 2016",
            cost: 50,
            riderid: "RD0003",
            rating: 2
          }]
    },

    {
      driver_id: "DR0004",
      driver_data: [
         {
            date: "3rd Feb 2016",
            cost: 5,
            riderid: "RD0022",
            rating: 5
          },
          {
            date: "4th Feb 2016",
            cost: 10,
            riderid: "RD0022",
            rating: 4
          },
          {
            date: "5th Feb 2016",
            cost: 20,
            riderid: "RD0073",
            rating: 5,
            }]
    }
]

total_moneys = []
  total_average_ratings = []
  # prints each driver's data
  ride_share.each_with_index do |driver, index|
    money_earned = []
    ratings = []
    sum = 0

    rides_given = driver[:driver_data].length
    puts "Driver #{driver[:driver_id]} details:\n"
    puts "Driver completed #{rides_given} trip(s)."

        driver[:driver_data].each do |trip|
          money_earned << trip[:cost]
          ratings << trip[:rating]
         end

    # average_rating = ratings.inject {|sum, el| sum + el } /ratings.size
    average_rating = (ratings.sum)/(ratings.length)

    puts "Driver made a total of $#{money_earned.sum}."
    puts "Average rating is: #{average_rating}"

    total_moneys << money_earned.sum
    total_average_ratings << average_rating

      driver[:driver_data].each do |days|
        if money_earned.max == days[:cost]
          puts "Driver made the most money on #{days[:date]}.\n\n"
        end
      end
  end


# compares driver data and prints the driver that made the most money and highest average.
  ride_share.each do |driver|
  total_cost = 0
  another_ratings = []

     driver[:driver_data].each do |t|
       total_cost += t[:cost]
       another_ratings << t[:rating]
     end


    if total_cost == total_moneys.max
       puts "#{driver[:driver_id]} made the highest with $#{total_cost}."
    end

    
    rating_average = another_ratings.sum / another_ratings.length

    if rating_average == total_average_ratings.max
       puts "#{driver[:driver_id]} has the highest average, #{rating_average}."
    end
  end
