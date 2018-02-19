class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    system("clear")

    until @game_over
      take_turn
    end

    puts game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence

    unless @game_over
      puts round_success_message
      @sequence_length += 1
      sleep 0.5
      system("clear")
      sleep 0.5
    end
  end

  def show_sequence
    add_random_color
    @seq.each do |color|
      puts color
      sleep 0.75
      system("clear")
      sleep 0.25
    end
  end

  def require_sequence
    puts "Repeat the sequence. Just use the first letter for each color."
    puts "After every color you enter, press ENTER to put the next color."
    @seq.each do |color|
      user_color = gets.chomp
      if color[0] != user_color
        @game_over = true
        break
      end
    end
    sleep 0.25
  end

  def add_random_color
    seq << COLORS.sample
  end

  def round_success_message
    "Success!"
  end

  def game_over_message
    "Game Over..."
  end

  def reset_game
    initialize
  end
end

if __FILE__ == $PROGRAM_NAME
  game = Simon.new
  game.play
end
