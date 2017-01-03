require 'byebug'
class Board
  attr_accessor :cups, :name1, :name2

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { [:stone, :stone, :stone, :stone] }
    cups[6], cups[13] = [], []
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    unless (1..12) === start_pos # || (7..12) === start.pos
      raise "Invalid starting cup"
    end
  end

  def make_move(start_pos, current_player_name)
    hand = cups[start_pos]
    cups[start_pos] = []

    next_cup = start_pos + 1

    until hand.empty?
      unless next_cup == 6 && current_player_name == name2 || next_cup == 13 && current_player_name == name1
        cups[next_cup] << hand.shift
      end
      break if hand.empty?
      next_cup += 1
      next_cup -= 14 if next_cup > 13
    end
    render
    next_turn(next_cup, current_player_name)

  end

  def next_turn(ending_cup_idx, current_name)
    if ending_cup_idx == 6 && current_name == name1
      :prompt
    elsif ending_cup_idx == 13 && current_name == name2
      :prompt
    elsif cups[ending_cup_idx].length <= 1
      :switch
    else
      ending_cup_idx
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
    cups[0..5].all? { |el| el.empty? } || cups[7..13].all? { |el| el.empty? }
  end

  def winner
    if cups[6].count == cups[13].count
      :draw
    else
      if cups[6].count > cups[13].count
        name1
      else
        name2
      end
    end
  end
end
