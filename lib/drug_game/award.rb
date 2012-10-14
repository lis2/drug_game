module DrugGame
  class Award < DrugGame::Movable

    attr_reader :score, :name

    def initialize(window)
      super(window)
      @window = window
      set_score
      set_award_image
      set_position
    end

    def set_score
      @name = [:coffeescript, :dci, :wroclove, :rails, :ruby].sample
      @score = case @name
        when :coffeescript then 5
        when :dci          then 1000
        when :wroclove     then 15
        when :ruby         then 7
        when :rails        then 10
      end
    end

    def set_award_image
      @standing = @walk_right1 = @walk_right2 = @walk_left1 = @walk_left2 = @cur_image =
        Gosu::Image::new(@window, File.dirname(__FILE__) + "/../../media/awards/#{@name}.png", true)
      @width = 40
      @height = 40
    end

    def set_position
      @x = rand * @window.map.width - 100
      @y = rand * @window.map.height / 4
      @y = (@window.height - @height/2 - 10) if @y > (@window.height - @height/2 - 10)
    end

  end
end


