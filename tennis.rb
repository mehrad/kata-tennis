# frozen_string_literal: true

require '../player.rb'
class TennisGame
  def initialize(player_one_name, player_two_name)
    @player_one = Player.new(player_one_name)
    @player_two = Player.new(player_two_name)
  end

  def won_point(player_name)
    if player_name == 'player1'
      @player_one.won_point
    else
      @player_two.won_point
    end
  end
end

class TennisGame1 < TennisGame
  def score
    result = ''
    temp_score = 0
    if @player_one.points == @player_two.points
      result = {
        0 => 'Love-All',
        1 => 'Fifteen-All',
        2 => 'Thirty-All'
      }.fetch(@player_one.points, 'Deuce')
    elsif (@player_one.points >= 4) || (@player_two.points >= 4)
      minus_result = @player_one.points - @player_two.points
      result = if minus_result == 1
                 'Advantage player1'
               elsif minus_result == -1
                 'Advantage player2'
               elsif minus_result >= 2
                 'Win for player1'
               else
                 'Win for player2'
               end
    else
      (1...3).each do |i|
        if i == 1
          temp_score = @player_one.points
        else
          result += '-'
          temp_score = @player_two.points
        end
        result += {
          0 => 'Love',
          1 => 'Fifteen',
          2 => 'Thirty',
          3 => 'Forty'
        }[temp_score]
      end
    end
    result
  end
end

class TennisGame2 < TennisGame
  def score
    result = ''
    if (@player_one.points == @player_two.points) && (@player_one.points < 3)
      result = 'Love' if @player_one.points.zero?
      result = 'Fifteen' if @player_one.points == 1
      result = 'Thirty' if @player_one.points == 2
      result += '-All'
    end
    result = 'Deuce' if (@player_one.points == @player_two.points) && (@player_one.points > 2)

    p1res = ''
    p2res = ''
    if @player_one.points.positive? && @player_two.points.zero?
      p1res = 'Fifteen' if @player_one.points == 1
      p1res = 'Thirty' if @player_one.points == 2
      p1res = 'Forty' if @player_one.points == 3
      p2res = 'Love'
      result = "#{p1res}-#{p2res}"
    end
    if @player_two.points.positive? && @player_one.points.zero?
      p2res = 'Fifteen' if @player_two.points == 1
      p2res = 'Thirty' if @player_two.points == 2
      p2res = 'Forty' if @player_two.points == 3

      p1res = 'Love'
      result = "#{p1res}-#{p2res}"
    end

    if (@player_one.points > @player_two.points) && (@player_one.points < 4)
      p1res = 'Thirty' if @player_one.points == 2
      p1res = 'Forty' if @player_one.points == 3
      p2res = 'Fifteen' if @player_two.points == 1
      p2res = 'Thirty' if @player_two.points == 2
      result = "#{p1res}-#{p2res}"
    end
    if (@player_two.points > @player_one.points) && (@player_two.points < 4)
      p2res = 'Thirty' if @player_two.points == 2
      p2res = 'Forty' if @player_two.points == 3
      p1res = 'Fifteen' if @player_one.points == 1
      p1res = 'Thirty' if @player_one.points == 2
      result = "#{p1res}-#{p2res}"
    end
    result = "Advantage #{@player_one.name}" if (@player_one.points > @player_two.points) && (@player_two.points >= 3)
    result = "Advantage #{@player_two.name}" if (@player_two.points > @player_one.points) && (@player_one.points >= 3)
    if (@player_one.points >= 4) && (@player_two.points >= 0) && ((@player_one.points - @player_two.points) >= 2)
      result = "Win for #{@player_one.name}"
    end
    if (@player_two.points >= 4) && (@player_one.points >= 0) && ((@player_two.points - @player_one.points) >= 2)
      result = "Win for #{@player_two.name}"
    end
    result
  end
end

class TennisGame3 < TennisGame
  def score
    if ((@player_one.points < 4) && (@player_two.points < 4)) && (@player_one.points + @player_two.points < 6)
      p = %w[Love Fifteen Thirty Forty]
      s = p[@player_one.points]
      @player_one.points == @player_two.points ? "#{s}-All" : "#{s}-#{p[@player_two.points]}"
    elsif @player_one.points == @player_two.points
      'Deuce'
    else
      s = @player_one.points > @player_two.points ? @player_one.name : @player_two.name
      (@player_one.points - @player_two.points) * (@player_one.points - @player_two.points) == 1 ? "Advantage #{s}" : "Win for #{s}"
    end
  end
end
