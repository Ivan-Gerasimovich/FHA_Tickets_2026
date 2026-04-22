#import "../conf.typ": *

= Линейное пространство над полем

Пусть $P$ — произвольное поле, $alpha, beta, gamma, alpha_1, ..., alpha_n in P$ — элементы поля (скаляры).

Пусть $V$ — непустое множество; его элементы $a, b, c, ..., x, y, z, a_1, ..., a_n$ называем *векторами*.

На $V$ заданы две операции:
- сложение $quad (a, b) |-> a + b in V$;
- умножение на скаляр $quad (lambda, a) |-> lambda dot a in V, space lambda in P$.

#definition[
  Множество $V$ со сложением и умножением на элементы поля $P$ называется
  *линейным пространством над полем $P$*, если выполнены следующие аксиомы.
] <def:linear-space>

#axiom[ $(V, +)$ — абелева группа. ] <ax:1>

#axiom[
  $forall a in V: quad 1 dot a = a$ #h(1em) (аксиома унитарности).
] <ax:2>

#axiom[
  $forall alpha, beta in P, space forall a in V: quad (alpha beta) dot a = alpha dot (beta dot a)$.
] <ax:3>

#axiom[
  $forall alpha, beta in P, space forall a in V: quad (alpha + beta) dot a = alpha dot a + beta dot a$.
] <ax:4>

#axiom[
  $forall alpha in P, space forall a, b in V: quad alpha dot (a + b) = alpha dot a + alpha dot b$.
] <ax:5>

== Примеры

+ Множество $V_2$ геометрических векторов на плоскости с обычным сложением и умножением на действительное число — линейное пространство над $RR$.
+ Множество $V_3$ геометрических векторов трёхмерного пространства — линейное пространство над $RR$.
+ Множество матриц $P^(m times n)$ с элементами из поля $P$ — линейное пространство над $P$.
+ Множество столбцов $P^m$ высоты $m$ над полем $P$ — линейное пространство над $P$.

== Свойства линейного пространства

#property[
  В пространстве $V$ существует единственный нулевой вектор $bold(0)_V$ (нейтральный элемент по сложению).
] <prop:1>

#property[
  Для каждого вектора $a in V$ существует единственный противоположный элемент $-a in V$.
] <prop:2>

#property[
  $forall a in V: quad 0 dot a = bold(0)_V$, где $0 in P$.
] <prop:3>

#proof[
  По @ax:2 имеем $a = 1 dot a$. Тогда:

  $ 0 dot a &= 0 dot a + bold(0)_V 
         \ &= 0 dot a + (a + (-a)) 
         \ &= (0 dot a + 1 dot a) + (-a) 
         \ &attach(=, t: #text(size: 8pt)[@ax:4]) (0 + 1) dot a + (-a) 
         \ &= 1 dot a + (-a) 
         \ &= a + (-a) = bold(0)_V. $
]

#property[
  $forall a in V: quad (-1) dot a = -a$.
] <prop:4>

#proof[
  Рассмотрим сумму:

  $ a + (-1) dot a &attach(=, t: #text(size: 8pt)[@ax:2]) 1 dot a + (-1) dot a 
                \ &attach(=, t: #text(size: 8pt)[@ax:4]) (1 + (-1)) dot a 
                \ &= 0 dot a attach(=, t: #text(size: 8pt)[@prop:3]) bold(0)_V. $

  Значит, $(-1) dot a$ — противоположный к $a$. В силу единственности (@prop:2) получаем $(-1) dot a = -a$.
]

#property[
  $forall alpha in P: quad alpha dot bold(0)_V = bold(0)_V$.
] <prop:5>

#proof[
  Возьмём любой $a in V$, тогда $bold(0)_V = a + (-a)$:

  $ alpha dot bold(0)_V &= alpha dot (a + (-a)) 
                     \ &attach(=, t: #text(size: 8pt)[@ax:5]) alpha dot a + alpha dot (-a) 
                     \ &attach(=, t: #text(size: 8pt)[@prop:4]) alpha dot a + alpha dot ((-1) dot a) 
                     \ &attach(=, t: #text(size: 8pt)[@ax:3]) alpha dot a + (-alpha) dot a 
                     \ &attach(=, t: #text(size: 8pt)[@ax:4]) (alpha + (-alpha)) dot a 
                     \ &= 0 dot a attach(=, t: #text(size: 8pt)[@prop:3]) bold(0)_V. $
]