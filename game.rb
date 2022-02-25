
require_relative "pre"
class Game
    def initialize
        @score = 0
        @ball_x = rand(GRID_WIDTH)
        @ball_y = rand(GRID_HEIGHT)
        @finished = false
    end
    def draw
        unless @finished
            Square.new(x: @ball_x * GRID_SIZE, y: @ball_y* GRID_SIZE,size: GRID_SIZE, color: "yellow")
        end
        Text.new(text_message,color: "green",x:10,y:10,size:25)
    end
    
    def snake_hit_ball?(x,y)
        x == @ball_x && y == @ball_y         
    end
    
    def records_hit
        @score +=1
        @ball_x = rand(GRID_WIDTH)
        @ball_y = rand(GRID_HEIGHT)
    end
    def finish
        @finished = true
    end
    def finished?
        @finished
    end
    def text_message
        if finished?
          "Game over, Your Score was #{@score}. Press 'R' to restart. "
        else
          "Score: #{@score}"
        end
      end
    
end