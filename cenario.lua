cenario = {}

function cenario.load()
  background = love.graphics.newImage("/sprites/background.png")
end

function cenario.desenha()
  love.graphics.draw(background, 0, 0)
end
