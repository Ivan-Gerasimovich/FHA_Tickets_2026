#import "../conf.typ": *
= § Векторное произведение
*Вектора трехмерного пространства*

#definition(title:[Векторное произведение])[
  Векторным произведением векторов $a$ и $b$ называется вектор $c$, который обозначается $[a,b]$ и удовлетворяет следующим условиям:
  
  $a=0 or b=0 => c=0$

  если $a != 0$ $and$ $b != 0$, то:
  + $|c| = |a| dot |b| dot sin phi.alt$, где $phi.alt$ - угол между векторами $a$ и $b$
  + $c$ ортогонален $a, b$
  + $(a,b,c)$ — правая тройка (наблюдателю из $c$)
]

#remark[
  Если векторы $a$ и $b$ коллинеарные, то их векторное произведение $[a,b]=0$.
]

#proof[
  Пусть $a=0 or b=0$. Тогда, по определению, $[a,b]=0$.
  Пусть $a != 0, b != 0$ — коллинеарные векторы.
  После отложения $a$ и $b$ от одной точки возможны 2 случая:


*Случай 1:*  $phi.alt = pi$ рад.
#figure(image("../../assets/images/01_collinear_opp.svg", width: 40%), caption: [Коллинеарные разнонаправленные векторы $a$ и $b$]) <fig-01_collinear_opp>
  $ |[a,b]| = |a| dot |b| dot underbrace(sin phi.alt, 0) = 0 => [a,b] = 0 $

*Случай 2:* $phi.alt = 0$ рад.
#figure(image("../../assets/images/02_collinear_same.svg", width: 40%), caption: [Векторы $a$ и $b$ направлены в одну сторону]) <fig-02_collinear_same>
  Нулевым является только нулевой вектор $=> [a,b] = 0$. 

  Пусть $a, b$ - неколлинеарные векторы. Отложим от одной точки: \

#figure(
  image("../../assets/images/03_parallelogram.svg", width: 50%),
  caption: [Параллелограмм, построенный на векторах $a$ и $b$, площадь $S$, угол $phi.alt$],
) <fig-03_parallelogram>

  $ S = |a| dot |b| dot sin phi.alt = |[a,b]| $

  Векторы $[a,b]$ и $[b,a]$ — коллинеарные? и противоположно направленные.
  $ |[a,b]| = S = |[b,a]| $
  * $ => [a,b] = -[b,a] $ * ] 

  _в) Идея доказательства_\
  Пусть $lambda = 0$ или $a, b$ - коллинеарные. Тогда $lambda a, b$ - коллинеарные векторы и $[lambda a,b] = 0$.
  $ underbrace(lambda[a,b], "0 или 0") = 0 => [lambda a,b] = lambda [a,b] $

  Пусть $lambda != 0$ и $a, b$ - неколлинеарные векторы. \
  *Случай 1.* Пусть $lambda > 0$ \
  
#figure(image("../../assets/images/04_scaling_pos.svg", width: 40%), caption: [Векторы $a, b, lambda a$.]) <fig-04_scaling_pos>
 \
  $[lambda a,b]$ и $lambda [a,b]$ — коллинеарные, сонаправленные. 
  $ |[lambda a, b]| = underbrace(|lambda a|, lambda |a|) dot |b| dot sin phi.alt = lambda |a| dot |b| dot sin phi.alt = lambda underbrace(|a| dot |b| dot sin phi.alt, |[a,b]|) = lambda |[a,b]| = |lambda [a,b]| $
 $ => [lambda a, b] = lambda[a,b] $.

  *Случай 2.* Пусть $lambda < 0$. \
 // bad figure 
#figure(image("../../assets/images/05_scaling_neg.svg", width: 40%), caption: [Векторы $a, b$, угол $phi.alt$. Вектор $lambda a$ направлен в противоположную сторону, угол $pi - phi.alt$.]) <fig-04_scaling_pos>

 \
  $[lambda a, b]$ и $lambda [a,b]$ — коллинеарные и сонаправленные.
  $ |[lambda a, b]| = underbrace(|lambda a|, |lambda| dot |a|) dot |b| dot underbrace(sin(pi - phi.alt), sin phi.alt) = |lambda| dot underbrace(|a| dot |b| dot sin phi.alt, |[a,b]|) = |lambda| dot |[a,b]| = |lambda dot [a,b]| $

  * $ [lambda a, b] = lambda [a,b] $ * 

#remark(title: [(О геометрической интерпретации векторного произведения)])[
  Длина векторного произведения неколлинеарных векторов $a$ и $b$ равна площади параллелограмма, построенного на векторах $a$ и $b$, отложенных от одной точки.
  
#figure(
  image("../../assets/images/06_cross_product_detailed.svg", width: 50%),
  // Bad figure очень странно, как бы дублируется то, что было выше
  caption: [Плоскость, векторы $a, b$, вектор $c$ перпендикулярен плоскости. \
  Истинное направление вект. $c$ (следует из усл. 3). $(a, b, c)$ - правая.],
) <fig-06_cross_product_detailed>

]

#remark[
  Условия 1, 2 и 3 определяют векторное произведение неколлинеарных векторов однозначно.
]

#theorem(title: [Свойства векторного произведения])[
  Для любых векторов $a,b$ из трёхмерного пространства и любого $lambda in RR$ имеет место:
  - а) $[a,b] = -[b,a]$ (антикоммутативное свойство)
  - б) $[a+b, c] = [a,c] + [b,c]$
  - в) $[lambda a, b] = lambda dot [a,b]$ } свойство линейности вект. произв. по первому аргументу.
  - г) $[a, b+c] = [a,b] + [a,c]$
  - д) $[a, lambda b] = lambda [a,b]$ } св-во линейности вект. произв. по 2-му аргументу.
  - е) $[a,b] = 0 <=> a, b$ коллинеарны.
]

#proof[
  \ *а)* 
 *Случай 1* Если $a, b$ - коллинеарные векторы, то по замечанию 1: \
  $[a,b] = 0$, $[b,a] = 0 => 0 = -0 => [a,b] = -[b,a]$.
  
  *Случай 2* Пусть $a, b$ - неколлинеарные векторы. \
  // bad figure
#figure(image("../../assets/images/07_right_left_triple.svg", width: 50%), caption: [Векторы $a, b, [a,b]$ вверх (правая тройка), $[b,a]$ вниз. Надписи: "против часовой", "по часовой"]) <fig-07_right_left_triple>
 \
  $(a,b,c)$ - правая тройка. \
  $(b,a,c)$ - правая тройка. (Смена знака).
  // bad figure : error! Тут вообще что-то непонятное! 
  ... \
  $ &= alpha_1 beta_2 e_3 - alpha_1 beta_3 e_2 - alpha_2 beta_1 e_3 + alpha_2 beta_3 e_1 + alpha_3 beta_1 e_2 - alpha_3 beta_2 e_1 \
    &= underbrace((alpha_2 beta_3 - alpha_3 beta_2), "коор. матр. 2x2") e_1 - (alpha_1 beta_3 - alpha_3 beta_1) e_2 + (alpha_1 beta_2 - alpha_2 beta_1) e_3 \
    &= mat(delim: "|", alpha_2, alpha_3; beta_2, beta_3) e_1 - mat(delim: "|", alpha_1, alpha_3; beta_1, beta_3) e_2 + mat(delim: "|", alpha_1, alpha_2; beta_1, beta_2) e_3 quad "(1)[можно задать в виде формального определителя матрицы]" \
    &= mat(delim: "|", e_1, e_2, e_3; alpha_1, alpha_2, alpha_3; beta_1, beta_2, beta_3) quad "[если разложить по эл-там 1-й стр., получим (1)]" $
  _(Сноска: элементы в 1 строке определителя)_
]

#corollary(title: [Ортонормированность])[
  $ [a,b] = mat(delim: "|", e_1, e_2, e_3; alpha_1, alpha_2, alpha_3; beta_1, beta_2, beta_3) $
]

#corollary(title:[О геометрической интерпретации определителя матр. порядка 2])[
  Абсолютная величина определителя матрицы, составленной из координатных столбцов векторов $a$ и $b$ на плоскости в ортонормированном базисе, равна площади параллелограмма, построенного на векторах $a$ и $b$, отложенных от одной точки, если векторы $a$ и $b$ неколлинеарны, и равна нулю, если $a$ и $b$ - коллинеарны. [без док.]
]

#lemma(title:[Критерий коллинеарности векторов на плоскости])[
  Векторы $a$ и $b$ на плоскости коллинеарные $<=>$ Определитель матрицы, составленной из координатных столбцов векторов $a$ и $b$ в любом базисе, равен $0$.
]

#theorem[
  Пусть $(e_1, e_2, e_3)$ - ортонормированный базис в трёхмерном пространстве.
  $(alpha_1, alpha_2, alpha_3)^T$ - координаты вектора $a$ в базисе, 
  $(beta_1, beta_2, beta_3)^T$ - координаты вектора $b$, 
  $(gamma_1, gamma_2, gamma_3)^T$ - координаты вектора $с=[a,b]$.
  Тогда:
  $ gamma_1 = mat(delim: "|", alpha_2, alpha_3; beta_2, beta_3), quad gamma_2 = - mat(delim: "|", alpha_1, alpha_3; beta_1, beta_3), quad gamma_3 = mat(delim: "|", alpha_1, alpha_2; beta_1, beta_2) $
]

#proof[
  Задаем в пространстве ортонормированный базис. \
  _Рисунок: Оси $e_1, e_2, e_3$_ \ //bad figure - рисунка вообще нет!
  Таблица умножения базисных векторов:
  
  #align(center)[
  #table(
    columns: 4,
    [], [$e_1$],[$e_2$], [$e_3$],
    [$e_1$], [0],[$e_3$], [$-e_2$],
    [$e_2$],[$-e_3$], [0], [$e_1$],
    [$e_3$],[$e_2$], [$-e_1$], [0]
  )
  ]
  _(против часовой)_

  $[e_1, e_2] = e_3$, $(e_1, e_2, e_3)$ - правая тройка. \
  $[e_3, e_3] = 0$. \
  $(e_1, e_3, e_2)$ - левая (но нужна правая, поэтому $-e_2$). \
  $[e_2, e_1] = -[e_1, e_2] = -e_3$ \
  $[e_2, e_3] = e_1$ (т.к. $(e_2, e_3, e_1)$ - правая) \
  $[e_3, e_1] = e_2$

  Пусть $a = alpha_1 e_1 + alpha_2 e_2 + alpha_3 e_3$.
  
  $ [a, b] &=[alpha_1 e_1 + alpha_2 e_2 + alpha_3 e_3, beta_1 e_1 + beta_2 e_2 + beta_3 e_3] \
           &=[alpha_1 e_1, beta_1 e_1] + [alpha_1 e_1, beta_2 e_2] +[alpha_1 e_1, beta_3 e_3] + dots +[alpha_3 e_3, beta_3 e_3] \
           &= alpha_1 beta_1 underbrace([e_1, e_1], 0) + alpha_1 beta_2 [e_1, e_2] + alpha_1 beta_3 [e_1, e_3] + dots + alpha_3 beta_3 underbrace([e_3, e_3], 0) $
// bad figure : error - тут конспект как бы разрывается
  _... (продолжение вывода через определитель Грама/тождество Лагранжа) ..._
  $ |[a,b]|^2 = (a,a)(b,b) - (a,b)^2 $
  $ |[a,b]| = sqrt(|[a,b]|^2) = |(a,b,c)| / |c| = |(a,b,c)| $ // bad figure error - что-то совсем странное (поехали символы)
]