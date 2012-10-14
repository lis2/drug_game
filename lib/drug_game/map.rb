module DrugGame
  class Map

    attr_reader :width, :height, :platforms, :window

    def initialize(window)
      set_window(window)
      set_platforms
    end

    def set_window(window)
      @width = 1920;
      @height = 1200;
      @window = window
    end

    def set_platforms
      @platforms = [[100, 550], [100, 100], [350, 450], [350, 200], [350, 50], [600, 350], [630, 550],
        [650, 50], [800, 200], [1000, 400], [1000, 550], [1100, 50], [1300, 300], [1350, 550], 
        [1450, 400], [1450, 50], [1600, 200]]
      @platform = Gosu::Image.new(@window, File.dirname(__FILE__) + "/../../media/platform.png", true)
    end

    def solid?(x, y, height)
      y >= (window.height - 10 - (height / 2)) || self.platform?(x, y, (height))
    end

    def platform?(x, y, height)
      @platforms.each do |platform|
        if ((platform[0]..(platform[0] + 200)).include?(x) && ((platform[1] - height/2)..platform[1] - height/2 + 1).include?(y))
          return true
        end
      end
      return false
    end

    def draw
      @platforms.each { |platform| @platform.draw(platform[0], platform[1], 0) }
    end

  end
end
