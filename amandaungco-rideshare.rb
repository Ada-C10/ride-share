drivers_raw_data = {
    DR0004:
      [
         {
           date: "2016.02.03",# year.month.day
           rider: "RD0022",
           cost: 5,
           rating: 5
         },
         {
           date: "2016.02.04",
           rider:"RD0022",
           cost:10,
           rating:4
         },
         {
           date:"2016.02.05",
           rider:"RD0073",
           cost:20,
           rating:5
         }
       ],
    DR0001:
        [
          {
            date: "2016.02.03",
            rider: "RD003",
            cost: 10,
            rating: 3
          },
          {
            date: "2016.02.03",
            rider:"RD0015",
            cost: 30,
            rating: 4
          },
          {
            date:"2016.02.05",
            rider: "RD0003",
            cost:45,
            rating: 2
          }
            ],


    DR0002:
     [
          {
            date:"2016.02.03",
            rider:"RD0073",
            cost: 25,
            rating: 5
          },
          {
            date:"2016.02.04",
            rider: "RD0013",
            cost:15,
            rating:1
          },
          {
            date:"2016.02.05",
            rider:"RD066",
            cost:35,
            rating:3
          }
            ],
    DR0003:
      [
          {
            date: "2016.02.04",
            rider:"RD066",
            cost:5,
            rating:5
          },
          {
            date:"2016.02.05",
            rider:"RD0003",
            cost:50,
            rating:2
          }
        ]

}

drivers_to_number_of_rides= {}
drivers_to_money_earned = {}
drivers_to_average_rating = {}
drivers_to_best_day = {}

drivers_raw_data.each do |driver, rides|
    drivers_to_number_of_rides[driver] = rides.length
    total_money_earned = rides.reduce(0) {|sum, ride| sum + ride[:cost]}
    drivers_to_money_earned[driver] = total_money_earned
    total_ratings = rides.reduce(0) {|sum, ride| sum + ride[:rating]}
    average_rating = total_ratings.to_f/rides.length
    drivers_to_average_rating[driver] = average_rating
    puts "#{driver}: total rides: #{rides.length}\n total earnings: $#{total_money_earned}\n average rating:#{average_rating.round(2)}"
  end

top_earner = drivers_to_money_earned.max_by {|driver, earnings| earnings}
puts "#{top_earner[0]} made the most money at $#{top_earner[1]}"

highest_rated = drivers_to_average_rating.max_by {|driver, rating| rating}
puts "#{highest_rated[0]} had the highest rating of #{highest_rated[1].round(2)}"
