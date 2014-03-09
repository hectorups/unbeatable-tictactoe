class Board 
  X_PLAYER = 0
  O_PLAYER = 1

  attr_accessor :data

  def self.start
    return Board.new( [].tap{|c| 3.times{|i| c.push([nil,nil,nil]) } } )
  end

  def initialize(data)
    @data = data
  end

  def play(move)
    raise "the position is taken!" if @data[move.first][move.last]
    @data[move.first][move.last] = player_turn
    self
  end

  def available_squares
    Enumerator.new do |yielder| 
      @data.each_with_index do |row, i|
        row.each_with_index do |column, j|
          yielder.yield [i,j] unless column
        end
      end 
    end 
  end

  def duplicate
    dup.tap do |new_board|
      new_board.data = @data.clone.map{|r| r.clone}
    end
  end

  def over?
    return true if win?
    return true if available_squares.count == 0
    false
  end

  # Returns the player who wins if any
  def win?
    horizontal_win? || vertical_win? || cross_win?
  end

  def player_turn
    available_squares.count % 2 == 1 ? X_PLAYER : O_PLAYER
  end

  private

  def horizontal_win?
    @data.any?{|row|  triplete_matches(row) }
  end

  def vertical_win?
    @data.transpose.any?{|row|  triplete_matches(row) }
  end

  def cross_win?

    triplete_matches( [0,1,2].map { |column_number| @data[column_number][column_number] } ) ||
    triplete_matches( [2,1,0].map { |column_number| @data[column_number][2 - column_number] } ) 
  end
  
  def triplete_matches(row)
    return true if row.all?{|i| i == X_PLAYER} ||
                  row.all?{|i| i == O_PLAYER}
    return false
  end

end