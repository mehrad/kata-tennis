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
    if @player_one.points == @player_two.points && [3, 4].include?(@player_two.points)
      result = 'Deuce'
    elsif @player_one.points == @player_two.points
      result = @player_one.results_text
      result += '-All'
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
      @player_one.results_text + "-" + @player_two.results_text
    end 
  end
end

class TennisGame2 < TennisGame
  def score
    result = ''
    if (@player_one.points == @player_two.points) && (@player_one.points < 3)
      result = @player_one.results_text
      result += '-All'
    end
    result = 'Deuce' if (@player_one.points == @player_two.points) && (@player_one.points > 2)

    p1res = ''
    p2res = ''
    if @player_one.points.positive? && @player_two.points.zero?
      p1res = @player_one.results_text
      p2res = 'Love'
      result = "#{p1res}-#{p2res}"
    end
    if @player_two.points.positive? && @player_one.points.zero?
      p2res = @player_two.results_text

      p1res = 'Love'
      result = "#{p1res}-#{p2res}"
    end

    if (@player_one.points > @player_two.points) && (@player_one.points < 4)
      p1res = @player_one.results_text
      p2res = @player_two.results_text
      result = "#{p1res}-#{p2res}"
    end
    if (@player_two.points > @player_one.points) && (@player_two.points < 4)
      p1res = @player_one.results_text
      p2res = @player_two.results_text
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
      @player_one.points == @player_two.points ? "#{@player_one.results_text}-All" : "#{@player_one.results_text}-#{@player_two.results_text}"
    elsif @player_one.points == @player_two.points
      'Deuce'
    else
      s = @player_one.points > @player_two.points ? @player_one.name : @player_two.name
      (@player_one.points - @player_two.points) * (@player_one.points - @player_two.points) == 1 ? "Advantage #{s}" : "Win for #{s}"
    end
  end
end
