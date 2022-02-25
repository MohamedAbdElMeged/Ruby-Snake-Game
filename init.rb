require_relative "snake"
require_relative "game"

set background: 'navy'
set fps_cap: 10

set title: "Snake Game"

snake = Snake.new
game = Game.new

update do
    clear
    game.draw
    unless game.finished?
        snake.move
    end
    
    snake.draw
    if game.snake_hit_ball?(snake.x,snake.y)
        game.records_hit
        snake.growing = true
    end

    if snake.hit_itself?
        game.finish
    end
    
end

on :key_down do |event|
    if ['up','left','down','right'].include?(event.key)
        if snake.can_change_direction_to?(event.key)
            snake.direction = event.key
        end
    end
    if game.finished? && event.key == 'r'
        snake = Snake.new
        game = Game.new
    end
end

show