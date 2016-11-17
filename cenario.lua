cenario = {}
semfogo = love.graphics.newImage("/sprites/semfogo.png")
comfogo = love.graphics.newImage("/sprites/comfogo.png")
queimado = love.graphics.newImage("/sprites/queimado.png")

function cenario.load()
  _fundo = comfogo
end

function cenario.desenha()
  love.graphics.draw(_fundo, 0, 0)
end

function cenario.carregaVitoria()
    _fundo = semfogo
end

function cenario.carregaDerrota()
    _fundo = queimado
end

