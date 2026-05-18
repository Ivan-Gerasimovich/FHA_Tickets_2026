#import "../conf.typ": *

= Основная теорема о порядках систем векторов.

#theorem[
  Пусть $e_1, e_2, ..., e_n$ --- векторы простр. $V$. \
  Пусть каждый из векторов $x_1, x_2, ..., x_k$ линейно выражается через векторы $e_1, e_2, ..., e_n$. \
  Если $x_1, x_2, ..., x_k$ --- линейно независимы, то $k <= n$.
]

#proof[
  По индукции по $n$.

  1) *$underline("База индукции")$:* Пусть *$n = 1$*. \

  Рассмотрим вектор $e_1$. Тогда $x_1 = alpha_1 e_1, x_2 = alpha_2 e_1, ..., x_k = alpha_k e_1$.

  Утверждается, что для $forall i in {1, 2, ..., k} quad alpha_i != 0$. \
  (Предположим $alpha_i = 0 " " -> " "x_i = alpha_i e_1 = 0_V -> x_1, x_2, ..., x_i, ..., x_k ->$ линейно зависимая система (т.к. содержит $0_V$) $->$ противоречие с тем, что система линейно независима $-> alpha_i != 0$).

 * $underline("Покажем, что" k = 1)$* \
  От противного. Допустим $k >= 2$. Тогда:
  
  $ e_1 = 1 / alpha_1 x_1, quad e_1 = 1 / alpha_2 x_2 $
  
  (где $alpha_1 != 0, alpha_2 != 0$).
  
  $ 1 / alpha_1 x_1 = 1 / alpha_2 x_2 => underbrace(overbracket(1 / alpha_1, !=0) x_1 + overbracket((- 1 / alpha_2), !=0)x_2, "нетривиальная")   = 0_V <-> x_1 text(" и ") x_2 text(" линейно завис.") -> $

  
  $ -> x_1, x_2, ..., x_k text(" --- линейно завис. (т.к. содержит линейно зависимую подсистему)") -> $
  получили противоречие $-> k >= 2$ --- неверно $-> k=1$.

  2) *$underline("Пусть" n >= 2)$* \
  *Индуктивное предположение.* Если $k'$ $<=$ $k$ линейно независимых векторов линейно выражаются через векторы $e_1, e_2, ..., e_(n-1)$, то $k' <= n-1$.

  Рассмотрим линейно независимую систему векторов $x_1, x_2, ..., x_k$ такую, что:
  $ 
    x_1 &= alpha_(11) e_1 + alpha_(12) e_2 + ... + alpha_(1(n-1)) e_(n-1) + alpha_(1n) e_n \
    x_2 &= alpha_(21) e_1 + alpha_(22) e_2 + ... + alpha_(2(n-1)) e_(n-1) + alpha_(2n) e_n \
    &dots.v \
    x_k &= alpha_(k 1) e_1 + alpha_(k 2) e_2 + ... + alpha_(k(n-1)) e_(n-1) + overbracket(alpha_(k n), !=0) e_n 
  $

  $underline("Покажем, что" k <= n)$ \
  Если $alpha_(1n) = alpha_(2n) = ... = alpha_(k n) = 0$, то линейно независ. векторы $x_1, x_2, ..., x_k$ линейно выражаются через векторы $e_1, e_2, ..., e_(n-1)$ и по индуктивному предположению $k <= n-1 -> k <= n$.

  Пусть $alpha_(k n) != 0$. Тогда $exists alpha_(k n)^(-1)$ --- обратный. \
  Тогда (подставим во все равенства кроме последнего):
  $ e_n = 1 / alpha_(k n) x_k - alpha_(k 1) / alpha_(k n) e_1 - alpha_(k 2) / alpha_(k n) e_2 - ... - alpha_(k(n-1)) / alpha_(k n) e_(n-1) $

  $forall i in {1, 2, ..., k-1}$:
  $ x_i = alpha_(i 1) e_1 + alpha_(i 2) e_2 + ... + alpha_(i(n-1)) e_(n-1) + alpha_(i n) underbrace((1 / alpha_(k n) x_k - alpha_(k 1) / alpha_(k n) e_1 - ... - alpha_(k(n-1)) / alpha_(k n) e_(n-1)), e_n) $
  
  $ x_i - alpha_(i n) / alpha_(k n) x_k = (alpha_(i 1) - alpha_(i n) alpha_(k 1) / alpha_(k n)) e_1 + ... + (alpha_(i(n-1)) - alpha_(i n) alpha_(k(n-1)) / alpha_(k n)) e_(n-1) $

  Векторы \
  
   $underbrace((x_1 - alpha_(1 n) / alpha_(k n) x_k, quad x_2 - alpha_(2 n) / alpha_(k n) x_k, quad ..., quad x_(k-1) - alpha_((k-1) n) / alpha_(k n) x_k), "линейно независимые k-1  векторов")$ - \ 

   "-" линейно выражаются через векторы $e_1, e_2, ..., e_(n-1)$. \

  Остается показать, что они линейно независимы. \
  $underline("По индукт. предполож.")$ $k-1 <= n-1 -> k <= n ->$ доказали K $<=$ n.

  $ overbrace(lambda_1, =0) (x_1 - alpha_(1 n) / alpha_(k n) x_k) + overbrace(lambda_2, =0) (x_2 - alpha_(2 n) / alpha_(k n) x_k) + ... + overbrace(lambda_(k-1), =0) (x_(k-1) - alpha_((k-1) n) / alpha_(k n) x_k) = 0_V $

$ underbrace(
  lambda_1 x_1 + lambda_2 x_2 + dots + lambda_(k-1) x_(k-1) + (- sum_(i=1)^(k-1) (lambda_i alpha_(i n)) / alpha_(k n)) x_k, 
  #stack(
    dir: ttb, 
    spacing: 0.5em,
    [лин. комб. $x_1, x_2, dots, x_k$], 
    [лин. независимы $arrow.r$]
  )
) = 0_V $

  Т.к. $x_1, x_2, ..., x_k$ линейно независимы, то $lambda_1 = lambda_2 = ... = lambda_(k-1) = 0$.
]
