require 'spec_helper'

describe "tictactoe minimax" do

  context "X is about to win cross" do
    let(:board) { Board.new( [[nil,nil,1],[nil,0,nil],[nil,nil,0]] ) }
    let(:minimax) { Minimax.new.tap{|m| m.calculate(board)} }
    subject { minimax }

    its(:choice) { should == [0,0] }
  end 

  context "X is about to win inverted cross" do
    let(:board) { Board.new( [[nil,nil,0],[nil,0,nil],[nil,nil,1]] ) }
    let(:minimax) { Minimax.new.tap{|m| m.calculate(board)} }
    subject {minimax}

    its(:choice) { should == [2,0] }
  end 

  context "X is about to win horizontally" do
    let(:board) { Board.new( [[0,0,nil],[nil,1,nil],[nil,nil,nil]] ) }
    let(:minimax) { Minimax.new.tap{|m| m.calculate(board)} }
    subject { minimax }

    its(:choice) { should == [0,2] }
  end 

  context "X is about to win vertically" do
    let(:board) { Board.new( [[0,nil,nil],[0,nil,nil],[nil,nil,1]] ) }
    let(:minimax) { Minimax.new.tap{|m| m.calculate(board)} }
    subject {minimax}

    its(:choice) { should == [2,0] }
  end 

  context "Y is about to win vertically" do
    let(:board) { Board.new( [[1,0,0],[nil,0,nil],[1,nil,nil]] ) }
    let(:minimax) { Minimax.new.tap{|m| m.calculate(board)} }
    subject { minimax }

    its(:choice) { should == [1,0] }
  end 

  

end 