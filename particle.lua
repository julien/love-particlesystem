require 'math'
require 'vec2'

Particle = {}

function Particle:new()
  o = {
    location = Vec2:new(),
    acceleration = Vec2:new(),
    velocity = Vec2:new(),
    lifespan = math.random(123, 255),
    radius = math.random(8, 20),
    color =  {
      r = math.random(255),
      g = math.random(255),
      b = math.random(255)
    }
  }
  
  self.__index = self
  return setmetatable(o, self)
end

function Particle:update()
  
  self.velocity:add(self.acceleration)
  self.location:add(self.velocity)

  self.lifespan = self.lifespan - 1.0
end

function Particle:is_dead()
  return self.lifespan < 0
end
