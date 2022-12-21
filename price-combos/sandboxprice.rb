##### EXPERIMENTS IN DEVELOPMENT #####

puts "How many lines of data?"
number = gets.chomp.to_i

number.times do

  #### get data ####
  puts "Please enter a line of data:"
  data_value = gets.chomp

  #### turn intake string into array ####
  data_value = data_value.split(",")

  #### create new array that removes whitespaces and dollar signs ####
  new_data_value = []
  data_value.each do |i|
    i = i.strip
    if i[0] == "$"
      i.slice!(0)
    end
    new_data_value << i
  end
  p new_data_value
end

"Target price, $15.05"
"mixed fruit,$2.15"
"french fries,$2.75"
"side salad,$3.35"
"hot wings,$3.55"
"mozzarella sticks,$4.20"
"sampler plate,$5.80"
