#import "../conf.typ": *

= Связь между матрицами линейного оператора в разных базисах. Подобные матрицы и их свойства.
 \
Пусть $V$ — линейное пространство над $P$.
- $e_1, e_2, ..., e_n$ — базис пространства $V$
- $e'_1, e'_2, ..., e'_n$ — базис пространства $V$
- $f in "Hom"(V)$ — линейный оператор
- $A$ — матрица оператора $f$ в базисе $e_1, e_2, ..., e_n$
- $A'$ — матрица оператора $f$ в базисе $e'_1, e'_2, ..., e'_n$
- $T$ — матрица перехода от $e_1, e_2, ..., e_n$ к $e'_1, e'_2, ..., e'_n$

$x in V, alpha = (alpha_1, alpha_2, ..., alpha_n)^T$ — координатный столбец вектора $x$ в базисе $e_1, e_2, ..., e_n$. \
$alpha' = (alpha'_1, alpha'_2, ..., alpha'_n)^T$ — координатный столбец вектора $x$ в базисе $e'_1, e'_2, ..., e'_n$. \
$f(x) in V, beta = (beta_1, beta_2, ..., beta_n)^T$ — координатный столбец вектора $f(x)$ в базисе $e_1, e_2, ..., e_n$. \
$beta' = (beta'_1, beta'_2, ..., beta'_n)^T$ — координатный столбец вектора $f(x)$ в базисе $e'_1, e'_2, ..., e'_n$.

Тогда:
$ alpha = T dot alpha' | dot A => underbrace(A alpha, beta) = A dot T dot alpha^'  $
$ beta = T dot beta' $

$ beta = A dot alpha $
$ beta' = A' dot alpha' $

Выведем связь между матрицами:
$ A dot alpha = A dot T dot alpha' $
$ underbrace(beta, T dot beta^') = A dot T dot alpha' $
$ T dot beta' = A dot T dot alpha' quad | dot T^(-1) $
$ underbrace(beta', A^' dot alpha^') = T^(-1) dot A dot T dot alpha' $
$ A' dot alpha' = T^(-1) dot A dot T dot alpha' quad forall alpha' in P^n $

Пусть поочередно координатный столбец принимает значения:
$ alpha'_1 = (1, 0, dots, 0)^T, quad dots, quad alpha'_n = (0, 0, dots, 1)^T $

Тогда:
$ A'_1 = (T^(-1) dot A dot T)_1, quad ... , quad A'_n = (T^(-1) dot A dot T)_n => $\ 
#set align(center)
#rect(stroke: 1.5pt + rgb("2196F3"), inset: 10pt)[$A' = T^(-1) dot A dot T$] 
#set align(left)

#definition[
  Матрица $B in P^(n,n)$ *подобна* матрице $A in P^(n,n)$, если найдется обратимая матрица $T in P^(n,n)$ такая, что:
  $ B = T^(-1) dot A dot T $
]

== Свойства подобных матриц

#property[
  1. Любая матрица $A in P^(n,n)$ подобна $A$.
  $A = E_n^(-1) dot A dot E_n$
]

#property[
   Если $A in P^(n,n)$ подобна $B in P^(n,n)$, то $B$ подобна $A$.
]
#proof[
    $ A = T^(-1) dot B dot T | dot T   \ T dot A = B dot T | dot T^(-1) $
    $ T dot A dot T^(-1) = B $
    Отсюда:
    $ B = (T^(-1))^(-1) dot A dot T^(-1) $
    Обозначим $S = T^(-1)$, тогда:
    $ B = S^(-1) dot A dot S $
  ]

#property[
  3. Если $A in P^(n,n)$ подобна $B in P^(n,n)$, а $B$ подобна $C in P^(n,n)$, то $A$ подобна $C$.
]

#proof[ \
    $A = T^(-1) dot B dot T$, $B = S^(-1) dot C dot S$. \
    Положим $Q = S dot T$. Тогда:
    $ Q^(-1) dot C dot Q = underbrace((S dot T)^(-1), T^(-1) dot S ^ (-1)) dot C dot (S dot T) = T^(-1) dot (S^(-1) dot C dot S) dot T = T^(-1) dot B dot T = A $
    Следовательно, $A = Q^(-1) dot C dot Q$.
  ]

#property[
  4. Определители подобных матриц равны.
]
  #proof[
    Пусть $A, B in P^(n,n)$ и $A ~ B <=> exists T (|T| != 0 and B = T^(-1) A T)$. \
    Тогда:
    $ |B| = |T^(-1) dot A dot T| $
    Так как $|X dot Y| = |X| dot |Y|$:
    $ |B| = |T^(-1)| dot |A| dot |T| $
    Так как $|T^(-1)| = 1 / (|T|)$:
    $ |B| = 1 / (|T|) dot |A| dot |T| $
    Следовательно:
    $ |B| = |A| $
  ]
