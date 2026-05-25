#import "../conf.typ": *

= Линейные отображения и их свойства

#definition[
  Пусть $V, U$ --- линейные пространства над полем $P$. \
  Отображение $f: V -> U$ наз-ся *линейным*, если:\
  1$degree$. $forall x, y in V: quad f(x + y) = f(x) + f(y)$ \
  2$degree$. $forall lambda in P, quad forall x in V: quad f(lambda x) = lambda dot f(x)$
]

== Свойства линейных отображений

#property()[\
  Если $V, U, W$ --- линейные пр-ва над одним и тем же полем $P$, \ $f: V -> U$ --- линейное отображение, \  $g: U -> W$ --- линейное отображение, то \ $g compose f: V -> W$ --- линейное отображение.
]

#proof[ \
  1$degree$. $forall x, y in V: quad g compose f(x + y) = g compose f(x) + g compose f(y)$ \ 
  
  $quad g compose f(x + y) = g(f(x + y)) =^(f - upright("лин. отобр.")) g(f(x) + f(y)) =^(g - upright("лин. отобр."))$ \ $"   "$= $g(f(x)) + g(f(y)) \= g compose f(x) + g compose f(y)$ \

  2$degree$. $forall lambda in P, quad forall x in V: quad g compose f(lambda x) = lambda (g compose f)(x)$ \
  
   $"   "g compose f(lambda x) = g(f(lambda x)) =^(f - upright("лин. отобр.")) g(lambda dot f(x)) =^(g - upright("лин. отобр.")) lambda dot g(f(x)) = lambda dot (g compose f)(x)$
]

#property()[
  Если $f: V -> U$ --- линейное отображение, то $f(0_V) = 0_U$.
]

#proof[
  $f(underbrace((0_V), P" "in.rev O dot a in" "V)) = f(0 dot a) = 0 dot underbrace(f(a),in " "U) = 0_U$, \
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

#property()[
  Если $f: V -> U$ --- линейное и биективное отображение, то $f^(-1): U -> V$ --- линейное биективное отображение.
]
