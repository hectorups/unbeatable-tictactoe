
class Minimax

  attr_accessor :choice

  def calculate(board)
    return [current_score(board), current_level(board)] if board.over?

    scores = [] 
    moves = []  
    levels = []  

    # Populate the scores array, recursing as needed
    board.available_squares.each do |move|
      possible_board = board.duplicate.play(move)
      score, level = calculate(possible_board)

      scores << score
      levels << level
      moves << move 
    end

    result = if board.player_turn == Board::O_PLAYER
    # Min score, If there are several take the lowest level
    scores.zip(levels, moves).select{ |r| r.first == scores.max}.min{|r| r[1] }
    else
    # Min score, If there are several take the highest level
    scores.zip(levels, moves).select{ |r| r.first == scores.min}.max{|r| r[1] }
    end

    @choice = result.last

    # return score and level
    [result.first, result[1]]
  end

  def current_score(board)
    if board.win?
      board.player_turn == Board::X_PLAYER ? 1 : -1
    else
      0
    end
  end

  private

  def current_level(board) 
    9 - board.available_squares.count
  end

end  