require "Pomba"
require "cenario"

dta = 0

function love.load()
  cenario.load()
  pomba.load()
end

function love.draw()
    cenario.desenha()
    pomba.desenha()
    love.graphics.print("FPS: " .. math.floor(1/dta) , love.graphics.getWidth() - 50, love.graphics.getHeight() - 15)
end
    
function love.update(dt)
    trataEntradas()
    pomba.atualizaPosicao(math.floor(1/dt))   
    dta = dt
end

function love.focus(bool)

end

function trataEntradas()
    if love.mouse.isDown(1) then
		pomba.disparar()
	end	
end