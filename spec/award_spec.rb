require 'drug_game/movable'
require 'drug_game/award'
require File.join(File.dirname(__FILE__), 'spec_helper')

describe DrugGame::Award do
  before(:each) do
    @award = DrugGame::Award.new($window)
  end

  it "should have a name" do
    [:coffeescript, :dci, :wroclove, :rails, :ruby].should include(@award.name)
  end

  it "should have a score" do
    [5, 7, 10, 15, 1000].should include(@award.score)
  end

  it "should have width and height" do
    @award.width.should == 40
    @award.height.should == 40
  end

end
