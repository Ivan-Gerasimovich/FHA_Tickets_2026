#import "../conf.typ": *

= Необходимые и достаточные условия для того, чтобы кольцо $ZZ_n$ было полем.

#theorem[
  Кольцо $ZZ_n$ — поле $<=> n$ — простое число.
]

#proof[
  == Достаточность

  $=> $ Пусть $ZZ_n$ — поле. Покажем, что $n$ — простое число.

  От противного. Допустим обратное:
  $ n = p dot q, quad upright("где ") 1 < p < n; quad 1 < q < n. $

  Тогда $ overline(n) = overline(p dot q). $
  $ ZZ_n = {overline(0), overline(1), overline(2), dots, overline(n-1)}; $
  $ overline(0) = overline(p dot q) $

  Если $p$ и $q$ разд. с ост. на $n =>$ то получ. $overline(p) != overline(0)$, $overline(q) != overline(0)$.

  $ overline(0) = underbrace(overline(p), != overline(0)) dot underbrace(overline(q), != overline(0)) => overline(p), overline(q) $ — делители нуля $=>$ противоречие с тем, что $ZZ_n$ — поле.

  == Необходимость

  $<= $ Пусть $n$ — простое число. Покажем, что $(ZZ_n = {overline(0), overline(1), dots, overline(n-1)}, +, dot)$ — поле, $ZZ_n$ — коммутативное кольцо.

  1) $(ZZ_n, +)$ — абелева группа, т.к. $ZZ_n$ — кольцо.
  3) Умножение в $ZZ_n$ дистрибутивно относительно сложения (т.к. $ZZ_n$ — кольцо).
  2) $(ZZ_n without {overline(0)}, dot)$ — абелева группа:
     $ 1 in ZZ_n without {overline(0)} $

  Докажем, что $forall overline(a) in ZZ_n without {overline(0)} exists overline(a)^(-1) in ZZ_n$
  $ overline(a) != overline(0) $
  $ ZZ_n = {overline(0), overline(1), overline(2), dots, overline(n-1)} $
  $ overline(a) dot overline(0), overline(a) dot overline(1), overline(a) dot overline(2), dots, overline(a) dot overline(n-1) $
  Произведения попарно различны.

  Докажем от противного:
  Пусть $overline(a) dot overline(k) = overline(a) dot overline(l)$, где $k != l$
  $ overline(a) dot (overline(k) - overline(l)) = overline(0) => a dot (k - l) dots.v n $ (т.к. к нулевому классу относятся только числа, кратные $n$, где $n$ — простое число).

  $ => underbrace(a dots.v n, overline(a) = overline(0)) or k - l dots.v n $

  При этом $k$ и $l$ — натуральные числа, $k, l in {0, 1, dots, n-1} =>$
  $ => k = l => $ противоречие с $k != l$.

  Найдется $overline(a) dot overline(b) = overline(1) => overline(b)$ — обратный элемент, и *[неразборчиво]*: $overline(b) = overline(a)^(-1)$.
]
