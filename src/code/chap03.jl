function imprimirletras()
    println("Jueguemos en el bosque")
    println("mientras el lobo no está.")
end

function repetirletras()
    imprimirletras()
    imprimirletras()
end

function imprimirdosveces(juan)
    println(juan)
    println(juan)
end

function concatenar_dos(parte1, parte2)
    concat = parte1 * parte2
    imprimirdosveces(concat)

end
