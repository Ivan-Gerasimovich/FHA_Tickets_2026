#import "../conf.typ": *

= Матрица линейного оператора в базисе

Пусть $V$ — линейное пространство над полем $P$, $e_1, e_2, dots, e_n$ — базис пространства $V$, а $f: V -> V$ — линейный оператор.

Тогда $f(e_1), f(e_2), dots, f(e_n)$ — векторы пространства $V$. Разложим их по базису:


$
f(e_1) &= a_(1 1) e_1 + a_(2 1) e_2 + ... + a_(n 1) e_n \
f(e_2) &= a_(1 2) e_1 + a_(2 2) e_2 + ... + a_(n 2) e_n \
&= dots.v \
f(e_n) &= a_(1 n) e_1 + a_(2 n) e_2 + ... + a_(n n) e_n
$


#definition[
  Матрица
  $ A = mat(
    delim: "(",
    a_(1 1), a_(1 2), dots, a_(1 n);
    a_(2 1), a_(2 2), dots, a_(2 n);
    dots.v, dots.v, dots.down, dots.v;
    a_(n 1), a_(n 2), dots, a_(n n)
  ) $
  называется *матрицей линейного оператора $f$* в базисе $e_1, e_2, dots, e_n$.
]

== Связь координат прообраза и образа (разложение по базису)

Пусть $x in V$. Тогда по разложению по базису:
$ x = alpha_1 e_1 + alpha_2 e_2 + dots + alpha_n e_n, quad alpha = vec(alpha_1, alpha_2, dots, alpha_n) - "коорд. вект. " x $

Пусть $f(x) = beta_1 e_1 + beta_2 e_2 + dots + beta_n e_n$, $beta = vec(beta_1, beta_2, dots, beta_n)$ — коорд. вект. $f(x)$.

Разложим $f(x)$ по базису:
$
f(x) &= f(alpha_1 e_1 + alpha_2 e_2 + dots + alpha_n e_n) \
&= alpha_1 f(e_1) + alpha_2 f(e_2) + dots + alpha_n f(e_n) \
&= alpha_1 (a_(1 1) e_1 + a_(2 1) e_2 + dots + a_(n 1) e_n) + alpha_2 (a_(1 2) e_1 + a_(2 2) e_2 + dots + a_(n 2) e_n) + dots + \
&quad + alpha_n (a_(1 n) e_1 + a_(2 n) e_2 + dots + a_(n n) e_n) \
&= (a_(1 1) alpha_1 + a_(1 2) alpha_2 + dots + a_(1 n) alpha_n) e_1 + \
&quad + (a_(2 1) alpha_1 + a_(2 2) alpha_2 + dots + a_(2 n) alpha_n) e_2 + dots + \
&quad + (a_(n 1) alpha_1 + a_(n 2) alpha_2 + dots + a_(n n) alpha_n) e_n
$

В результате получаем систему уравнений:

#set align(center)
#rect(stroke: 1.5pt + rgb("2196F3"), inset: 10pt)[
  $
  cases(
    beta_1 = a_(1 1) alpha_1 + a_(1 2) alpha_2 + ... + a_(1 n) alpha_n,
    beta_2 = a_(2 1) alpha_1 + a_(2 2) alpha_2 + ... + a_(2 n) alpha_n,
    dots.v,
    beta_n = a_(n 1) alpha_1 + a_(n 2) alpha_2 + ... + a_(n n) alpha_n,
  )
  $
]
#set align(left)

В матричном виде связь координат записывается как:
$ beta = A dot alpha $
