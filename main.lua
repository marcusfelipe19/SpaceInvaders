push = require 'push'

Class = require 'class'

require 'SpaceShip'

require 'Enemy'

--requerer bola e objetos.

WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720

VIRTUAL_WIDTH = 432
VIRTUAL_HEIGHT = 243

function love.load()
    love.graphics.setDefaultFilter('nearest', 'nearest')

    love.window.setTitle('Space Invaders')

    math.randomseed(os.time())

    smallFont = love.graphics.newFont('font.ttf', 8)
    scoreFont = love.graphics.newFont('font.ttf', 16)
    love.graphics.setFont(smallFont)

    --colocar som aqui depois.

    push:setupScreen(VIRTUAL_WIDTH, VIRTUAL_HEIGHT, WINDOW_WIDTH, WINDOW_HEIGHT, {
        fullscreen = false,
        resizable = true,
        vsync = true,
        canvas = false
    })


    player = SpaceShip(VIRTUAL_WIDTH / 2 - 20, VIRTUAL_HEIGHT - 20, 40, 10)
    --Colocar Jogador, bola e inimigos aqui.

    score = 0

    gameState = 'start'
end

function love.resize(w, h)
    push:resize(w,h)
end

function love.update()

end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    elseif key == 'enter' or key == 'return' then
        if gameState == 'start' then
            gameState = 'play'
        elseif gameState == 'done' then
            gameState = 'play'

            --Resetar tudo aqui.

            score = 0
        end
    end
end

function love.draw()
    push:start()

    love.graphics.clear(40, 45, 52, 255)

    if gameState == 'start' then
        love.graphics.setFont(smallFont)
        love.graphics.printf('Welcome to Space Invaders!', 0, 10, VIRTUAL_WIDTH, 'center')
        love.graphics.printf('Press Enter to begin!', 0, 20, VIRTUAL_WIDTH, 'center')
    elseif gameState == 'play' then

    elseif gameState == 'done' then
        love.graphics.setFont(smallFont)
        love.graphics.printf('Press Enter to restart!', 0, 30, VIRTUAL_WIDTH, 'center')
    end

    displayScore()

    player:render()
    --Render player and objects.

    displayFPS()

    push:finish()
end

function displayScore()
    love.graphics.setFont(scoreFont)
    love.graphics.print('Score: ' .. tostring(score), 10, 10)
end

function displayFPS()
    love.graphics.setFont(smallFont)
    love.graphics.setColor(0, 255, 0, 255)
    love.graphics.print('FPS: '.. tostring(love.timer.getFPS()), VIRTUAL_WIDTH - 40, 10)
    love.graphics.setColor(255, 255, 255, 255)
end