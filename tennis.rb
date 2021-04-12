# frozen_string_literal: true

class TennisGame1
  def initialize(player_one_name, player2_two_name)
    @player_one_name = player_one_name
    @player2_two_name = player2_two_name
    @p_one_points = 0
    @p_two_points = 0
  end

  def won_point(player_name)
    if player_name == 'player1'
      @p_one_points += 1
    else
      @p_two_points += 1
    end
  end

  def score
    result = ''
    temp_score = 0
    if @p_one_points == @p_two_points
      result = {
        0 => 'Love-All',
        1 => 'Fifteen-All',
        2 => 'Thirty-All'
      }.fetch(@p_one_points, 'Deuce')
    elsif (@p_one_points >= 4) || (@p_two_points >= 4)
      minus_result = @p_one_points - @p_two_points
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
          temp_score = @p_one_points
        else
          result += '-'
          temp_score = @p_two_points
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

class TennisGame2
  def initialize(player_one_name, player2_two_name)
    @player_one_name = player_one_name
    @player2_two_name = player2_two_name
    @p_one_points = 0
    @p_two_points = 0
  end

  def won_point(player_name)
    if player_name == @player_one_name
      p_one_score
    else
      p_two_score
    end
  end

  def score
    result = ''
    if (@p_one_points == @p_two_points) && (@p_one_points < 3)
      result = 'Love' if @p_one_points.zero?
      result = 'Fifteen' if @p_one_points == 1
      result = 'Thirty' if @p_one_points == 2
      result += '-All'
    end
    result = 'Deuce' if (@p_one_points == @p_two_points) && (@p_one_points > 2)

    p1res = ''
    p2res = ''
    if @p_one_points.positive? && @p_two_points.zero?
      p1res = 'Fifteen' if @p_one_points == 1
      p1res = 'Thirty' if @p_one_points == 2
      p1res = 'Forty' if @p_one_points == 3
      p2res = 'Love'
      result = "#{p1res}-#{p2res}"
    end
    if @p_two_points.positive? && @p_one_points.zero?
      p2res = 'Fifteen' if @p_two_points == 1
      p2res = 'Thirty' if @p_two_points == 2
      p2res = 'Forty' if @p_two_points == 3

      p1res = 'Love'
      result = "#{p1res}-#{p2res}"
    end

    if (@p_one_points > @p_two_points) && (@p_one_points < 4)
      p1res = 'Thirty' if @p_one_points == 2
      p1res = 'Forty' if @p_one_points == 3
      p2res = 'Fifteen' if @p_two_points == 1
      p2res = 'Thirty' if @p_two_points == 2
      result = "#{p1res}-#{p2res}"
    end
    if (@p_two_points > @p_one_points) && (@p_two_points < 4)
      p2res = 'Thirty' if @p_two_points == 2
      p2res = 'Forty' if @p_two_points == 3
      p1res = 'Fifteen' if @p_one_points == 1
      p1res = 'Thirty' if @p_one_points == 2
      result = "#{p1res}-#{p2res}"
    end
    result = "Advantage #{@player_one_name}" if (@p_one_points > @p_two_points) && (@p_two_points >= 3)
    result = "Advantage #{@player2_two_name}" if (@p_two_points > @p_one_points) && (@p_one_points >= 3)
    if (@p_one_points >= 4) && (@p_two_points >= 0) && ((@p_one_points - @p_two_points) >= 2)
      result = "Win for #{@player_one_name}"
    end
    if (@p_two_points >= 4) && (@p_one_points >= 0) && ((@p_two_points - @p_one_points) >= 2)
      result = "Win for #{@player2_two_name}"
    end
    result
  end

  def p_one_score
    @p_one_points += 1
  end

  def p_two_score
    @p_two_points += 1
  end
end

class TennisGame3
  def initialize(player_one_name, player2_two_name)
    @p1N = player_one_name
    @p2N = player2_two_name
    @p1 = 0
    @p2 = 0
  end

  def won_point(n)
    if n == @p1N
      @p1 += 1
    else
      @p2 += 1
    end
  end

  def score
    if ((@p1 < 4) && (@p2 < 4)) && (@p1 + @p2 < 6)
      p = %w[Love Fifteen Thirty Forty]
      s = p[@p1]
      @p1 == @p2 ? "#{s}-All" : "#{s}-#{p[@p2]}"
    elsif @p1 == @p2
      'Deuce'
    else
      s = @p1 > @p2 ? @p1N : @p2N
      (@p1 - @p2) * (@p1 - @p2) == 1 ? "Advantage #{s}" : "Win for #{s}"
    end
  end
end
