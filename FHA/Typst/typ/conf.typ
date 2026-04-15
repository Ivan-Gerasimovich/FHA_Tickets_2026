#import "@preview/theoretic:0.3.1"
#import theoretic.presets.bar: *

#let colorsheme = (
  theorem:    rgb("#006400"), 
  definition: rgb("#00ff00"), 
  lemma:      blue, 
  corollary:  red, 
  remark:     purple, 
  proof:      rgb("#3e424b"),
  case:       rgb("#4a4a4a")
)

#let definition = definition.with(
  supplement: "Определение",
  color: colorsheme.definition, 
  options: (
    color: colorsheme.definition,
    head-font: (fill: colorsheme.definition, weight: "bold"),
    title-font: (fill: colorsheme.definition),
  )
)

#let theorem = theorem.with(
  supplement: "Теорема",
  color: colorsheme.theorem,
  options: (
    color: colorsheme.theorem,
    head-font: (fill: colorsheme.theorem, weight: "bold"),
    title-font: (fill: colorsheme.theorem),
  )
)

#let lemma = lemma.with(
  supplement: "Лемма",
  color: colorsheme.lemma,
  options: (
    color: colorsheme.lemma,
    head-font: (fill: colorsheme.lemma, weight: "bold"),
    title-font: (fill: colorsheme.lemma),
  )
)

#let corollary = corollary.with(
  supplement: "Следствие",
  color: colorsheme.corollary,
  options: (
    color: colorsheme.corollary,
    head-font: (fill: colorsheme.corollary, weight: "bold"),
    title-font: (fill: colorsheme.corollary),
  )
)

#let remark = remark.with(
  supplement: "Замечание",
  color: colorsheme.remark,
  options: (
    color: colorsheme.remark,
    head-font: (fill: colorsheme.remark, weight: "bold"),
    title-font: (fill: colorsheme.remark),
  )
)

#let proof = proof.with(
  supplement: "Доказательство",
  options: (
    // Доказательство в пресете bar по дефолту plain (без линии)
    // Просто красим текст заголовка
    head-font: (fill: colorsheme.proof, weight: "bold", style: "italic"),
    title-font: (fill: colorsheme.proof, style: "italic"),
  )
)


#let setup(body) = {
  set text(lang: "ru") 
  set page(numbering: "1")
  
  // Теперь нумерация будет простой: 1, 2, 3...
  // Если хочешь точку в конце (1., 2.), оставь "1."
  set heading(numbering: "1.") 
  set math.equation(numbering: "(1)")

  // Оглавление
  outline(title: [Оглавление], depth: 2, indent: auto)
  pagebreak()

  body
}
