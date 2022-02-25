require_relative "pre"
class Snake
    attr_writer :direction , :growing
    def initialize
        @positions=[[2,0],[2,1], [2,2],[2,3]]
        @direction = 'down'
        @growing = false
    end
    def draw
        @positions.each do |postition|
            Square.new(x: postition[0] * GRID_SIZE, y: postition[1] * GRID_SIZE,size: GRID_SIZE-1 ,color: 'white')
        end
    end
    
    def move
        if ! @growing
          @positions.shift
        end
        case @direction
        when 'down'
            @positions.push(new_coords(head[0],head[1]+1))
        when 'right'
            @positions.push(new_coords(head[0]+1,head[1]))
        when 'left'
            @positions.push(new_coords(head[0]-1,head[1]))
        when 'up'
            @positions.push(new_coords(head[0],head[1]-1))
        end
        @growing = false
    end

    def hit_itself?
        @positions.uniq.length != @positions.length
    end
    

    def can_change_direction_to?(new_direction)
        case @direction
        when 'up' then new_direction != 'down'
        when 'down' then new_direction != 'up'
        when 'right' then new_direction != 'left'
        when 'left' then new_direction != 'right'
        end
    end
    def x
        head[0]
    end
    def y
        head[1]
    end
    def increase_snake(x,y)
        @positions.push(new_coords(x,y))
    end
    
    
    private
    def head
        @positions.last
    end

    def new_coords(x,y)
        [x % GRID_WIDTH , y% GRID_HEIGHT]
        
    end
    
    
end