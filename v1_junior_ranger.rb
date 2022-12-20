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

## Create Treasure ##

treasure = ["mountain peaks", "birdsong", "a waterfall", "a field of wildflowers", "an alpine lake", "sunrise", "sunset"]

## Create RPS ##
def rock_paper_scissors
  puts "Packy the Pika loves finding friends on the trail!"
  puts "Play rock paper scissors with Packy!"
  # Variables
  player_score = 0
  pika_score = 0
  round_number = 5

  # Computer's random choice generator
  def get_computer_choice
    ["rock", "paper", "scissors"].sample
  end

  ### 5-round game, generating a new player & computer selection each time.
  while round_number > 0
    puts "Rock, paper, or scissors?"
    player_selection = gets.chomp.downcase
    computer_selection = get_computer_choice

    # Tie
    if (player_selection == "rock" && computer_selection == "rock") || (player_selection == "paper" && computer_selection == "paper") || (player_selection == "scissors" && computer_selection == "scissors")
      round_number -= 1
      puts "Tie! It's #{player_score} human to #{pika_score} pika, with #{round_number} games left!"
      # Player wins
    elsif (player_selection == "rock" && computer_selection == "scissors") || (player_selection == "paper" && computer_selection == "rock") || (player_selection == "scissors" && computer_selection == "paper")
      player_score += 1
      round_number -= 1
      puts "You win! It's #{player_score} human to #{pika_score} pika, with #{round_number} games left!"
      # Computer wins
    elsif (player_selection == "rock" && computer_selection == "paper") || (player_selection == "paper" && computer_selection == "scissors") || (player_selection == "scissors" && computer_selection == "rock")
      pika_score += 1
      round_number -= 1
      puts "Packy wins! It's #{player_score} human to #{pika_score} pika, with #{round_number} games left!"
    end
  end

  ### Tabulate overall winner at end
  def overall_winner(player_score, pika_score)
    if player_score > pika_score
      puts "Human wins! Thanks for playing!"
    elsif pika_score > player_score
      puts "Packy the Pika wins! Thanks for playing!"
    else
      puts "Wow, it's a tie! Thanks for playing!"
    end
  end

  ## Call the game

  puts overall_winner(player_score, pika_score)
end

############### RNG GENERATOR ###############
def roll_dice(number_of_dice, size_of_dice)
  total = 0
  1.upto(number_of_dice) do
    total = total + rand(size_of_dice) + 1
  end
  return total
end

############### DICE ROLLS ###############
def has_weather?
  if roll_dice(2, 6) >= 9
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

def has_pika?
  if roll_dice(2, 6) >= 9
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
pika = false
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

  # Weather Encounter
  if weather
    puts "Yikes! Storm's coming down!"
    damage_points -= 0.5
    actions << "k - keep going"
  end

  # pika Encounter
  if pika
    puts "You turned a corner and found Packy the Pika!"
    actions << "p - play a game"
  end

  puts "What do you do? (#{actions.join(",")}): "
  player_action = gets.chomp

  # Player Commands
  if player_action == "m"
    current_trail = create_trail
    number_of_trails_explored += 1
    weather = has_weather?
    finished = has_finished?
    pika = has_pika?
  elsif player_action == "s"
    if has_treasure?
      treasure_count += 1
      puts "WOW! You found #{treasure.sample}!"
      treasure_count += 1
    else
      puts "Just a nice day on the trail!"
    end
  elsif player_action == "k"
    if take_cover?
      puts "You got lucky and the storm passed!"
    else
      puts "You got zapped by lightning!"
      damage_points -= 1
    end
  elsif player_action == "p"
    puts rock_paper_scissors
  end
end

# Output for end of game
if damage_points > 0
  puts "Good job, you made it!"
  puts "You explored #{number_of_trails_explored} trails"
  puts "and found #{treasure_count} backcountry treasures!"
else
  puts "Oh no! The storms forced you to turn back."
  puts "You explored #{number_of_trails_explored} trails"
  puts "and found #{treasure_count} backcountry treasures."
end
