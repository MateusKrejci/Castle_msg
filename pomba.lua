pomba = {
    grafico = love.graphics.newImage("/sprites/Pomba.png"),
    largura = 50,
    altura = 50,
    x = 0,
    y = 0,
    velocidadeHorizontal = 0,
    velocidadeVertical = 0,
    disparada = 0,
}

function pomba.load()
        pomba.x = 120
        pomba.y = 330
        pomba.velocidadeHorizontal = 0
        pomba.velocidadeVertical = 0
        pomba.disparada = 0
    
end

function pomba.desenha()
    love.graphics.draw(pomba.grafico, pomba.x, pomba.y)
end

function pomba.disparar(forca, direcao)
    if pomba.disparada == 0 then
		pomba.disparada = 1
		pomba.velocidadeHorizontal = forca * (math.cos(direcao))
		pomba.velocidadeVertical = forca * (math.sin(direcao))
	end
end

function pomba.gravidade(fps)
    if (pomba.disparada == 1) then 
        pomba.velocidadeVertical = pomba.velocidadeVertical  + 1000 * (1/fps)
    end
end

function pomba.atualizaPosicao(fps)
    pomba.x = math.floor(pomba.x + pomba.velocidadeHorizontal*(1/fps))
    pomba.y = math.floor(pomba.y + pomba.velocidadeVertical*(1/fps))
    pomba.gravidade(fps)
end
