#import "../conf.typ": *


= Целые числа, сравнимые по модулю натурального числа $n >= 2$. Классы вычетов по модулю числа $n$ и операции над ними. Кольцо классов вычетов $ZZ_n$ по модулю $n$.

$ n in NN, n >= 2 $

Целое число $a$ *сравнимо по модулю* с целым числом $b$, если числа $a, b$ имеют одинаковые остатки при делении на $n$.


$
cases(
  a equiv b "mod" n,
  a equiv a "mod" n & - "св-во рефлексивности",
  a equiv b "mod" n arrow.r b equiv a "mod" n & - "свойство симметричности",
  a equiv b "mod" n and b equiv c "mod" n arrow.r a equiv c "mod" n & - "свойство транзитивности"
)
$


$ ZZ = bar(0) union bar(1) union bar(2) union ... union bar(n-1) $
// TODO: Рисунок. От элементов 0, 1, 2 под чертой идут линии, указывающие на надпись "Классы вычетов по модулю n"
#align(center)[
  Классы вычетов по модулю $n$
]

#formula[
  Класс вычетов с представителем $b$ по модулю $n$:
    $bar(b) = { a in ZZ : a equiv b "mod" n }$
]

$ ZZ_n = { bar(0), bar(1), ..., bar(n-1) } $

== Операции

#set align(center)
#grid(
  columns: (1fr, 1fr),
  gutter: 1.5em,
  [
    #rect(stroke: 1.5pt + rgb("#ff9999"), inset: 8pt)[$bar(a) + bar(b) = bar(a + b)$] \
    #text(size: 0.8em, fill: rgb("#cc3333"))[$[a]_n + [b]_n = [a + b]_n$]
  ],
  [
    #rect(stroke: 1.5pt + rgb("#ff9999"), inset: 8pt)[$bar(a) dot bar(b) = bar(a dot b)$]
  ]
)

#set align(left)

$ (ZZ_n, +, dot) $ — кольцо с единицей (Кольцо классов вычетов).

Роль нейтрального элемента по умножению играет единичный класс: $e = bar(1)$.
