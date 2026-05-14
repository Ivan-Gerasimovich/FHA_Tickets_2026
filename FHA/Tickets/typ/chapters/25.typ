#import "../conf.typ": *

= Скалярное произведение векторов в линейном пространстве. Примеры. Квадратичная форма. Положительно определённая квадратичная форма. Критерий Сильвестра.

#definition[
  Пусть $V$ --- линейное пространство над $RR$. \
  Скалярным произведением векторов в линейном пространстве $V$ наз-ся отображение:
  $ (dot, dot): V times V -> RR, $
  при этом:
  $1^circle. quad &forall x in V quad forall y in V quad (x, y) = (y, x)$ \
  $2^circle. quad &forall lambda in RR quad forall x in V quad forall y in V quad (lambda x, y) = lambda(x, y)$ \
  $3^circle. quad &forall x in V quad forall y in V quad forall z in V quad (x+y, z) = (x, z) + (y, z)$ \
  $4^circle. quad &forall x in V quad (x, x) >= 0 and [(x, x) = 0 <=> x = 0_V]$
]

#remark[
  Свойства $2^circle$ и $3^circle$ --- свойство линейности по 1-му аргументу.
]

== Примеры:

1) Обычное скалярное произведение в $V_2$ или $V_3$ удовлетворяет $1^circle - 4^circle$ (стандартное скалярн. произв.).

2) $RR^n$, $forall x in RR^n quad forall y in RR^n quad (x, y) = x_1 y_1 + x_2 y_2 + ... + x_n y_n = sum_(i=1)^n x_i y_i = x^T y$. \
Проверим выполнимость аксиом $1^circle - 4^circle$.

Рассмотрим $A in RR^(n times n)$. Определим для любого $forall x in RR^n quad forall y in RR^n$:
#math.equation(block:true, numbering: _ => "(*)", $ (x, y) = sum_(i=1)^n sum_(j=1)^n a_(i j) x_i y_j = x^T dot A dot y $) <scalar-star>

Аксиомы $2^circle$ и $3^circle$ выполнены при любой матрице $A$.

$ (x, y) = (y, x) $
$ x = (0 ... 0 1 0 ... 0)^T in RR^n $
$ y = (0 ... 0 1 0 ... 0)^T in RR^n $
$ (x, y) = a_(i j) quad (y, x) = a_(j i) $

Аксиома $1^circle$ выполнена $<=> A$ --- симметричная.

$ (x, x) = sum_(i=1)^n sum_(j=1)^n a_(i j) x_i x_j >= 0 and [(x, x) = 0 <=> x = 0_(RR^n)] $

#definition[
  Выражение $Q(x_1, x_2, ..., x_n) = sum_(i=1)^n sum_(j=1)^n a_(i j) x_i x_j$ наз-ся квадратичной формой, соответствующей матрице $A$.
]

#definition[
  Квадратичная форма $Q(x_1, x_2, ..., x_n)$ и матрица $A$ наз-ся положительно определёнными, если 
  $ forall X = (x_1, x_2, ..., x_n)^T in RR^n \\ {0_(RR^n)} -> Q(x_1, x_2, ..., x_n) > 0 $
]

Аксиома $4^circle$ выполнена $<=>$ матрица $A$ положительно определённая.

#property(title: "Утверждение")[
  Формула @scalar-star определяет скалярное произведение на $RR^n <=> $ матрица $A$ симметричная и положительно определённая.
]

Рассматривается пространство $RR^n$

$ (x, y) = x^T dot A dot y quad "--- скалярное произведение" <=> A = A^T " ("A" --- симметричная) " \ "и положительно определённая " [forall X in RR^n \\ {0} quad X^T A X > 0]. $

#theorem(title: "Критерий Сильвестра")[
  Пусть $A in RR^(n times n)$ --- симметрическая матрица. Тогда матрица $A$ положительно определённая $<=>$ все её угловые миноры $> 0$.

  $ A = mat(
    a_11, a_12, a_13, ..., a_(1 n);
    a_21, a_22, a_23, ..., a_(2 n);
    a_31, a_32, a_33, ..., a_(3 n);
    dots.v, dots.v, dots.v, dots.down, dots.v;
    a_(n 1), a_(n 2), a_(n 3), ..., a_(n n)
  ) $

  $ a_11 > 0; quad 
    mat(delim: "|", a_11, a_12; a_21, a_22) > 0; quad 
    mat(delim: "|", a_11, a_12, a_13; a_21, a_22, a_23; a_31, a_32, a_33) > 0; quad 
    dots ; quad 
    |A| > 0 $
]

доказательство?
