#import "../conf.typ": *
= Линейная оболочка
#definition([
Пусть $x_1,x_2,..x_k$ вектор пространства V линейной оболочки векторов $x_1,x_2...x_k$ называется множество векторов lin$({x_1,x_2,x_k}) ={alpha_1 x_1+ alpha_2 x_2 + alpha_k x_k in V, alpha_i in P}$
])
#lemma([
  $"lin"({x_1,x_2,x_k}) -$ это подпространство пространства V.
])
#proof([
    1) Пусть $x in "lin"({x_1,x_2,x_k}) -> y in "lin"({x_1,x_2,x_k}) -> #h(10em)x=lambda_1 x_1 + lambda_2 x_2 + lambda_k x_k $\
    y= $nu_1 x_1 + nu_2 x_2 + nu_k x_k$\
    x+y = $(lambda_1+ nu_1) x_1 + (lambda_2 +nu_2) x_2 + (lambda_k +nu_k) x_k$\
    2) $x+y in "lin"({x_1,x_2,x_k})$\
    $lambda in P, "домножим lin на x"$\
    $lambda_x = (lambda lambda_1)x_1 + (lambda lambda_2) x_2 + (lambda lambda_k) x_k -> lambda_x in "lin"({x_1,x_2,x_k}) $
])
= Базис линейной оболочки
#lemma([
    Базисом линейной оболочки $"lin"({x_1,x_2,x_k})$ является любая максимальная по включению линейно независимая подсистема систем векторов $x_1,x_2,x_k$
])
#proof([
    Идея доказательства. Пусть $x_1,x_2,x_l$ -образуют максимальную линейно независимую подсистему системы векторов $x_1,x_2,x_k$ где $l<=k$\
    Тогда векторы $x_(l+1),x_(l+2),x_k$ линейно выражаются через первые l векторов $forall i {l+1,l+2,k}$; $x_i = sum_(j=1)^l d_(i j) x_j$ подставим вместо $x_(l+1), i=l+1$\
    Пусть $x in "lin"({x_1,x_2,x_k}) $ Тогда $x= lambda_1 x_1 + lambda_2 x_2 + lambda_l x_l + lambda_(l+1) x_(l+1)+ lambda_(l+2) x_(l+2) + lambda_k x_k$\
    $x =lambda_1 x_1 + lambda_2 x_2 + lambda_l x_l + lambda_(l+1) *sum_(j=1)^l alpha_((l+1)*j) x_j +lambda_(l+2) *sum_(j=1)^l alpha_((l+2)*j) x_i +lambda_k *sum_(j=1)^l alpha_(k j) x_j$
])