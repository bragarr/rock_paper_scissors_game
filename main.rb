puts "Rock, Paper and Scissors Game"
puts "Let's go make your move"

$moves = ["Rock", "Paper", "Scissors"]
$playerScore = 0
$computerScore = 0

def gameMatch
    validmove = false
    while !validmove
        print "Enter your move choice (Rock/Paper/Scissors): "
        playermove = gets.chomp.downcase.capitalize
        validmove = case
        when $moves.include?(playermove) then true
        else puts "Invalid Input"
        end
    end
    
    computermove =$moves[rand(0..2)];
    
    roundResult = case
    when playermove == computermove
        "The game is a Tie!"
    when playermove == "Rock" && computermove == "Paper"
        then "You lose. #{computermove} beats #{playermove}"
        $computerScore += 1
    when playermove == "Rock" && computermove == "Scissors"
        then "You Win. #{playermove} beats #{computermove}"
        $playerScore +=1
    when playermove == "Paper" && computermove == "Scissors"
        then "You lose. #{computermove} beats #{playermove}"
        $computerScore += 1
    when playermove == "Paper" && computermove == "Rock"
        then "You Win. #{playermove} beats #{computermove}"
        $playerScore +=1
    when playermove == "Scissors" && computermove == "Rock"
        then "You lose. #{computermove} beats #{playermove}"
        $computerScore += 1
    when playermove == "Scissors" && computermove == "Paper"
        then "You Win. #{playermove} beats #{computermove}"
        $playerScore +=1
    end

    puts "Your Move: #{playermove} | Computer Move: #{computermove}"
    puts roundResult
end

def matchResult
    gameWinner = case
    when $playerScore > $computerScore
        puts "You win! Final Score -> Player Score: #{$playerScore} | Computer Score: #{$computerScore}"
    when $playerScore < $computerScore
        puts "You Lose! Final Score -> Player Score: #{$playerScore} | Computer Score: #{$computerScore}"
    else puts "The game is a tie! Final Score -> Player Score: #{$playerScore} | Computer Score: #{$computerScore}"
    end
end

def matchChain
    validRoundNumber = false
    while !validRoundNumber
        print("How many rounds do you like to play? ")
        roundTobePlayed = gets.chomp.to_i
        validRoundNumber = case
        when roundTobePlayed > 0 then true
        else puts "Invalid Input! Only numbers allowed!"
        end
    end

    gamesPlayed = 0

    while gamesPlayed < roundTobePlayed
        gamesPlayed += 1
        puts "Round #{gamesPlayed}"
        gameMatch
        puts "Player Score: #{$playerScore} | Computer Score: #{$computerScore}"
    end

    matchResult
end

matchChain