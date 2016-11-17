require "Pomba"
require "cenario"

dta = 0
casteloX = 897
casteloY = 364
casteloAltura = 141
casteloLargura = 110
musicafundo = love.audio.newSource("som/chiptune.mp3", "stream")

function love.load()
	cenario.load()
	pomba.load()
	cargaMouse = 0
	statusJogo = 0 -- 0 aguardando 1 vitoria 2 derrota
	
	love.audio.play(musicafundo)
	musicafundo:setVolume(.35)
end

function love.draw()
    cenario.desenha()
    if statusJogo == 0 then 
		pomba.desenha()
	end
	if cargaMouse > 0 then
		love.graphics.setColor(math.floor(cargaMouse/7),255 - math.floor(cargaMouse/7),0)
		love.graphics.setLineWidth(3)
		love.graphics.line(mouseX, mouseY, (pombaX+(pombaLargura/2)), (pombaY+(pombaAltura/2)))
		love.graphics.setColor( 255, 255, 255)
	end
    love.graphics.print("FPS: " .. math.floor(1/dta) , love.graphics.getWidth() - 50, love.graphics.getHeight() - 15)
	-- mensagens de debug
	--love.graphics.print("Ang A: " .. anguloAtaque , love.graphics.getWidth() - 100, love.graphics.getHeight() - 45)
	--love.graphics.print("For A: " .. forcaAtaque , love.graphics.getWidth() - 100, love.graphics.getHeight() - 30)
	--love.graphics.print("C Mo: " .. cargaMouse , love.graphics.getWidth() - 100, love.graphics.getHeight() - 60)
	--love.graphics.print("XY: " .. mouseX.."-"..mouseY , love.graphics.getWidth() - 100, love.graphics.getHeight() - 75)
	font = love.graphics.newFont(20)
	love.graphics.setFont(font)
	
	if statusJogo == 2 then		
		love.graphics.printf("Perdeu! Botão direito para tentar novamente!", (love.graphics.getWidth()/2)-200, (love.graphics.getHeight()/2)-200, 400, "center")		
	end
	if statusJogo == 1 then		
		love.graphics.printf("O castelo foi salvo!", (love.graphics.getWidth()/2)-200, (love.graphics.getHeight()/2)-200, 400, "center")		
	end
	font = love.graphics.newFont(12)
	love.graphics.setFont(font)
	
end
    
function love.update(dt)
    trataEntradas()
	verificaResultado()
    pomba.atualizaPosicao(math.floor(1/dt))   
    dta = dt
    if statusJogo == 1 then
        cenario.carregaVitoria()
    end
    if statusJogo == 2 then
        cenario.carregaDerrota()
    end
end

function love.focus(bool)

end

function trataEntradas()
	mouseX = love.mouse.getX()
	mouseY = love.mouse.getY()
	pombaX = pomba.getX()
	pombaY = pomba.getY()
	pombaAltura = pomba.getAltura()
	pombaLargura = pomba.getLargura()
	
	anguloAtaque = math.atan2(mouseY-(pombaY+(pombaAltura/2)),mouseX-(pombaX+(pombaLargura/2)))
	
	if cargaMouse > 2000 then
		cargaMouse = 10
	end
    if love.mouse.isDown(1) then
		cargaMouse = cargaMouse + 20
	end	
	if (cargaMouse > 0) and  not love.mouse.isDown(1) then        
		pomba.disparar(cargaMouse,anguloAtaque)
		cargaMouse = 0
	end
	if love.mouse.isDown(2) then -- reinica o jogo
		statusJogo = 0
		pomba.load()
	end	
end

function verificaResultado()
	
	if pombaAtingiuCastelo() and statusJogo == 0 then
		statusJogo = 2
	end
	
	if pombaSaiuDaTela() and statusJogo == 0 then
		statusJogo = 1
    end
end

function pombaAtingiuCastelo()
    return (pombaX < 0 or pombaX > love.graphics.getWidth() or pombaY > love.graphics.getHeight())
end    

function pombaSaiuDaTela()
    return (pombaX < casteloX + casteloLargura and
   pombaX + pombaLargura > casteloX and
   pombaY < casteloY + casteloAltura and
   pombaAltura + pombaY > casteloY) 
end