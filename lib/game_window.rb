require 'gosu'
include Gosu

require "drug_game/movable"
require "drug_game/player"
require "drug_game/map"
require "drug_game/award"
require "drug_game/monster"

module DrugGame
  class GameWindow < Gosu::Window

    attr_reader :map, :width, :height, :player, :awards, :monsters

    def initialize
      @width = 1280
      @height = 700
      super @width, @height, false

      self.caption = "Drug Game"
      @background_image = Gosu::Image.new(self, File.dirname(__FILE__) + "/../media/Sydney.jpg", true)
      @map = DrugGame::Map.new(self)
      @player = DrugGame::Player.new(self)
      @player.warp(100, 400 - @player.height / 2)

      @camera_x = @camera_y = 0, (self.height - @map.height)

      @awards = Array.new
      @monsters = Array.new

      @font = Gosu::Font.new(self, Gosu::default_font_name, 20)
    end

    def update
      set_keyboard_buttons
      generate_monsters
      generate_awards
      set_player
      set_camera
    end

    def set_keyboard_buttons
      @player.turn_left if button_down?(Gosu::KbLeft) || button_down?(Gosu::GpLeft)
      @player.turn_right if button_down?(Gosu::KbRight) || button_down?(Gosu::GpRight)
      @player.jump if button_down?(Gosu::KbUp) || button_down?(Gosu::GpButton0)
    end

    def generate_monsters
      @monsters.push(DrugGame::Monster.new(self)) if rand(1000) < 5 && @monsters.size < 25
      @monsters.each { |monster| monster.move }
    end

    def generate_awards
      @awards.push(DrugGame::Award.new(self)) if rand(100) < 4 && @awards.size < 25
      @awards.each { |award| award.move }
    end

    def set_player
      @player.move
      @player.collect_awards(@awards)
      @player.touch_monster(@monsters)
    end

    def set_camera
      @camera_x = [[@player.x - self.width/2, 0].max, @map.width - self.width].min
      @camera_y = -[[@height/2 - @player.y, 0].max, height/2].min
    end

    def draw
      translate(-@camera_x, -@camera_y) do
        @player.draw
        @background_image.draw(0, (self.height - @map.height), 0)
        @map.draw

        @awards.each { |award| award.draw }
        @monsters.each { |monster| monster.draw }
      end
      @font.draw("Score: #{@player.score}", 10, 10, 2, 1.0, 1.0, 0xffff0000)
    end

    def button_down(id)
      if id == Gosu::KbEscape
        close
      end
    end

  end
end

