## Piensa en Julia: Cómo Pensar como un Informático

Una introducción a la programación en el lenguaje informático científico Julia. Una versión en línea está disponible en https://piensaenjulia.github.io/PiensaEnJulia.jl/  
Para una versión en inglés, vea [ThinkJulia](https://benlauwens.github.io/ThinkJulia.jl/latest/book.html).

## PiensaEnJulia.jl

Todo el código utilizado en este libro está disponible en este repositorio. Este repositorio contiene el texto del libro y también funciona como un paquete de Julia para proporcionar el código utilizado en el libro, por ejemplo, en el capítulo 4 (Diseño de interfaz).

```julia
Pkg.add(PackageSpec(url="https://github.com/PiensaEnJulia/PiensaEnJulia.jl.git"))
using PiensaEnJulia
```

## Cómo contribuir

Si tiene una sugerencia o corrección, por favor abra un "issue" en GitHub.


## Compilando el libro

Es posible que desee compilar usted mismo el libro 
a partir de los archivos fuente de este repositorio. Aquí
se describe el esquema general para ello:


* Descargue Julia y asegúrese de que puede iniciarlo desde una línea
  de comandos como `bash`. 
* Asegúrese de tener tanto `ruby` (requerido por un asciidoctor) como`
  python` (usado por pygments). 
* Descargue asciidoctor, por ejemplo, utilizando `brew install
  asciidoctor` en MacOS. 
* Instale el paquete de python `pygments`, utilizando un comando como`
  pip install pygments`. 
* Clone este repositorio, por ejemplo con el comando:
```bash
git clone https://github.com/PiensaEnJulia/PiensaEnJulia.jl.git
```
* En Julia, agregue el paquete `PiensaEnJulia` con un comando como el siguiente:
```julia
julia> Pkg.add(PackageSpec(url="https://github.com/PiensaEnJulia/PiensaEnJulia.jl.git"))
```

* Vaya al directorio `book` en el repositorio y ejecute el comando
```bash
julia --startup-file=no make.jl build html images
```
Esto hará que el archivo `book/build/book.html`.


