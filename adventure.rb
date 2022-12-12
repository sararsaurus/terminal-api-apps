# https://www.youtube.com/watch?v=wMJ6lxgT-mE

###################VERSION 1#################################
##################################################################
#### 1) Check if player is alive
#### 2) Let the player leave the room
#### 3) Check if monster is in the room
#### 4) Search for treasure
#### 5) Need different types of rooms
#### 6) Need random number generator
####7) Determine whether you found treasure // name treasures
#### 8) Monsters deal damage - health to zero = game over
##################################################################
##################################################################

###################VERSION 2#################################
##################################################################
#### 1) Check if player still has Junior Ranger badge
#### 2) Let the player leave the park
#### 3) Check if violation is in the park
#### 4) Search for treasure
#### 5) Need different types of parks
#### 6) Need random number generator
####7) Determine whether you found treasure // name treasures
#### 8) Violations deal damage - badge points to zero = game over
##################################################################
##################################################################

## Create Park ##
def create_park
  "Hello, Junior Ranger! You are just who we need to protect and preserve our National Parks!"
  # "You are in a room. You see a door."
end

def treasure
  ["mountain peak", "waterfall", "blooming wildflowers", "babbling brook", "sunrise", "sunset", "birdsong", "howling coyotes"].sample
end

def create_violation
  ["discarded granola bar wrapper", "live campfire", "someone feeding wildlife", "someone approaching wildlife", "someone carving initials into a tree", "discarded orange peel", "someone picking flowers"].sample
end

##left off here##

## RNG Generator ##
def roll_dice(number_of_dice, size_of_dice)
  total = 0
  1.upto(number_of_dice) do
    total = total + rand(size_of_dice) + 1
  end
  return total
end

############### DICE ROLLS ###############
def has_violation?
  if roll_dice(2, 6) >= 8
    true
  else
    false
  end
end

def has_escaped?
  if roll_dice(2, 6) >= 11
    true
  else
    false
  end
end

def monster_attack?
  if roll_dice(2, 6) >= 9
    true
  else
    false
  end
end

def defeat_monster?
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
number_of_rooms_explored = 1
treasure_count = 0
damage_points = 5
escaped = false
monster = false
current_room = ""
############### Gameplay ###############
# Intro
puts "You are trapped in a dungeon. See if you can find treasure before you escape!"
puts "Watch out for monsters! They will get you!"
puts "To play, type one of the given commands."

# Game Loop
while damage_points > 0 and not escaped
  #game code

  actions = ["m - move", "s - search"]
  puts "Room # #{number_of_rooms_explored}"
  puts current_room

  # Monster Encounter
  if monster
    puts "Ah! Real monsters!"
    actions << "f - fight"
  end

  print "What do you do? (#{actions.join(",")}): "
  player_action = gets.chomp

  # Monster Attack
  if monster and monster_attack?
    damage_points -= 1
    puts "OUCH! You got hit!"
  end
  # Player Commands
  if player_action == "m"
    current_room = create_park
    number_of_rooms_explored += 1
    monster = has_violation?
    escaped = has_escaped?
  elsif player_action == "s"
    if has_treasure?
      puts "WOW! You found #{treasure_count} treasure!"
      treasure_count += 1
    else
      puts "You searched, but you found NOTHING!"
    end

    ## Rigged Condition - searching triggers monsters ##

    if not monster
      monster = has_violation?
    end
  elsif player_action == "f"
    if defeat_monster?
      monster = false
      puts "you defeated the monster!"
    else
      puts "you missed!"
    end
  else
    puts "please follow directions and try harder"
  end
end

# Output for end of game
if damage_points > 0
  puts "Good job, you made it!"
  puts "You explored #{number_of_rooms_explored} rooms"
  puts "and found #{treasure_count} treasures!"
else
  puts "Oh no! You didn't make it"
  puts "You explored #{number_of_rooms_explored} rooms"
  puts "and found #{treasure_count} treasures before your doom."
  puts "You tried so hard, and got so far...."
  puts "but in the end, it doesn't even matter"
end
