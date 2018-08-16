# This project is doing me a major frustrate. Despite much effort I cannot get the driver rating to iterate properly.
all_drivers = {"DR0001" =>
  [{"date" => "2016-02-03",
    :cost => 10,
    "rider_ID" => "RD0003",
    "rating" => 3
  },
  {
    "date" => "2016-02-03",
    :cost => 30,
    "rider_ID" => "RD0015",
    "rating" => 4
  },
  {
    "date" => "20016-02-05",
    :cost => 45,
    "rider_ID" => "RD0003",
    "rating" => 2
  }
],
"DR0002" =>
[{:date => "2016-02-03",
  :cost => 25,
  :rider_ID => "RD0073",
  :rating => 5
},
{
  :date => "2016-02-04",
  :cost => 15,
  :rider_ID => "RD0013",
  :rating => 1
},
{
  :date => "2016-02-05",
  :cost => 35,
  :rider_ID => "RD0066",
  :rating => 3
}
],
"DR0003" =>
[{:date => "2016-02-04",
  :cost => 5,
  :rider_ID => "RD0066",
  :rating => 5
},
{
  :date => "2016-02-05",
  :cost => 50,
  :rider_ID => "RD0003",
  :rating => 2
}
],
"DR0004" =>
[{
  :date => "2016-02-03",
  :cost => 5,
  :rider_ID => "RD0022",
  :rating => 5
},
{
  :date => "2016-02-04",
  :cost => 10,
  :rider_ID => "RD0022",
  :rating => 4}
  ]}

  all_drivers.each do |key, value|
    date_rides = value.sort_by {|array| array[:date]}
    cost_total = date_rides.map do |array| array[:cost]
    end
    puts "#{key} has earned $#{cost_total.sum}."
    puts "#{key} has given #{cost_total.length} rides.\n\n"
  end

  all_drivers.each do |key, value|
    rider_rating = value.sort_by {|array| array[:rider_ID]}
    driver_rating = rider_rating.map do |array| array[:rating]
    end
    puts driver_rating
    puts "#{key} has a rating of #{driver_rating.length}"
  end

  # *******************
  # reduce(:+)/driver_rating.length.to_f
  # driver_rating.reduce(:+)/driver_rating.length.to_f
  # puts driver_rating.reduce(:+).to_f / driver_rating.size
  #  single_rating = driver_rating.reduce(:+)/driver_rating.length.to_f
