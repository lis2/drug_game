require 'drug_game/map'
require File.join(File.dirname(__FILE__), 'spec_helper')

describe DrugGame::GameWindow do
  it "should not generate monster" do
    lambda {
      $window.stub(:rand).and_return(5)
      $window.generate_monsters
    }.should_not change($window.monsters, :length)
  end

  it "should generate monster" do
    lambda {
      $window.stub(:rand).and_return(3)
      $window.generate_monsters
    }.should change($window.monsters, :length).by(1)
  end

  it "should not generate award" do
    lambda {
      $window.stub(:rand).and_return(4)
      $window.generate_awards
    }.should_not change($window.awards, :length)
  end

  it "should generate award" do
    lambda {
      $window.stub(:rand).and_return(3)
      $window.generate_awards
    }.should change($window.awards, :length).by(1)
  end
end
