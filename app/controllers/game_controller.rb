class GameController < ApplicationController
  def show

  end

  def play

    data = params[:board_data].values.map{|r| r.map{|c| next nil if c.empty?; c.to_i }  }
    board = Board.new( data )
    move = Minimax.new.tap{|m| m.calculate(board)}.choice

    # binding.pry
    board.play(move)
    render :json => { 
                      finish: board.over?, 
                      user_lost: board.win?,
                      result: move
                    }
  end
end
