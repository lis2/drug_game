require 'drug_game/movable'
require 'drug_game/monster'
require File.join(File.dirname(__FILE__), 'spec_helper')

describe DrugGame::Monster do
  let(:monster) { DrugGame::Monster.new($window) }

  it "should have width and height" do
    monster.width.should == 80
    monster.height.should == 60
  end

  it "should turn left" do
    lambda {
      monster.turn_left
    }.should change(monster, :vel_x).by(-1)
  end

  it "should turn right" do
    lambda {
      monster.turn_right
    }.should change(monster, :vel_x).by(1)
  end

  it "should change direction on right edge" do
    monster.warp(39, 660)
    monster.move
    monster.warp(1880, 660)
    monster.move
    monster.dir.should == :left
  end

  it "should change direction on left edge" do
    monster.warp(39, 660)
    monster.move
    monster.dir.should == :right
  end
end
