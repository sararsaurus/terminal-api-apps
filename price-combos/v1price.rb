def intake_data(data_value)
  # turn intake string into array
  data_value = data_value.split(",")
  # p data_value
  new_data_value = []
  data_value.each do |i|
    #remove leading/trailing whitespaces
    i = i.strip
    #remove dollar sign
    if i[0] == "$"
      i.slice!(0)
    end
    new_data_value << i
  end
  # p new_data_value

  # create hash
  key = ""
  value = ""
  new_data_value.each do |i|
    if i =~ /\d/
      value = i.to_f
    else
      key += i + " "
    end
  end
  # p value
  key = key.chop
  # create hash array
  hash = {}
  hash[key] = value
  array = []
  array << hash
  return array
end

p intake_data("mixed fruit,$2.15")

"Target price, $15.05"
"mixed fruit,$2.15"
"french fries,$2.75"
"side salad,$3.35"
"hot wings,$3.55"
"mozzarella sticks,$4.20"
"sampler plate,$5.80"
