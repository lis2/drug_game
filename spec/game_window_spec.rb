require 'drug_game/map'
require File.join(File.dirname(__FILE__), 'spec_helper')

describe DrugGame::GameWindow do

  context "monsters" do
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
  end

  context "awards" do
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

  context "set player" do
    after(:each) { $window.set_player }

    it "should move" do
      $window.player.should_receive(:move)
    end

    it "should collect awards" do
      $window.player.should_receive(:collect_awards)
    end

    it "should touch monsters" do
      $window.player.should_receive(:touch_monster)
    end
  end
end
