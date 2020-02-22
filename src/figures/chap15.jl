function fig15_1(output::Symbol, font::String, scale::Float64)
  p = TikzPicture(L"""
  \node[anchor=east](blank) at (-2.25, 0) {\tt p};
  \node[draw, fill=mycolor, minimum width=2.5cm, minimum height=1cm](Punto) at(0,0){};
  \node[anchor=west] at (-1.25, 0.75) {\tt Punto};
  \node[anchor=east] (x) at(-0.75, 0.25) {\tt x};
  \node[anchor=west] (xv) at (0.25, 0.25) {\tt 3.0};
  \node[anchor=east] (y) at(-0.75, -0.25) {\tt y};
  \node[anchor=west] (yv) at (0.25, -0.25) {\tt 4.0};
  \draw[-latex] (blank) -- (Punto);
  \draw[-latex] (x) -- (xv);
  \draw[-latex] (y) -- (yv);
  """; options= "scale=$scale, transform shape", preamble="""
  \\usepackage{cancel}
  \\usepackage{fontspec}
  \\setmonofont[Scale=MatchLowercase]{$font}
  \\usetikzlibrary{arrows.meta}
  \\definecolor{mycolor}{RGB}{247,247,248}""")
  output == :pdf ? save(PDF("fig151"), p) : save(SVG("fig151"), p)
end

function fig15_2(output::Symbol, font::String, scale::Float64)
  p = TikzPicture(L"""
  \node[anchor=east](caja) at (-2.75, 0) {\tt caja};
  \node[draw, fill=mycolor, minimum width=3.5cm, minimum height=1.5cm](Rectangulo) at(0,0){};
  \node[anchor=west] at (-1.75, 1) {\tt Rectangulo};
  \node[anchor=east] (w) at(-0.5, 0.55) {\tt ancho};
  \node[anchor=west] (wv) at (0.5, 0.55) {\tt 100.0};
  \node[anchor=east] (h) at(-0.5, 0) {\tt alto};
  \node[anchor=west] (hv) at (0.5, 0) {\tt 200.0};
  \node[anchor=east] (esquina) at(-0.5, -0.5) {\tt esquina};
  \draw[-latex] (caja) -- (Rectangulo);
  \draw[-latex] (w) -- (wv);
  \draw[-latex] (h) -- (hv);
  \node[draw, fill=mycolor, minimum width=2.5cm, minimum height=1cm](MPunto) at(4,-0.5){};
  \node[anchor=west] at (2.75, 0.25) {\tt MPunto};
  \node[anchor=east] (x) at(3.25, -0.25) {\tt x};
  \node[anchor=west] (xv) at (4.25, -0.25) {\tt 0.0};
  \node[anchor=east] (y) at(3.25, -0.75) {\tt y};
  \node[anchor=west] (yv) at (4.25, -0.75) {\tt 0.0};
  \draw[-latex] (esquina) -- (MPunto);
  \draw[-latex] (x) -- (xv);
  \draw[-latex] (y) -- (yv);
  """; options= "scale=$scale, transform shape", preamble="""
  \\usepackage{cancel}
  \\usepackage{fontspec}
  \\setmonofont[Scale=MatchLowercase]{$font}
  \\usetikzlibrary{arrows.meta}
  \\definecolor{mycolor}{RGB}{247,247,248}""")
  output == :pdf ? save(PDF("fig152"), p) : save(SVG("fig152"), p)
end
