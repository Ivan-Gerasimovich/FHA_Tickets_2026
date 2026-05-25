#import "../conf.typ": *

= Изометрический оператор

#definition[
  Пусть $V$ — евклидово пространство (линейное пространство над $RR$ + скалярное произведение).
  
  Линейный оператор $f$, действующий в этом пространстве, называется *изометрическим*, если он сохраняет скалярное произведение:
  $ forall x in V, space y in V quad (f(x), f(y)) = (x, y) $
]

#theorem[
  Линейный оператор является изометрическим $<=>$ он сохраняет длины векторов.
]

#proof[
  *Достаточность* \
  $arrow.r$ Пусть $f$ — изометрический оператор.
  
  Тогда $forall x in V quad |f(x)| = sqrt((f(x), f(x))) = sqrt((x, x)) = |x|$.

  *Необходимость* \
  $arrow.l$ Пусть $forall x in V quad |f(x)| = |x|$.
  
  Тогда $forall x, y in V$:
  $ |f(x+y)| = |x+y| &=> sqrt((f(x+y), f(x+y))) = sqrt((x+y, x+y)) \
  &=> (f(x+y), f(x+y)) = (x+y, x+y) \
  &=> (f(x)+f(y), f(x)+f(y)) = (x+y, x+y) \
  &=> (f(x), f(x)) + 2(f(x), f(y)) + (f(y), f(y)) = (x, x) + 2(x, y) + (y, y) \
  &=> |x|^2 + 2(f(x), f(y)) + |y|^2 = |x|^2 + 2(x, y) + |y|^2 \
  &=> (f(x), f(y)) = (x, y) $
]

#corollary[
  Изометрический оператор сохраняет углы между векторами.
]

#proof[
  Пусть $f$ — изометрический оператор.
  $ angle(x, y) = phi => cos phi = (x, y) / (|x| |y|) $
  $ angle(f(x), f(y)) = phi' => cos phi' = (f(x), f(y)) / (|f(x)| |f(y)|) = (x, y) / (|x| |y|) = cos phi $
]

#corollary[
  Изометрический оператор переводит ортонормированный базис в ортонормированный базис.
]

#theorem[
  - Матрица $A$ изометрического оператора $f$ в любом ортонормированном базисе ортогональна, т. е. $A^T A = E_n$.
  - Если матрица линейного оператора ортогональна в каком-либо ортонормированном базисе, то оператор изометрический.
]

#proof[
  Пусть $e_1, e_2, ..., e_n$ — ортонормированный базис пространства $V$. \
  $f: V -> V$ — изометрический оператор. \
  $A$ — матрица оператора $f$.

  $x in V, alpha = (alpha_1 space alpha_2 space ... space alpha_n)^T$ — координаты вектора $x$. \
  $beta = (beta_1 space beta_2 space ... space beta_n)^T$ — координаты вектора $f(x)$.

  $ (x, x) &= (alpha_1 e_1 + alpha_2 e_2 + ... + alpha_n e_n, alpha_1 e_1 + alpha_2 e_2 + ... + alpha_n e_n) \
  &= alpha_1^2 underbrace((e_1, e_1), 1) + alpha_2^2 underbrace((e_2, e_2), 1) + ... + alpha_n^2 underbrace((e_n, e_n), 1) \
  &= alpha_1^2 + alpha_2^2 + ... + alpha_n^2 = alpha^T E_n alpha $

  $ (f(x), f(x)) = ... = beta^T E_n beta $

  $ alpha^T E_n alpha = beta^T E_n beta $
  Так как $beta = A alpha$ и $beta^T = alpha^T A^T$, получаем:
  $ alpha^T E_n alpha = alpha^T (A^T A) alpha quad forall alpha in RR^n $
  $ A^T A = E_n $
]

#corollary[
  Определитель матрицы изометрического оператора в ортонормированном базисе равен $plus.minus 1$.
]

#proof[
  $ |A^T A| = |E_n| $
  $ |A^T| dot |A| = 1 $
  Так как $|A^T| = |A|$, то:
  $ |A|^2 = 1 => |A| = plus.minus 1 $
]

#corollary[
  Если $lambda$ — собственное значение собственного вектора $x$ изометрического оператора, то $lambda = plus.minus 1$.
]

#proof[
  Пусть $x$ — собственный вектор ($x eq.not 0 => (x, x) eq.not 0$):
  $ (x, x) = (f(x), f(x)) = (lambda x, lambda x) = lambda^2 (x, x) $
  $ (x, x) = lambda^2 (x, x) => lambda = plus.minus 1 $
]
