require "Pomba"
require "cenario"

function love.load()
  love.physics.setMeter(64)
  mundo = love.physics.newWorld(0,  9.81 * 64, true)

  objetos = {}

  objetos.chao = {}
  objetos.chao.body = love.physics.newBody(mundo, 1024, 600)
  objetos.chao.shape = love.physics.newRectangleShape(1024, 100)
  objetos.chao.fixture = love.physics.newFixture(objetos.chao.body, objetos.chao.shape)

  objetos.pomba = {}
  objetos.pomba.body = love.physics.newBody(mundo, 120, 330, "dynamic")
  objetos.pomba.shape = love.physics.newRectangleShape(50, 50)
  objetos.pomba.fixture = love.physics.newFixture(objetos.pomba.body, objetos.pomba.shape, 1)
  objetos.pomba.fixture:setRestitution(0.9)

  cenario.load()
  pomba.load()
end

function love.draw()
  cenario.desenha()
  pomba.desenha()
end

function love.update(dt)
    pomba.gravidade()
    pomba.disparar()

end

function love.focus(bool)

end
