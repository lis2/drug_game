require 'drug_game/movable'
require 'drug_game/player'
require File.join(File.dirname(__FILE__), 'spec_helper')

describe DrugGame::Player do
  before(:each) do
    @player = DrugGame::Player.new($window)
  end

  it "should have width and height" do
    @player.width.should == 56
    @player.height.should == 80
  end

  describe "awards" do
    before(:each) do
      @award = mock
      @award.stub(:x).and_return(50)
      @award.stub(:y).and_return(50)
      @award.stub(:score).and_return(10)
    end

    it "should collect award" do
      @player.warp(40,40)
      @player.collect_awards([@award]).should be_true
    end

    it "should not collect awards" do
      @player.warp(0,50)
      @player.collect_awards([@award]).should be_false
    end
  end

  describe "monsters" do
    before(:each) do
      @monster = mock
      @monster.stub(:x).and_return(50)
      @monster.stub(:y).and_return(50)
    end

    it "should touch monster" do
      @player.warp(40,40)
      @player.touch_monster([@monster]).should be_true
    end

    it "should not touch monster" do
      @player.warp(0,50)
      @player.touch_monster([@monster]).should be_false
    end
  end
end
