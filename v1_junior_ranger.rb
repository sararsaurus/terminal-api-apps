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

player_score = 0;
computer_score = 0;
roundNumber = 5;

// Computer's random choice generator

function getComputerChoice() {
  let result;
  result = Math.floor(Math.random() * 3);
  if (result === 0) {
    return "rock";
  } else if (result === 1) {
    return "paper";
  } else {
    return "scissors";
  }
}

// 5-round game, generating a new player & computer selection each time.

function game() {
  for (let i = 0; i < 5; i++) {
    let playerSelection = prompt("Rock, paper, or scissors?").toLowerCase();
    let computerSelection = getComputerChoice();
    playRound(playerSelection, computerSelection);
  }
}

// Single round with scoreboard
function playRound(playerSelection, computerSelection) {
  // Tie
  if (
    (playerSelection === "rock" && computerSelection === "rock") ||
    (playerSelection === "paper" && computerSelection === "paper") ||
    (playerSelection === "scissors" && computerSelection === "scissors")
  ) {
    player_score += 0;
    computer_score += 0;
    roundNumber -= 1;
    console.log("Tie!");
    console.log(`human: ${player_score}`);
    console.log(`machine: ${computer_score}`);
    console.log(`number of games left: ${roundNumber}`);

    // Player wins
  } else if (
    (playerSelection === "rock" && computerSelection === "scissors") ||
    (playerSelection === "paper" && computerSelection === "rock") ||
    (playerSelection === "scissors" && computerSelection === "paper")
  ) {
    player_score += 1;
    roundNumber -= 1;
    console.log(`You win! ${playerSelection} beats ${computerSelection}.`);
    console.log(`human: ${player_score}`);
    console.log(`machine: ${computer_score}`);
    console.log(`number of games left: ${roundNumber}`);

    // Computer wins
  } else if (
    (playerSelection === "rock" && computerSelection === "paper") ||
    (playerSelection === "paper" && computerSelection === "scissors") ||
    (playerSelection === "scissors" && computerSelection === "rock")
  ) {
    computer_score += 1;
    roundNumber -= 1;
    console.log(`You lose! ${computerSelection} beats ${playerSelection}.`);
    console.log(`human: ${player_score}`);
    console.log(`machine: ${computer_score}`);
    console.log(`number of games left: ${roundNumber}`);
  }
}

// Tabulate overall winner at the end
function overallWinner(player_score, computer_score) {
  if (player_score > computer_score) {
    console.log(`Human wins!`);
  } else if (computer_score > player_score) {
    console.log(`Machines win!`);
  } else {
    console.log(`Tie!`);
  }
}

console.log(game());
console.log(overallWinner(player_score, computer_score));


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
  if roll_dice(2, 6) >= 8
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
    puts "You turned a corner and found Rocky the Pika!"
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
    #insert rock paper scissors
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
