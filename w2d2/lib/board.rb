class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { [] }
    place_stones
  end

  def place_stones
    cups.each_index do |i|
      unless i == 6 || i == 13
        cups[i] = [:stone, :stone, :stone, :stone]
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(1, 12)
  end

  def make_move(start_pos, current_player_name)
    stones = cups[start_pos]
    cups[start_pos] = []

    cups_idx = start_pos
    until stones.empty?
      cups_idx = (cups_idx + 1) % 14
      if cups_idx == 6
        @cups[6] << stones.pop if current_player_name == @name1
      elsif cups_idx == 13
        @cups[13] << stones.pop if current_player_name == @name2
      else
        @cups[cups_idx] << stones.pop
      end
    end

    render
    next_turn(cups_idx)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx == 6 || ending_cup_idx == 13
      return :prompt
    elsif cups[ending_cup_idx].size == 1
      return :switch
    else
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[0..5].all?(&:empty?) || cups[7..12].all?(&:empty?)
  end

  def winner
    player1_count, player2_count = cups[6].count, cups[13].count
    if player1_count > player2_count
      @name1
    elsif player1_count < player2_count
      @name2
    else
      :draw
    end
  end
end
