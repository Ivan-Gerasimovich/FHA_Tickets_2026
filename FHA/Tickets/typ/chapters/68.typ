#import "../conf.typ": *

= Кольцо многочленов $P[x]$ от одной переменной $x$ с коэффициентами из поля $P$.

$ (PP[x], +, dot) " " — " кольцо" $

$ f(x) = x^2 - 2x + 2 in QQ[x] $
$ g(x) = x + 1 in QQ[x] $

$ f(x) dot g(x) = (x^2 - 2x + 2) dot (x + 1) = x^3 + x^2 - 2x^2 - cancel(2x) + cancel(2x) + 2 = $
$ = x^3 - x^2 + 2 in QQ[x] $

#definition[
  Многочлен $f(x) in PP[x]$ называется *неприводимым*, если его нельзя представить в виде многочленов, степени которых $< "deg" f(x)$:
  $ f(x) != a(x) dot b(x), quad "deg" a(x) < "deg" f(x), quad "deg" b(x) < "deg" f(x) $
]

$ f(x) = x^4 + 4 in QQ[x] $ — приводимый

$ f(x) = (x^4 + 4 + 4x^2) - 4x^2 = (x^2 + 2)^2 - 4x^2 = underbrace((x^2 + 2 - 2x), a(x)) underbrace((x^2 + 2 + 2x), b(x)) $
