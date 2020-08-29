function contarlineas(nombrearchivo)
    conteo = 0
    for linea in eachline(nombrearchivo)
        conteo += 1
    end
    conteo
end

print(contarlineas("wc.jl"))