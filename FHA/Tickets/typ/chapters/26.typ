#import "../conf.typ": *

= Скалярное произведение векторов в линейном пространстве. Длина вектора. Неравенство Коши-Буняковского-Шварца. Угол между векторами линейного пространства.

#definition[
  Пусть $V$ — линейное пространство над $RR$.
  Скалярным произведением векторов в линейном пространстве $V$ наз-ся отображение:
  $ (dot, dot): V times V -> RR, $
  при этом:
  
  $1^circle.$ $forall x in V quad forall y in V quad (x, y) = (y, x)$
  
  $2^circle.$ $forall lambda in RR quad forall x in V quad forall y in V quad (lambda x, y) = lambda(x, y)$
  
  $3^circle.$ $forall x in V quad forall y in V quad forall z in V quad (x+y, z) = (x, z) + (y, z)$ \
  *(свойство линейности по 1-му аргументу для п. 2 и 3)*
  
  $4^circle.$ $forall x in V quad (x, x) >= 0 and [(x, x) = 0 <=> x = 0_V]$
]
\

Пусть $V$ — евклидово пространство, то есть линейное пр-во над полем действительных чисел $RR$ со скалярным произведением.

#definition[
  *Длиной вектора* $x in V$ наз-ся число *$|x| = sqrt((x, x))$*.
]

#theorem(title: "Коши-Буняковского")[
  Для любых векторов $x in V, y in V$
  $ (x, y) <= |x| dot |y| $
]

#proof[
  Рассмотрим специальный вектор $x - t y in V$, где $t in RR$. \
  По аксиоме 4 скалярного произведения $(x - t y, x - t y) >= 0$.

  $ underbrace((x, x) - 2t(x, y) + t^2(y, y), f(t)) >= 0 quad forall t in RR $

  $ D = 4(x, y)^2 - 4 dot (y, y) dot (x, x) <= 0 $

  $ (x, y)^2 <= (y, y) dot (x, x) $

  $ (x, y) <= underbrace(sqrt((y, y)), |y|) dot underbrace(sqrt((x, x)), |x|) $
]

#corollary[
  Для любых ненулевых векторов $x in V, y in V$
  $ -1 <= (x, y) / (|x| dot |y|) <= 1. $
]

#proof[
  1) $(x, y) <= |x| dot |y| quad | : (overbrace(|x|, >= 0) dot overbrace(|y|, >=0))$ \
     $ (x, y) / (|x| dot |y|) <= 1. $

  2) $(-x, y) <= underbrace(|-x|, "док-ть! " |x|) dot |y| $ \

     $-1 dot (x, y) <= |x| dot |y| quad | : underbrace((-|x| dot |y|), < 0) $
     $ (x, y) / (|x| dot |y|) >= -1 $
]

// TODo: доказать |-x|


#definition[
  *Углом* между ненулевыми векторами $x in V, y in V$ наз-ся число $phi in [0; pi]$ такое, что:
  *$ cos phi = (x, y) / (|x| dot |y|) $*
]

#definition[
  Векторы $x in V, y in V$ наз-ся *ортогональными*, если $(x, y) = 0$.
]


// TODO: расстояние? ортонормированный базис?
