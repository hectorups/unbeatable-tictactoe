require 'spec_helper'

describe "tictactoe board" do

  context "new board" do
    let(:board) { Board.start }
    subject { board }

    its('available_squares.count') { should == 9 }
    its(:over?){ should be_false }
  end 

  context "full board" do
    let(:board) { Board.new( [[1,0,1],[0,1,1],[0,1,0]] ) }
    subject { board }

    its(:over?){ should be_true }
    its(:win?) { should be_false }

  end 

  context "horizontal win" do
    let(:board) { Board.new( [[1,1,nil],[0,0,0],[nil,nil,nil]] ) }
    subject { board }

    its(:over?){ should be_true }
    its(:win?) { should = 0 }
  end 

  context "vertical win" do
    let(:board) { Board.new( [[0,1,nil],[0,1,nil],[0,nil,nil]] ) }
    subject { board }

    its(:over?){ should be_true }
    its(:win?) { should = 0 }
  end 

  context "cross win" do
    let(:board) { Board.new( [[1,1,0],[0,0,nil],[0,nil,nil]] ) }
    subject { board }

    its(:over?){ should be_true }
    its(:win?) { should = 0 }
  end 


  context "ocurring game" do
    let(:board) { Board.new( [[0,1,nil],[0,0,1],[nil,nil,nil]] ) }
    it "invalid move" do
      expect{ board.play([0,0]) }.to raise_error
    end

    it "user makes a valid move" do
      board.play([0,2])
      board.available_squares.count == 6
    end
  end
  

end 