require 'sinatra'

def game(player, computer)
  if player == computer
    "We win together!"
  elsif player == "rock"
    if computer == "paper"
      "Paper covers rock. You lose!"
    elsif computer == "scissors"
      "Rock smashes scissors. You win!"
    end
  elsif player == "paper"
    if computer == "scissors"
      "Scissors cuts paper. You lose!"
    elsif computer == "rock"
      "Paper covers rock. You win!"
    end
  elsif player == "scissors"
    if computer == "rock"
      "Rock smashes scissors. You lose!"
    elsif computer == "paper"
      "Scissors cut paper. You win!"
    end
  end
end

get '/' do
  erb :index
end

post '/player' do
  @player_name = params[:name]

  puts "-----"
  puts @player_name
  erb :play
end

post '/result' do
  @player_name = params[:name]
  @player_choice = params[:choice]
  @computer_choice = %w[rock paper scissors].sample

  @outcome = game(@player_choice, @computer_choice)

  puts "Player: #{@player_choice}"
  puts "Computer: #{@computer_choice}"
  puts "Outcome: #{@outcome}"

  @result = [{ player_choice: @player_choice, computer_choice: @computer_choice, outcome: @outcome }]

  p @result
  puts @result.class
  erb :result
end

    