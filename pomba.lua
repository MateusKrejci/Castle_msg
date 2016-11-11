pomba = {}

function pomba.load()
    Pomba = love.graphics.newImage("/sprites/Pomba.png")
    pombaLargura = 50
    pombaAltura = 50
    pombaArrastoHorizontal = 10
    pombaVelocidadeHorizontal = 0
    pombaVelocidadeVertical = 0
    pombaX = 120
    pombaY = 330
    pombaDisparada = 0
    pombaGravidade = -1000
end

function pomba.desenha()
    love.graphics.draw(Pomba, pombaX, pombaY)
end

function pomba.disparar()
    pombaDisparada = 1
    pombaVelocidadeHorizontal = 500
    pombaVelocidadeVertical = -200
end

function pomba.gravidade(fps)
    if (pombaDisparada == 1) then 
        pombaVelocidadeVertical = pombaVelocidadeVertical - pombaGravidade * (1/fps)
    end
end

function pomba.atualizaPosicao(fps)
    pombaX = math.floor(pombaX + pombaVelocidadeHorizontal*(1/fps))
    pombaY = math.floor(pombaY + pombaVelocidadeVertical*(1/fps))
    pomba.gravidade(fps)
end