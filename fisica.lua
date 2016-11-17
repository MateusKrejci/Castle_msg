fisica = {}

function fisica.verificaColisao(objeto1, objeto2) 
        return (objeto1.x < objeto2.x + objeto2.largura and
   objeto1.x + objeto1.largura > objeto2.x and
   objeto1.y < objeto2.y + objeto2.altura and
   objeto1.altura + objeto1.y > objeto2.y) 
end
    