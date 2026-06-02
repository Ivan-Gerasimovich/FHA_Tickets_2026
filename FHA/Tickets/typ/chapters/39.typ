#import "../conf.typ": *


= Целые числа, сравнимые по модулю натурального числа $n >= 2$. Классы вычетов по модулю числа $n$ и операции над ними. Кольцо классов вычетов $ZZ_n$ по модулю $n$.
\

$n in NN, n >= 2$
#definition[
  Целое число $a$ *сравнимо по модулю* с целым числом $b$, если числа $a, b$ имеют одинаковые остатки при делении на $n$ \ $  a equiv b "mod" n,$
]

$
cases(
  a equiv a "mod" n & - "свойство рефлексивности",
  a equiv b "mod" n arrow.r b equiv a "mod" n & - "свойство симметричности",
  a equiv b "mod" n and b equiv c "mod" n arrow.r a equiv c "mod" n & - "свойство транзитивности"
)
$


$ ZZ = underbrace(overline(0) union overline(1) union overline(2) union ... union overline(n-1), "классы вычетов  по модулю n") $


#formula[
  Класс вычетов с представителем $b$ по модулю $n$:\

    *$overline(b) = { a in ZZ : a equiv b "mod" n }$*
]

$ ZZ_n = { overline(0), overline(1), ..., overline(n-1) } $

== Операции

#set align(center)
#grid(
  columns: (1fr, 1fr),
  gutter: 1.5em,
  [
    #rect(stroke: 1.5pt + rgb("#ff9999"), inset: 8pt)[$overline(a) + overline(b) = overline(a + b)$] \
    #text(size: 0.8em, fill: rgb("#cc3333"))[$[a]_n + [b]_n = [a + b]_n$]
  ],
  [
    #rect(stroke: 1.5pt + rgb("#ff9999"), inset: 8pt)[$overline(a) dot overline(b) = overline(a dot b)$]
  ]
)

#set align(left)

*$ (ZZ_n, +, dot)  — "кольцо с единицей (Кольцо классов вычетов по модулю n)".$* \

 $"Роль нейтрального элемента по умножению играет единичный класс:" e = overline(1)$.
