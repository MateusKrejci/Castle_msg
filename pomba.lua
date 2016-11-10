pomba = {}

function pomba.load()
  Pomba = love.graphics.newImage("/sprites/Pomba.png")
  pombaLargura = 50
  pombaAltura = 50
  pombaX = 120
  pombaY = 330
end

function pomba.desenha()
  love.graphics.draw(Pomba, pombaX, pombaY)
end

function pomba.disparar()
  pombaX = pombaX
end

function pomba.gravidade()
  pombaY = pombaY + 1
end
