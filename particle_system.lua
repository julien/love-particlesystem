require 'math'
require 'particle'
local math_utils = require('math_utils')

ParticleSystem = {}

function ParticleSystem:new(v)  
  v = v or {}
  
  o = {
    particles = {},
    origin = Vec2:new({ x = v.x, y = v.y }),
    max = v.max or 100
  }

  self.__index = self
  return setmetatable(o, self)
end

function ParticleSystem:addParticle()
  

  if #self.particles < self.max then
    
    local p = Particle:new()
    
    local x = math_utils.random_range(-50, 50)
    local y = math_utils.random_range(-50, 50)
    
    p.location:set(self.origin.x + x, self.origin.y + y)
    
    x = math_utils.random_range(-3, 3) * 0.01
    y = math_utils.random_range(-2, 2) * 0.01
    
    p.acceleration:set(x, y)
      
    x = math_utils.random_range(-4, 4) * 0.01
    y = math_utils.random_range(-4, 4) * 0.01
    
    p.velocity:set(x, y)


    table.insert(self.particles, p)
  end
  
end

function ParticleSystem:update()
  for k,v in ipairs(self.particles) do
    v:update()
    if (v:is_dead()) then
      table.remove(self.particles, k)
    end   
  end
end
