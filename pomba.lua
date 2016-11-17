pomba = {}

function pomba.load()
    Pomba = love.graphics.newImage("/sprites/Pomba.png")
    _pombaLargura = 50
    _pombaAltura = 50
    _pombaArrastoHorizontal = 10
    _pombaVelocidadeHorizontal = 0
    _pombaVelocidadeVertical = 0
    _pombaX = 120
    _pombaY = 330
    _pombaDisparada = 0
    _pombaGravidade = -1000
end

function pomba.desenha()
    love.graphics.draw(Pomba, _pombaX, _pombaY)
end

function pomba.disparar(forca, direcao)
    if _pombaDisparada == 0 then
		_pombaDisparada = 1
		_pombaVelocidadeHorizontal = forca * (math.cos(direcao))
		_pombaVelocidadeVertical = forca * (math.sin(direcao))
	end
end

function pomba.gravidade(fps)
    if (_pombaDisparada == 1) then 
        _pombaVelocidadeVertical = _pombaVelocidadeVertical - _pombaGravidade * (1/fps)
    end
end

function pomba.atualizaPosicao(fps)
    _pombaX = math.floor(_pombaX + _pombaVelocidadeHorizontal*(1/fps))
    _pombaY = math.floor(_pombaY + _pombaVelocidadeVertical*(1/fps))
    pomba.gravidade(fps)
end

function pomba.getX()
	return _pombaX 
end
function pomba.getY()
	return _pombaY
end

function pomba.getAltura()
	return _pombaAltura
end

function pomba.getLargura()
	return _pombaLargura
end