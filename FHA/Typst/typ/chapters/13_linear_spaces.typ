#import "../conf.typ": *

= Линейное пространство над полем

Пусть $P$ — произвольное поле, $alpha, beta, gamma, alpha_1, ..., alpha_n in P$ — элементы поля (скаляры).

Пусть $V$ — непустое множество; его элементы $a, b, c, ..., x, y, z, a_1, ..., a_n$ называем *векторами*.

На $V$ заданы две операции:
- сложение $quad (a, b) |-> a + b in V$;
- умножение на скаляр $quad (lambda, a) |-> lambda dot a in V, space lambda in P$.

#definition[
  Множество $V$ со сложением и умножением на элементы поля $P$ называется
  *линейным пространством над полем $P$*, если выполнены следующие аксиомы.
] <def:linear-space>

#axiom[ $(V, +)$ — абелева группа. ] <ax:1>

#axiom[
  $forall a in V: quad 1 dot a = a$ #h(1em) (аксиома унитарности).
] <ax:2>

#axiom[
  $forall alpha, beta in P, space forall a in V: quad (alpha beta) dot a = alpha dot (beta dot a)$.
] <ax:3>

#axiom[
  $forall alpha, beta in P, space forall a in V: quad (alpha + beta) dot a = alpha dot a + beta dot a$.
] <ax:4>

#axiom[
  $forall alpha in P, space forall a, b in V: quad alpha dot (a + b) = alpha dot a + alpha dot b$.
] <ax:5>

== Примеры

+ Множество $V_2$ геометрических векторов на плоскости с обычным сложением и умножением на действительное число — линейное пространство над $RR$.
+ Множество $V_3$ геометрических векторов трёхмерного пространства — линейное пространство над $RR$.
+ Множество матриц $P^(m times n)$ с элементами из поля $P$ — линейное пространство над $P$.
+ Множество столбцов $P^m$ высоты $m$ над полем $P$ — линейное пространство над $P$.

== Свойства линейного пространства

#property[
  В пространстве $V$ существует единственный нулевой вектор $bold(0)_V$ (нейтральный элемент по сложению).
] <prop:1>

#property[
  Для каждого вектора $a in V$ существует единственный противоположный элемент $-a in V$.
] <prop:2>

#property[
  $forall a in V: quad 0 dot a = bold(0)_V$, где $0 in P$.
] <prop:3>

#proof[
  По @ax:2 имеем $a = 1 dot a$. Тогда:

  $ 0 dot a &= 0 dot a + bold(0)_V 
         \ &= 0 dot a + (a + (-a)) 
         \ &= (0 dot a + 1 dot a) + (-a) 
         \ &attach(=, t: #text(size: 8pt)[@ax:4]) (0 + 1) dot a + (-a) 
         \ &= 1 dot a + (-a) 
         \ &= a + (-a) = bold(0)_V. $
]

#property[
  $forall a in V: quad (-1) dot a = -a$.
] <prop:4>

#proof[
  Рассмотрим сумму:

  $ a + (-1) dot a &attach(=, t: #text(size: 8pt)[@ax:2]) 1 dot a + (-1) dot a 
                \ &attach(=, t: #text(size: 8pt)[@ax:4]) (1 + (-1)) dot a 
                \ &= 0 dot a attach(=, t: #text(size: 8pt)[@prop:3]) bold(0)_V. $

  Значит, $(-1) dot a$ — противоположный к $a$. В силу единственности (@prop:2) получаем $(-1) dot a = -a$.
]

#property[
  $forall alpha in P: quad alpha dot bold(0)_V = bold(0)_V$.
] <prop:5>

#proof[
  Возьмём любой $a in V$, тогда $bold(0)_V = a + (-a)$:

  $ alpha dot bold(0)_V &= alpha dot (a + (-a)) 
                     \ &attach(=, t: #text(size: 8pt)[@ax:5]) alpha dot a + alpha dot (-a) 
                     \ &attach(=, t: #text(size: 8pt)[@prop:4]) alpha dot a + alpha dot ((-1) dot a) 
                     \ &attach(=, t: #text(size: 8pt)[@ax:3]) alpha dot a + (-alpha) dot a 
                     \ &attach(=, t: #text(size: 8pt)[@ax:4]) (alpha + (-alpha)) dot a 
                     \ &= 0 dot a attach(=, t: #text(size: 8pt)[@prop:3]) bold(0)_V. $
]
#property[
  Пусть вектор $a in V$ $alpha in P$ такие что $alpha*a=0_V$ Тогда\
  a)$alpha cancel(=,stroke:#(paint:blue.transparentize(60%),thickness: 2pt))0 => a=0_V$\
  б)$a cancel(=,stroke:#(paint:blue.transparentize(60%),thickness: 2pt)) 0_V => alpha=0$

] <prop:6>
#proof[
  a) Пусть $alpha cancel(=,stroke:#(paint:blue.transparentize(60%),thickness: 2pt))0#h(1em) и #h(1em) alpha*a =0_V|*alpha^(-1)$ тогда в поле P $exists$ обратный элемент к $alpha #h(1em) alpha^(-1) in P $ \
  $ alpha^(-1) *(underbrace(alpha*a,3^0))=alpha^(-1)*0_V$\
  ($underbrace(alpha^(-1) * alpha,1))*a=0_V $\
   $underbrace(1*alpha,2^0) = 0_V $\
   $alpha=0_V$
]

#text([Пусть V - линейное пространство над полем P рассмотрим систему векторов $a_1,a_2 ... a_k in V$],size:16pt)

#definition([
  Линейной Комбинацией векторов $a_1, a_2..a_k$ с коэфициентами  $lambda_1, lambda_2..lambda_k$ из поля P называется вектор вида $lambda_1*a_1 +lambda_2*a_2 + ...lambda_k*a_k in V$
]

) <df:linear_combination>
#text([Если $lambda_1=lambda_2=lambda_k=0in P$, то линейная комбинация называется *тривиальной*, иначе *нетривиальной* ],size:16pt)
#v(1em)
#v(1em)
#text([Если вектор $b in V$ такой что вектор $b=lambda_1*a+lambda_2*a_2+...lambda_k*a_k$ то говорят что вектор b *линейно выражается через векторы $a_1,a_2..a_k$*



],size:16pt)
#definition([
  Система векторов $a_1,a_2..a_k$ называется *линейно зависимой* если существуют элементы поля P $lambda_1,lambda_2...lambda_k$ *не все равные нулю* и такие что\
  $lambda_1*a_1+lambda_2*a_2+...lambda_k*a_k=0_V$
]
)<def:dependency>
#v(1em)
#v(1em)
#text([Система векторов не являющихся линейно зависимой является линейно *независимой*],size:16pt)
#v(1em)

#text([Система векторов $a_1,a_2..a_k$ является линейно независимой$<->$ @def:dependency верно, то есть при нулевых коэффициентах],size:16pt)
#v(1em)
#theorem(
  [
    Система векторов $a_1,a_2...a_k$ содержащая нулевой вектор-- *линейно зависима*
  ]
)
#proof(
  [
    Без ограничения общности можно предположить что вектор $a_1$ нулевой\
    $underbrace(lambda_1*a_1,0_V)+underbrace(0*a_2,0_V)+...underbrace(0*a_k,0_V)=0_V$ #h(1pt) ($a_1=0_v, lambda_1 !=0_V$)
  ]
)

#theorem(
  [
    Если какая либо подсистема систем векторов $a_1,a_2...a_k$ линейно *зависима* то и вся система линейно *зависима*
  ]
)
#proof([
  Пусть $ #box(stroke: black + 1pt, inset: 4pt)[$a_1$, $a_2$, $a_l$],a_(l+1),a_(l+2)...a_k $\

 Тогда найдуться элементы $alpha_1, alpha_2, alpha_l$ поля P не все равные 0 такие что $alpha_1 a_1 + alpha_2 a_2 + alpha_l * a_l = 0_V$ Дополним левую часть
 $alpha_1 a_1 + alpha_2 a_2 + alpha_l * a_l +0 a_l+1 + 0 alpha_l+2 + 0 alpha_k = 0_V$ По определению векторы $a_1,a_2,a_k$ линейно *зависимы*
])
#corollary(
  [
  Если вся система векторов линейно *независима* то и её подсистемы линейно *независимы*
  ]
)
#theorem([
  (*Критерий линейной зависимости*)\
  Система Векторов $a_1,a_2...a_k$ линейно *зависима* $<=>$ хотя бы один её вектор линейно выражается через остальные векторы
])
#proof([
  Пусть $a_1,a_2,a_k$ линейно *зависимы*. Тогда  $exists #h(1em)alpha_1,alpha_2,alpha_k in P$ не все нулевые. Пусть $alpha_i!=0_V$ такие что $alpha_1 a_1 + alpha_2 a_2 + #box(stroke: black + 0.5pt, inset: (x: 2pt, y: 3pt))[$alpha_i a_i$] + alpha_k a_k = 0_V$\
  $#box(stroke: black + 0.5pt, radius: 70%, inset: 4pt)[$a_i$]$ =$(-alpha_1 alpha_i^(-1))*#box(stroke: black + 0.5pt, radius: 70%, inset: 4pt)[$a_1$] +(-alpha_2 alpha_i^(-1))*#box(stroke: black + 0.5pt, radius: 70%, inset: 4pt)[$a_2$]+(-alpha_k alpha_i^(-1))*#box(stroke: black + 0.5pt, radius: 70%, inset: 4pt)[$a_k$]
  $\
  Пусть $a_1 = alpha_2 a_2 + alpha_3 a_3 + alpha_k a_k$\
  $-1 a_1 + alpha_2 a_2 + alpha_3 a_3 + alpha_k a_k = 0_V$ Это *нетривиальная* линейная комбинация. Значит $a_1,a_2,a_k $линейно *зависимы*
  
])

== Примеры
#text([
  1) $V_2$ -пространство геометрических векторов на плоскости\
  а)один из геометрических векторов линейно зависимый $=>$ он нулевой
  б)два геометрических вектора линейно зависимы $<=> $ они коллинеарны\
  в) 3 и более геометрических вектора линейно зависимы\
  2) $V_3$ -- пространство геометрических векторов трёхмерного пространства\
  a)один геометрический вектор линейно зависимый $<=>$ он нулевой \
  б) 2 геометрических вектора линейно зависимы $<=>$ они коллинеарны\
  в) 3 геометрических вектора образуют линейную *зависимость* $<=>$ они *компланарны*\
  г) 4 и более геометрических вектора  линейно зависимы\
  3) $attach("P",tr:m)$ рассмотрим m столбцов высоты m\
  /*
   $e_1= (1,0,0..0)^T$\,
  $e_2= (0,1,0..0)^T$\,
  $e_3= (0,0,1..0)^T$\,
  $e_m= (0,0,0..m)^T$\
  
  */
  $ "Линейно независимая система векторов" cases(
  e_1 =(1,0,0..0)^T,
  e_2= (0,1,0..0)^T,
  e_3= (0,0,1..0)^T,
  e_m= (0,0,0..m)^T
) $\
$alpha_1*vec(1,0,0,..,0) +alpha_2 *vec(0,1,0,..,0) + alpha_m*vec(0,0,0,..,1) = vec(0,0,0,..,0)$
#v(1em)
$vec(alpha_1,alpha_2,alpha_3,..,alpha_m) = vec(0,0,0,..,0) => alpha_1=0,alpha_2=0,alpha_3=0,alpha_m=0=>"линейная независимость"$
],size:14pt)
//$ #box(stroke: black + 0.5pt, inset: (x: 2pt, y: 0pt))[a] + b = c $