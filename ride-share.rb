# ride-share.rb
# https://github.com/Ada-C10/ride-share

############ To make it more clear how the program works,
############ I modified one point in the dataset.
############ Driver 2's cost was originally 25.

master = {
  drivers: [
    { driver_id: "DR0002" ,
      rides: [
        { date: "3rd Feb 2016" ,
          cost: 35 , ####################25!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
          rider_id: "RD0073" ,
          rating: 5
          } ,
          { date: "3rd Feb 2016" ,
            cost: 15 ,
            rider_id: "RD0013" ,
            rating: 1
            } ,
            { date: "5th Feb 2016" ,
              cost: 35 ,
              rider_id: "RD0066" ,
              rating: 3
            }
          ]
          } ,
          { driver_id: "DR0001" ,
            rides: [
              { date: "3rd Feb 2016" ,
                cost: 10 ,
                rider_id: "RD0003" ,
                rating: 3
                } ,
                { date: "3rd Feb 2016" ,
                  cost: 30 ,
                  rider_id: "RD0015" ,
                  rating: 4
                  } ,
                  { date: "5th Feb 2016" ,
                    cost: 45 ,
                    rider_id: "RD0003" ,
                    rating: 2
                  }
                ]
                } ,
                { driver_id: "DR0003" ,
                  rides: [
                    { date: "4th Feb 2016" ,
                      cost: 5 ,
                      rider_id: "RD0066" ,
                      rating: 5
                      } ,
                      { date: "5th Feb 2016" ,
                        cost: 50 ,
                        rider_id: "RD0003" ,
                        rating: 2
                        } ,
                      ]
                      } ,
                      { driver_id: "DR0004" ,
                        rides: [
                          { date: "3rd Feb 2016" ,
                            cost: 5 ,
                            rider_id: "RD0022" ,
                            rating: 5
                            } ,
                            { date: "4th Feb 2016" ,
                              cost: 10 ,
                              rider_id: "RD0022" ,
                              rating: 4
                              } ,
                              { date: "5th Feb 2016" ,
                                cost: 20 ,
                                rider_id: "RD0073" ,
                                rating: 5
                              }
                            ]
                          }
                        ]
                      }

###########################################################################
# Given: A dataset ("master") of driver IDs and each drivers' rides
#        over a specified period of days
# Goal 1: A results_table (array of hashes) that lists:
  # a) driver_id
  # b) tot_rides
  # c) tot_cost
  # d) avg_rating
  # e) best_day
# Goal 2: The top_driver (driver_id) in two categories:
  # a) tot_cost
  # b) avg_rating
# Goal 3: Print results_table
# Goal 4: Print top_drivers
###########################################################################

# Page formatting:
SCREEN_WIDTH = 100

def header(subtitle, sort_subtitle="SORTED BY: driver_id, lowtohigh")
  puts ":" * SCREEN_WIDTH, "\n"
  puts "RIDE SHARE REPORT!".center(SCREEN_WIDTH)
  puts subtitle.center(SCREEN_WIDTH)
  puts sort_subtitle.center(SCREEN_WIDTH), "\n"
end

def footer
  puts "\n", ":" * SCREEN_WIDTH
end

# Goal 1:         # make_results_table(drivers,sort_by,order) => results_table
                  # best_day(rides)
                  # sort_results_table(results_table,sort_by,order) => results_table

def make_results_table(drivers,sort_by=:driver_id,order=:lowtohigh)
  # drivers = master[:drivers]
  # sort_by = any key in results_table
  # order = :hightolow or :lowtohigh
  results_table = Array.new
  drivers.each do |h|
    orphan = Hash.new
    orphan[:driver_id] = h[:driver_id]
    orphan[:tot_rides] = h[:rides].size
    orphan[:tot_cost] = h[:rides].reduce(0) {|m,h| m + h[:cost]}
    orphan[:avg_rating] = (( h[:rides].reduce(0) {|m,h| m + h[:rating]}
                          ) / h[:rides].size.to_f ).round(3)
    orphan[:best_day] = best_day(h[:rides])
    results_table << orphan
  end

  sort_results_table(results_table,sort_by,order)
  return results_table
end

def best_day(rides)
  top_cost = rides.max_by{|h|h[:cost]}[:cost]
  rides.select{|h| h[:cost] == top_cost}.map{|h| h[:date]}
end

def sort_results_table(results_table,sort_by,order)
  case order
  when :hightolow
    results_table.sort_by!{ |h| h[sort_by] }.reverse!
  when :lowtohigh
    results_table.sort_by!{ |h| h[sort_by] }
  else
    puts "~ ARGUMENT ERROR IN sort_results_table ~"
  end
  return results_table
end

# Goal 2:         # add_top_driver(results_table,top_drivers,rank_by) => top_drivers[rank_by]
def add_top_driver(results_table,top_drivers,rank_by)
  top_score = results_table.max_by{|h|h[rank_by]}[rank_by]
  top_driver = results_table.select{|h| h[rank_by] == top_score }.map{|h| h[:driver_id]}
  top_drivers[rank_by] = {top_score: top_score, drivers: top_driver}
end

# Goal 3:         # print_results_table(results_table)
def print_results_table(results_table)
  column_headings = results_table[0].keys.map{|key| key.to_s.gsub("_"," ").upcase}
  column_headings[4] << "(S)"
  column_headings.each {|k| printf("%-15s", k)}
  results_table.each do |h|
    puts "\n"
    a = h[:driver_id]
    b = h[:tot_rides]
    c = h[:tot_cost]
    d = h[:avg_rating]
    e = h[:best_day]*", "
    printf("%-15s%-15d$%-14s%-15.2f%-15s", a, b, c, d, e)
  end
  puts "\n"
end

# Goal 4:         # print_top_drivers(top_drivers)
def print_top_drivers(top_drivers)
  puts "\n", "DRIVER SUMMARY"
  a = top_drivers[:tot_cost][:top_score]
  b = top_drivers[:tot_cost][:drivers]*", "
  c = top_drivers[:avg_rating][:top_score]
  d = top_drivers[:avg_rating][:drivers]*", "
  printf("%-45s$%-7d%-30s", "Highest earnings in this period~", a, b)
  puts "\n"
  printf("%-45s%-8.2f%-30s", "Highest rating average in this period~", c, d)
  puts "\n"
end

# Extra:        # ask_to_resort(results_table)
def ask_to_resort(results_table)
  puts "\n\td (Driver ID)\tr (Tot Rides)\tc (Tot Cost)\ta (Avg Rating)\tq (Quit)"
  print "Sort results table by: > "
  sort_by = $stdin.gets.chomp
  allowed = %w(d r c a q)
  until allowed.include?(sort_by)
    print "Sort results table by: > "
    sort_by = $stdin.gets.chomp
  end
  sort_by =
    if sort_by == "d"
      :driver_id
    elsif sort_by == "r"
      :tot_rides
    elsif sort_by == "c"
      :tot_cost
    elsif sort_by == "a"
      :avg_rating
    elsif sort_by == "q"
      footer
      exit
    end
  puts "\td (Descending)\ta (Ascending)"
  print "Sort order: > "
  order = $stdin.gets.chomp
  allowed = %w(d a)
  until allowed.include?(order)
    print "Sort order: > "
    order = $stdin.gets.chomp
  end
  order =
    if order == "d"
      :hightolow
    elsif order == "a"
      :lowtohigh
    end
  puts "\n"
  results_table = sort_results_table(results_table,sort_by,order)
  header("3rd Feb 2016 - 5th Feb 2016","SORTED BY: #{sort_by}, #{order}")
  print_results_table(results_table)
  footer
  ask_to_resort(results_table)
end

header("3rd Feb 2016 - 5th Feb 2016")
drivers = master[:drivers]
results_table = make_results_table(drivers)
top_drivers = Hash.new
add_top_driver(results_table,top_drivers,:tot_cost)
add_top_driver(results_table,top_drivers,:avg_rating)
print_results_table(results_table)
print_top_drivers(top_drivers)
footer
ask_to_resort(results_table)
footer

# TO DO
# put master in a separate file
# how to make sort_by have a secondary sort? tertiary?
# simplest way for ruby to recognize the date? and sort dates?
# autocomplete date range field in the subtitle
# custom error messages?
# change 35-->25 (Driver 2's cost)
