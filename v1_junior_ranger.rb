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

treasure = ["mountain peaks", "birdsong", "a waterfall", "a field of wildflowers", "an alpine lake", "sunrise", "sunset"]

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
  if roll_dice(2, 6) >= 5
    true
  else
    false
  end
end

def take_cover?
  if roll_dice(2, 6) >= 8
    true
  else
    false
  end
end

def has_treasure?
  if roll_dice(2, 6) >= 6
    true
  else
    false
  end
end

############### Variables ###############
number_of_trails_explored = 1
treasure_count = 0
treasure_list = ""
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
  puts "You're on trail # #{number_of_trails_explored}!"
  # puts current_trail
  # hopefully can connect to API here

  # weather Encounter
  if weather
    puts "Yikes! Storm's coming down!"
    damage_points -= 0.5
    actions << "k - keep going"
  end

  puts "What do you do? (#{actions.join(",")}): "
  player_action = gets.chomp

  # Player Commands
  if player_action == "m"
    current_trail = create_trail
    number_of_trails_explored += 1
    weather = has_weather?
    finished = has_finished?
  elsif player_action == "s"
    if has_treasure?
      treasure_count += 1
      puts "WOW! You found #{treasure.sample}!"
      treasure_list += "#{treasure.sample}, "
    else
      puts "Just a nice day on the trail!"
    end
    if player_action == "k"
      if take_cover?
        puts "You got lucky and the storm passed!"
      elsif lightning_strike?
        puts "You got zapped by lightning!"
        damage_points -= 1
      end
    end
  end
end

# Output for end of game
if damage_points > 0
  puts "Good job, you made it!"
  puts "You explored #{number_of_trails_explored} trails"
  puts "and found #{treasure_list}!"
else
  puts "Oh no! You didn't make it"
  puts "You explored #{number_of_trails_explored} trails"
  puts "and found #{treasure_list}."
end
