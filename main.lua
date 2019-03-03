require('particle_system')
local math_utils = require('math_utils')

function love.load()
  
  angle = 0
  
  screenW = love.graphics.getWidth()
  screenH = love.graphics.getHeight()
  
  --[[
  local x = screenW / 2
  local y = screenH / 2
  ]]--
  local x = 0
  local y = 0
  particleSys = ParticleSystem:new({x = x, y = y, max = 2000})
  
  scale = 1
  scale_factor = 1
end

function love.update(dt)
  -- rotation
  -- angle = angle + (1 * 0.01)
  angle = math_utils.random_range(1, 5) * 0.05
  
  
  -- scaling
  scale = 1 + math.cos(scale_factor) * 2
  local scale_speed = math_utils.random_range(-1, 1) * 0.001
  scale_factor = scale_factor + scale_speed
  
  --[[ shake 
  if angle > 0.055 then 
    angle = 0
  end 
  ]]--
  
  
  particleSys:addParticle()
  particleSys:update()
end

function love.draw()
  
  love.graphics.translate(screenW / 2, screenH / 2)
  love.graphics.rotate(angle)
  love.graphics.scale(scale, scale)
  
  local particles = particleSys.particles
  for k,v in ipairs(particles) do
    love.graphics.setColor(v.color['r'], v.color['g'], v.color['b'], v.lifespan)
    love.graphics.circle('fill', v.location.x, v.location.y, v.radius, 8)
  end
end



