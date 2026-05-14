#import "../conf.typ": *

= Линейные отображения и их свойства

#definition[
  Пусть $V, U$ --- линейные пространства над полем $P$.
  Отображение $f: V -> U$ наз-ся *линейным*, если:
  + $forall x, y in V: quad f(x + y) = f(x) + f(y)$
  + $forall lambda in P, quad forall x in V: quad f(lambda x) = lambda dot f(x)$
]

== Свойства линейных отображений

#property()[
  Если $V, U, W$ --- линейные пр-ва над одним и тем же полем $P$ и $f: V -> U$ --- линейное отображ., $g: U -> W$ --- линейное отображение, то $g compose f: V -> W$ --- линейное отображение.
]

#proof[
  + $forall x, y in V: quad (g compose f)(x + y) = g(f(x + y)) =^(f - upright("лин. отобр.")) g(f(x) + f(y)) =^(g - upright("лин. отобр.")) g(f(x)) + g(f(y)) = (g compose f)(x) + (g compose f)(y)$
  + $forall lambda in P, quad forall x in V: quad (g compose f)(lambda x) = g(f(lambda x)) =^(f - upright("лин. отобр.")) g(lambda dot f(x)) =^(g - upright("лин. отобр.")) lambda dot g(f(x)) = lambda dot (g compose f)(x)$
]

#property()[
  Если $f: V -> U$ --- линейное отображение, то $f(0_V) = 0_U$.
]

#proof[
  $f(0_V) = f(0 dot a) = 0 dot f(a) = 0_U$, \
  где $p = 0, a in V$ и $0_U in U$.
]

#property()[
  Если $f: V -> U$ --- линейное отображение, то $forall x in V: quad f(-x) = -f(x)$.
]

#proof[
  $f(-x) + f(x) =^(1^circle) f(-x + x) = f(0_V) = 0_U$.
]

#property()[
  Если $f: V -> U$ --- линейное отображение и $W subset.eq V$ --- подпространство пространства $V$, то $f(W)$ --- подпространство пространства $U$.
]
#remark[Без док.]

#property()[
  Если $f: V -> U$ --- линейное и биективное отображение, то $f^(-1): U -> V$ --- линейное биективное отображение.
]
#remark[Без док.]
