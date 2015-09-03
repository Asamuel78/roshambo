class Roshambo
  def initialize
    @player_name = nil
    @draws = @wins = @losses = 0
    @bout_win = 0
    @bout_loss = 0
    @play_again = 'y'
  end
  puts
  puts "Let's Play Rock, Paper, Scissors!"
  puts 'What is your name?'
  @player_name = gets.chomp
  if @player_name.empty?
    puts 'Player not detected, exiting simulation.'
    exit
  end

  puts 'Press r for Rock'
  puts 'Press p for Paper'
  puts 'Press s for Scissors'
end

def game
  puts "#{@player_name}, please type your choice: rock, paper, or scissors."
  player = $stdin.gets.chomp.downcase

  if player.empty?
    puts 'Good bye'
    exit
  end

  computer = 'rps' [rand(3)].chr
  puts computer

  case [player, computer]
  when %w(p r), %w(s p), %w(r s)
    puts 'You win!'
  when %w(p p), %w(r r), %w(s s)
    puts 'You tied!'
  when %w(r p), %w(p s), %w(s r)
    puts 'You lose!'
  end

  if @wins == 2
    puts 'Bout won!'
    @bout_win += 1
    @wins = @losses = 0
  elsif @losses == 2
    puts 'Bout lost!'
    @bout_loss += 1
    @wins = @losses = 0
  end

  if @bout_win == 2 || @bout_loss == 2
    puts 'game over, play again? (y/n)'
    @play_again = gets.chomp.downcase
    keep_playing = @play_again
    if @play_again == 'y'
      @draws = @wins = @losses = 0
      @bout_win = 0
      @bout_loss = 0
    end
  end
end

roshambo = Roshambo.new
roshambo.game
