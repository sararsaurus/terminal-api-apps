# https://www.youtube.com/watch?v=wMJ6lxgT-mE

##################################################################
##################################################################
#### 1) Check if player is alive
#### 2) Let the player leave the trail
#### 3) Check if weather is on the trail
#### 4) Search for treasure
#### 6) Need random number generator
####7) Determine whether you found treasure // name treasures
#### 8) Weather deals damage - health to zero = game over
##################################################################
##################################################################

## Create Room ##
def create_trail
  # "You are in a room. You see a door."
end

def treasure
  ["mountain peaks", "birdsong", "waterfall", "field of wildflowers", "alpine lake", "sunrise", "sunset"].sample
end

## RNG Generator ##
def roll_dice(number_of_dice, size_of_dice)
  total = 0
  1.upto(number_of_dice) do
    total = total + rand(size_of_dice) + 1
  end
  return total
end

############### DICE ROLLS ###############
def has_weather?
  if roll_dice(2, 6) >= 8
    true
  else
    false
  end
end

def has_finished?
  if roll_dice(2, 6) >= 11
    true
  else
    false
  end
end

def lightning_strike?
  if roll_dice(2, 6) >= 9
    true
  else
    false
  end
end

def take_cover?
  if roll_dice(2, 6) >= 2
    true
  else
    false
  end
end

def has_treasure?
  if roll_dice(2, 6) >= 1
    true
  else
    false
  end
end

############### Variables ###############
number_of_trails_explored = 1
treasure_count = 0
damage_points = 5
finished = false
weather = false
current_trail = ""
############### Gameplay ###############
# Intro
puts "Hello, Junior Ranger!"
puts "You have chosen to become a steward of the wilderness."
puts "Your mission is to protect our wild spaces, make wise decisions, and enjoy the journey!"
puts "To play, type one of the given commands."

# Game Loop
while damage_points > 0 and not finished
  #game code

  actions = ["m - move", "s - search"]
  puts "Room # #{number_of_trails_explored}"
  puts current_trail

  # weather Encounter
  if weather
    puts "Ah! Real weathers!"
    actions << "f - fight"
  end

  print "What do you do? (#{actions.join(",")}): "
  player_action = gets.chomp

  # weather Attack
  if weather and lightning_strike?
    damage_points -= 1
    puts "OUCH! You got hit!"
  end
  # Player Commands
  if player_action == "m"
    current_trail = create_trail
    number_of_trails_explored += 1
    weather = has_weather?
    finished = has_finished?
  elsif player_action == "s"
    if has_treasure?
      puts "WOW! You found #{treasure_count} treasure!"
      treasure_count += 1
    else
      puts "You searched, but you found NOTHING!"
    end

    ## Rigged Condition - searching triggers weather ##

    if not weather
      weather = has_weather?
    end
  elsif player_action == "f"
    if take_cover?
      weather = false
      puts "you took cover and escaped the storm!"
    else
      puts "you missed!"
    end
  else
    puts "try again"
  end
end

# Output for end of game
if damage_points > 0
  puts "Good job, you made it!"
  puts "You explored #{number_of_trails_explored} rooms"
  puts "and found #{treasure_count} treasures!"
else
  puts "Oh no! You didn't make it"
  puts "You explored #{number_of_trails_explored} rooms"
  puts "and found #{treasure_count} treasures before your doom."
  puts "You tried so hard, and got so far...."
  puts "but in the end, it doesn't even matter"
end
