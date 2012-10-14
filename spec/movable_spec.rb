require 'drug_game/movable'
require File.join(File.dirname(__FILE__), 'spec_helper')
describe DrugGame::Movable do
  before(:each) do
    @movable = DrugGame::Movable.new($window)
  end

  it "should set position" do
    @movable.warp(40, 50)
    @movable.x.should == 40
    @movable.y.should == 50
  end

  it "should turn left" do
    lambda {
      @movable.turn_left
    }.should change(@movable, :vel_x).by(-5)
  end

  it "should turn right" do
    lambda {
      @movable.turn_right
    }.should change(@movable, :vel_x).by(5)
  end

  it "should jump" do
    lambda {
      @movable.warp(50,664)
      @movable.jump
    }.should change(@movable, :vy).by(-20)
  end

  it "should stop on right edge" do
    @movable.warp(2000, 10)
    @movable.move
    @movable.x.should == 1895
  end

  it "should stop on left edge" do
    @movable.warp(-10, 10)
    @movable.move
    @movable.x.should == 25
  end
end
