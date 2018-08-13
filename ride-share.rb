# #nested info? = yes
# #how many rides? = yes
# #how much money? = yes
# average rating? = yes
# #most money? = yes
# #best rating? = yes

drivers = [{ #array with driver info
  id: "DR0001", #driver no. is hash
  rides: [{
         date: "2016/02/03",
         cost: 10,
         rider_id: "RD0003",
         rating: 3.0
       }, #end ride

       {
         date: "2016/02/03",
         cost: 30,
         rider_id: "RD0015",
         rating: 4.0
       }, #end ride

       {
         date: "2016/02/05",
         cost: 45,
         rider_id: "RD0073",
         rating: 2.0
       },
     ]#end ride
   }, #end driver



 {id: "DR0002",
 rides: [{
        date: "2016/02/03",
        cost: 25,
        rider_id: "RD0073",
        rating: 5.0
        },

        {
          date: "2016/02/04",
          cost: 15,
          rider_id: "RD0013",
          rating: 1.0
        },

        {
           date: "2016/02/04",
           cost: 5,
           rider_id: "RD0066",
           rating: 5.0
        },
      ],# end rides
    },

    {id: "DR0003",
    rides: [{
           date: "2016/02/04",
           cost: 5,
           rider_id: "RD0066",
           rating: 5.0
         },

          {
           date: "2016/02/05",
           cost: 50,
           rider_id: "RD0003",
           rating: 2.0
          },
         ]# end rides
      }, #end id

    {id: "DR0004",
    rides: [{
             date: "2016/02/03",
             cost: 5,
             rider_id: "RD0022",
             rating: 5.0
            },

            {
             date: "2016/02/04",
             cost: 10,
             rider_id: "RD0022",
             rating: 4.0
            },

            {
             date: "2016/02/04",
             cost: 20,
             rider_id: "RD0073",
             rating: 5.0
            },
          ]# end rides
    } #end id
]

def border
  puts "\n"
  puts "==" * 20
end

def driver_info(array)
  border
    array.each do |hash|
      driver_total = []
      ratings = []
      total_ratings = hash[:rides].length

      hash[:rides].each do |hash2|
          driver_total << hash2[:cost]
          ratings << hash2[:rating]
        end

      puts "\n#{hash[:id]} has done #{hash[:rides].length} rides, made $#{driver_total.reduce(:+)}, and has an average rating of #{((ratings.sum)/(total_ratings)).round(2)}."
      border
    end
end

def best_driver(array)
  best_total = 0
  best_id = ""

  array.each do |hash|
    driver_total = []

    hash[:rides].each do |hash2|
      driver_total << hash2[:cost]
      driver_sum = driver_total.sum
      if driver_sum > best_total
        best_total = driver_sum
        best_id = hash[:id]
      end
    end
  end
  puts "#{best_id} made the most money with $#{best_total}."
end
#
def best_ratings(array)
  best_total = 0
  best_id = ""

  array.each do |hash|
    rating_total = []
    hash[:rides].each do |hash2|
      average_of = hash[:rides].length
      rating_total << hash2[:rating]
      driver_sum = rating_total.sum
      rating_average = driver_sum/average_of

        if rating_average > best_total
          best_total = rating_average
          best_id = hash[:id]
        end
      end
  end
  puts "#{best_id} is the highest rated with an average rating of #{best_total.round(2)}"
end

puts "-._.-=-._." * 4
puts "    DRIVERS' RIDE INFORMATION "
puts "-._.-=-._." * 4

driver_info(drivers)

puts "\n"
puts "-._.-=-._." * 4
puts "    DRIVERS' RANKS "
puts "-._.-=-._." * 4
puts "\n"
best_driver(drivers)
border
best_ratings(drivers)
border
