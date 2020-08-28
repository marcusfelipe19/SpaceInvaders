Enemy = Class{}

function Enemy:init(x, y, width, height)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.dx = 0
    self.dy = 0
end

function Enemy:update(dt)
    