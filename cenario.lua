cenario = {    
    semfogo = love.graphics.newImage("/sprites/background_ganhou.png"),
    comfogo = love.graphics.newImage("/sprites/background__em_jogo.png"),
    queimado = love.graphics.newImage("/sprites/background__perdeu.png"),
    castelo = {x = 897, y = 364, altura = 141, largura = 110}        
}

function cenario.load()
  cenario.fundo = cenario.comfogo
end

function cenario.desenha()
  love.graphics.draw(cenario.fundo, 0, 0)
end

function cenario.carregaVitoria()
    cenario.fundo = cenario.semfogo
end

function cenario.carregaDerrota()
    cenario.fundo = cenario.queimado
end

