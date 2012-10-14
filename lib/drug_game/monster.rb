module DrugGame
  class Monster < DrugGame::Movable

    attr_reader :score, :dir

    def initialize(window)
      super(window)
      @window = window
      @dir = :left
      set_monster_image
      set_position
    end

    def set_monster_image
      @standing = @walk_right1 = @walk_right2 = @walk_left1 = @walk_left2 = @cur_image =
        Gosu::Image::new(@window, File.dirname(__FILE__) + "/../../media/monsters/ar.png", true)
      @width = 80
      @height = 60
    end

    def set_position
      @x = rand * @window.map.width - 100
      @y = rand * @window.map.height
      @y = 660 if @y > 660
    end

    def move
      super
      @dir = :right if @dir == :left && (!@map.solid?(@x - 1, @y + 1, @height) || @x < 41)
      @dir = :left if @dir == :right && (!@map.solid?(@x + 1, @y + 1, @height) || @x > 1879)
      self.turn_left if @dir == :left
      self.turn_right if @dir == :right
    end

    def turn_left
      @vel_x = -1
    end

    def turn_right
      @vel_x = +1
    end

  end
end


