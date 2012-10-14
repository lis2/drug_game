require 'drug_game/map'
require File.join(File.dirname(__FILE__), 'spec_helper')

describe DrugGame::Map do
  before(:each) do
    @map = DrugGame::Map.new($window)
  end

  it "ground should be solid" do
    @map.solid?(500, 650, 80).should be_true
  end

  it "heaven should not be solid" do
    @map.solid?(500, 0, 80).should_not be_true
  end

  it "platform should exists" do
    @platforms = [[100, 100]]
    @map.solid?(100, 60 ,80).should be_true
  end

  it "platform should be solid" do
    @platforms = [[100, 100]]
    @map.platform?(100, 60 ,80).should be_true
  end
end
