#import "@preview/theoretic:0.3.1"
#import theoretic.presets.bar: *

#let colorsheme = (
  theorem:    rgb("#006400"), 
  definition: rgb("#00ff00"), 
  lemma:      blue, 
  corollary:  red, 
  remark:     purple, 
  proof:      rgb("#3e424b"),
  case:       rgb("#4a4a4a"),
  axiom:      rgb("#1565c0"),   // ← добавить
  property:   rgb("#00695c") )

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
#let axiom = theorem.with(
  supplement: "Аксиома",
  color: colorsheme.axiom,
  options: (
    color: colorsheme.axiom,
    head-font: (fill: colorsheme.axiom, weight: "bold"),
    title-font: (fill: colorsheme.axiom),
  )
)

#let property = theorem.with(
  supplement: "Свойство",
  color: colorsheme.property,
  options: (
    color: colorsheme.property,
    head-font: (fill: colorsheme.property, weight: "bold"),
    title-font: (fill: colorsheme.property),
  )
)
// ============================================
// Фабрика нумерованных блоков
// ============================================
#let make-block(name, color) = (body, title: none) => {
  figure(
    kind: name,
    supplement: name,
    numbering: n => numbering("1.1", counter(heading).get().first(), n),
    block(
      width: 100%,
      stroke: (left: 3pt + color),
      inset: (left: 12pt, y: 6pt),
      {
        context {
          let sec = counter(heading).get().first()
          let loc = counter(figure.where(kind: name)).get().first()
          let title-part = if title != none { [ (#emph(title))] } else { [] }
          text(fill: color, weight: "bold")[#name #sec.#loc#title-part.]
        }
        h(0.5em)
        body
      }
    )
  )
}

// ============================================
// Блоки — каждый со своим независимым счётчиком
// ============================================
#let theorem    = make-block("Теорема",     rgb("#006400"))
#let definition = make-block("Определение", rgb("#2e7d32"))
#let lemma      = make-block("Лемма",       rgb("#1565c0"))
#let corollary  = make-block("Следствие",   rgb("#e65100"))
#let remark     = make-block("Замечание",   rgb("#6a1b9a"))
#let axiom      = make-block("Аксиома",     rgb("#1565c0"))
#let property   = make-block("Свойство",    rgb("#00695c"))

// Доказательство — особый блок: без нумерации, с QED
#let proof(body) = block(
  width: 100%,
  spacing: 0.8em,
  inset: (left: 12pt, y: 4pt),
  stroke: (left: 2pt + rgb("#3e424b")),
  {
    text(fill: rgb("#3e424b"), weight: "bold", style: "italic")[Доказательство.]
    h(0.5em)
    body
    [ #h(1fr) $square.stroked$]
  }
)

// ============================================
// Сброс счётчиков блоков при каждом новом разделе
// ============================================
#show heading.where(level: 1): it => {
  for k in ("Теорема", "Определение", "Лемма", "Следствие", "Замечание", "Аксиома", "Свойство") {
    counter(figure.where(kind: k)).update(0)
  }
  it
}

// ============================================
// Настройка документа
// ============================================
#let setup(body) = {
  set text(lang: "ru")
  set page(numbering: "1")
  set heading(numbering: "1.")
  set math.equation(numbering: "(1)")

  outline(title: [Оглавление], depth: 2, indent: auto)
  pagebreak()

  body
}
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
