require 'sinatra'

def game(player,computer)
  if player == computer
    outcome = "We win together!"
  elsif player == "rock"
    if computer == "paper"
      outcome = "Paper covers rock. You lose!"
    elsif computer == "scissors"
      outcome = "Rock smashes scissors. You win!"
    end
  elsif player == "paper"
    if computer == "scissors"
      outcome = "Scissors cuts paper. You lose!"
    elsif computer == "rock"
      outcome = "Paper covers rock. You wins!"
    end
  elsif player == "scissors"
    if computer == "rock"
      outcome = "Rock smashes scissors. You lose!"
    elsif computer == "paper"
      outcome = "Scissors cut paper. computer wins!"
    end
  end
  return outcome
end

get '/' do
  erb :index
end

get '/play' do
  erb :play
end

post '/play' do
  @player_name = params[:name]
  @play = []
  erb :play
end

post '/result' do
  @player_name = params[:name]
  @player_choice = params[:choice]
  @computer_choice = %w[Rock Paper Scissors].sample

  @result = []
  erb :result
end

    