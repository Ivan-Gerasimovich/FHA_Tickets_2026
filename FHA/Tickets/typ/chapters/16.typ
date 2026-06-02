#import "../conf.typ": *

= Линейное пространство над полем $P$ и его свойства.
\
Пусть $P$ — произвольное поле. \
$alpha, beta, ..., omega, alpha_1, alpha_2, ..., alpha_n$ — элементы поля $P$ (скаляры).

Пусть $V$ — непустое множество. \
$a, b, c, ..., x, y, z, a_1, a_2, ..., a_n, ...$ — элементы множ. $V$ (векторы).

Пусть на множ. $V$ задана бинарная алгебраическая операция $underline("сложения")$:
$ (underbrace(a, in V), underbrace(b, in V)) -> a + b in V $
$ lambda in P, a in V -> lambda a in V $

#definition[
   Мн-во $V$ со сложением и умножением на элементы поля $P$, называется *линейным пространством над полем* $P$, если выполнены следующие условия (аксиомы):

  1$degree.$ $(V, +)$ — абелева группа \
  
  2$degree.$ $forall a in V quad 1 dot a = a"  "$ (1 - нейтральный элемент по умнож.)\

  3$degree.$ $forall alpha in P " " forall beta in P " "forall a in V quad (alpha dot beta) dot a = alpha(beta a)$ \

  4$degree.$ $forall alpha in P " " forall beta in P " "forall a in V quad (alpha + beta)a = alpha a + beta a$ \

  5$degree.$ $forall alpha in P " " forall a in V  " "forall b in V quad alpha(a + b) = alpha a + alpha b$
]

// TODO: примеры линейного пространства (1-4)

== Свойства линейного пространства $V$ над полем $P$

#property[
  В пр-ве $V$ есть единственный нулевой вектор $0_V$ (нейтр. эл. множ-ва $V$ по сложению).
]

#property[
  Для каждого вектора $a in V$ существует единственный противоположный вектор $-a in V$.
]

#property[
  $forall a in V quad underbrace(0, (in "" P)) dot a = 0_V$
]

#proof[
  $ 0 dot a = 0 dot a + overbrace(0_V, a + (-a)) = 0 dot a + (a + (-a)) = (0 dot a + overbrace(1 dot a, a)) + (-a) = \ 
  = (0 + 1) dot a + (-a) = 1 dot a + (-a) = a + (-a) = 0_V $
]

#property[
  $forall a in V quad -1 dot a = -a$
]

#proof[
  $ overbrace(a, 1 dot a) + (-1) dot a = 1 dot a + (-1) dot a = (1 + (-1)) dot a = 0 dot a = 0_V $
]

#property[
  $forall alpha in P quad alpha dot 0_V = 0_V$
]

#proof[
  $ alpha dot 0_V = alpha(overbrace(a, 1 dot a) + overbrace((-a), (-1) dot a)) = alpha (1 dot a + (-1) dot a) = alpha((1 + (-1)) dot a) = \ 
  = alpha(underbrace(0, beta) dot a) limits(=)^"акс. 3" [alpha * (beta  a) = (alpha beta) * a] = 0 dot a = 0_V $
]

#property[
  Пусть $a in V, alpha in P$ такие, что $alpha a = 0_V$. Тогда \
  а) $alpha != 0 => a = 0_V$ \
  б) $a != 0_V => alpha = 0$
]

#proof[
  а) Пусть $alpha != 0$, $alpha a = 0_V$. \
  Тогда в поле $P$ существует $alpha^(-1) in P$ ($alpha dot alpha^(-1) = alpha^(-1) alpha = 1$).
  
  $ alpha^(-1) (alpha a) = alpha^(-1) dot 0_V \
    (alpha^(-1) alpha)a = 0_V ; quad 1 dot a = 0_V => a = 0_V $
]
