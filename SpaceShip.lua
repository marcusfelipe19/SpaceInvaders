SpaceShip = class{}

function SpaceShip:init(x, y, width, height)
    self.x = x
    self.y = y
    self.width = width
    seçf.height = height
    self.dx = 0
end

function SpaceShip:update(dt)
    if self.dx < 0 then
        self.x = math.max(0, self.x + self.dy * dt)
    else
        self.y = math.min(VIRTUAL_WIDTH - self.width, self.x + self.dy * dt)
    end
end

function SpaceShip:render()
    love.graphics.rectangle('fill', self.x, self.y, self.widthm self.height)
end