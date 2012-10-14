module DrugGame
  class Movable

    attr_reader :x, :y, :width, :height, :cur_image, :vel_x, :vel_y, :vy, :standing

    def initialize(window)
      @x = @y = @vel_x = @vel_y = @vy = @score  = 0
      @window = window
      @map = window.map
      @height = 50
      @width = 50
    end

    def warp(x, y)
      @x, @y = x, y
    end

    def turn_left
      @vel_x = -5
    end

    def turn_right
      @vel_x = +5
    end

    def jump
      @vy = -20 if @map.solid?(@x, @y, @height)
    end

    def would_fit(offs_x, offs_y)
      not @map.solid?(@x + offs_x, @y + offs_y, @height)
    end

    def move
      @x += @vel_x
      @y += @vel_y
      @x = @map.width - (@width/2) if @x >= @map.width - (@width/2)
      @y = @map.height - (@height/2) if @y >= @map.height - (@height/2)
      @x = @width/2 if @x < (@width/2)
      @vel_x *= 0.90
      @vel_y *= 0.90

      set_gravity
      set_image
    end

    def set_gravity
      @vy += 1
      @vy.times { if would_fit(0, 1) then @y += 1 else @vy = 0 end } if @vy > 0
      (-@vy).times { @y -= 1 } if @vy < 0
    end

    def set_image
      if (@vel_x.to_i == 0)
        @cur_image = @standing
      else
        if @vel_x > 0
          @cur_image = (milliseconds / 175 % 2 == 0) ? @walk_right1 : @walk_right2
        else
          @cur_image = (milliseconds / 175 % 2 == 0) ? @walk_left1 : @walk_left2
        end
      end
    end

    def draw
      @cur_image.draw_rot(@x, @y, 1, 0)
    end

  end
end
