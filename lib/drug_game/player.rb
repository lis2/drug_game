module DrugGame
  class Player < DrugGame::Movable

    attr_reader :score

    def initialize(window)
      super(window)
      @window = window
      set_player_image
    end

    def set_player_image
      @standing, @walk_right1, @walk_right2, @walk_left1, @walk_left2 = Gosu::Image.load_tiles(@window, File.dirname(__FILE__) + "/../../media/dwarf.png", 56, 80, false)
      @width = 56
      @height = 80
      @cur_image = @standing
    end

    def collect_awards(awards)
      awards.reject! do |award|
        if Gosu::distance(@x, @y, award.x, award.y) < 50
          @score += award.score
        else
          false
        end
      end
    end

    def touch_monster(monsters)
      monsters.reject! do |monster|
        if Gosu::distance(@x, @y, monster.x, monster.y) < 50
          sleep(0.5)
          @window.close
          true
        else
          false
        end
      end
    end

  end
end
