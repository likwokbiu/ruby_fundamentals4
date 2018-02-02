@train_array = [
{train: "72C", frequency_in_minutes: 15, direction: "north"},
{train: "72D", frequency_in_minutes: 15, direction: "south"},
{train: "610", frequency_in_minutes: 5, direction: "north"},
{train: "611", frequency_in_minutes: 5, direction: "south"},
{train: "80A", frequency_in_minutes: 30, direction: "east"},
{train: "80B", frequency_in_minutes: 30, direction: "west"},
{train: "110", frequency_in_minutes: 15, direction: "north"},
{train: "111", frequency_in_minutes: 15, direction: "south"}
]

def search_train(train_name, rqs_type)
  @train_array.each do |train_x|
    if train_x[:train] == train_name
      if rqs_type == "dir"
        return train_x[:direction]
      elsif rqs_type == "freq"
        return train_x[:frequency_in_minutes]
      end
    end
  end
  return nil
end

def print_msg(train_name, prt_type, prt_dta)
  if prt_type == "dir"
    puts "The direction of train #{train_name} is #{prt_dta}."
  elsif prt_type == "freq"
    puts "The frequency of train #{train_name} is every #{prt_dta} mins."
  end
end

#--- Question 1 ---#
puts "--- Question 1 ---"
train_to_find = "111"
request_data = "dir"
direction = search_train(train_to_find, request_data)
print_msg(train_to_find, request_data, direction)

#--- Question 2 ---#
puts "--- Question 2 ---"
train_to_find = "80B"
request_data = "freq"
frequency = search_train(train_to_find, request_data)
print_msg(train_to_find, request_data, frequency)

#--- Question 3 ---#
puts "--- Question 3 ---"
train_to_find = "610"
request_data = "dir"
direction = search_train(train_to_find, request_data)
print_msg(train_to_find, request_data, direction)

#--- Question 4 ---#
puts "--- Question 4 ---"

@tran_array_north = []
@tran_array_east = []

def build_train_array(rqs_dir)
  @train_array.each do |train_x|
    if train_x[:direction] == rqs_dir
      if rqs_dir == "north"
        @tran_array_north << train_x[:train]
      elsif rqs_dir == "east"
        @tran_array_east << train_x[:train]
      end
    end
  end
end

request_dir = "north"
build_train_array(request_dir)
puts @tran_array_north

#--- Question 5 ---#
puts "--- Question 5 ---"
request_dir = "east"
build_train_array(request_dir)
puts @tran_array_east

#--- Question 6 ---#
puts "--- Question 6 ---"
puts "Done"

#--- Question 7 ---#
puts "--- Question 7 ---"

def add_frist_departure(train_name, dp_time)
  @train_array.each do |train_x|
    if train_x[:train] == train_name
      train_x[:first_departure_time] = dp_time
    end
  end
end

train_to_find = "611"
first_depart = 6
add_frist_departure(train_to_find, first_depart)
puts @train_array
puts
puts
