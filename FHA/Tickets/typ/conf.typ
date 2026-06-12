// template.typ

// ============================================
// Фабрика нумерованных блоков (нативная, без figure)
// ============================================
#let make-block(name, color, counter-name: none) = (title: none, body) => {
  // Если counter-name не задан явно, используем имя блока (name).
  let cnt-name = if counter-name != none { counter-name } else { name }
  
  block(
    width: 100%,
    breakable: true,
    stroke: (left: 1pt + color),
    inset: (left: 6pt, y: 4pt),
    {
      counter(cnt-name).step() // Шаг уникального счетчика блока
      context {
        let loc = counter(cnt-name).get().first()
        let title-part = if title != none { [ (#emph(title))] } else {[] }
        
        // Если name пустое (например, у формулы), выводится только номер. 
        // Иначе пишется: "Имя Номер"
        let label-text = if name != "" { [#name #loc] } else { [#loc] }
        text(fill: color, weight: "bold")[#label-text#title-part.]
      }
      h(0.5em)
      body
    }
  )
}

// ============================================
// Создание блоков — каждый со своим независимым счётчиком и цветом
// ============================================
#let theorem    = make-block("Теорема",     rgb("#1b5e20")) // Темно-зеленый (хвойный)
#let definition = make-block("Определение", rgb("#689f38")) // Светло-зеленый (оливковый)
#let lemma      = make-block("Лемма",       rgb("#1565c0"))
#let corollary  = make-block("Следствие",   rgb("#e65100"))
#let remark     = make-block("Замечание",   rgb("#6a1b9a"))
#let axiom      = make-block("Аксиома",     rgb("#1565c0"))
#let property   = make-block("Свойство",    rgb("#00838f")) // Бирюзовый (морская волна)
#let formula    = make-block("",            rgb("#c500fb"), counter-name: "Формула")
#let circled(body) = {
  box(circle(radius: 5pt, stroke: 1pt + black, inset: 0pt)[
    #set align(center + horizon)
    #body
  ])
}

// ============================================
// Доказательство — особый блок: без нумерации, с квадратиком QED
// ============================================
#let proof(title: none, body) = block(
  width: 100%,
  breakable: true,
  spacing: 0.8em,
  inset: (left: 12pt, y: 4pt),
  stroke: (left: 1pt + rgb("#3e424b")),
  {
    let title-part = if title != none {[ (#emph(title))] } else {[] }
    text(fill: rgb("#3e424b"), weight: "bold", style: "italic")[Доказательство \ $square.stroked$ #title-part]
    h(0.5em)
    body
    [ #h(1fr) $square.filled$ ]
  }
)

// ============================================
// TINY Настройка (Формат А5 под Брошюру)
// ============================================
#let setup(body) = {
  // 1. Шрифт 8.5pt на А5 будет читаться так же хорошо, как 11.5pt на А4.
  set text(lang: "ru", size: 8.5pt) 
  set par(leading: 0.45em, justify: true) 
  
  // 2. Делаем страницу А5 с "книжными" полями
  set page(
    numbering: "1", 
    paper: "a5", // Формат А5 (ровно половина А4)
    // inside (внутреннее поле) делаем чуть больше, чтобы текст не ушел в сгиб/скрепку!
    margin: (inside: 1.2cm, outside: 0.8cm, top: 1cm, bottom: 1cm) 
  )
  
  set math.equation(numbering: "(1)", supplement: none)

  set heading(numbering: (..nums) => {
    let levels = nums.pos()
    if levels.len() == 1 {
      return str(levels.first()) + "."
    }
    return none 
  })

  // -- 1. ОГЛАВЛЕНИЕ (Компактное) --
  { 
    show heading.where(level: 1): it => {
      v(0.5em, weak: true)
      text(size: 0.8em, weight: "bold", fill: black)[#it.body]
      v(0.3em, weak: true)
    }
    outline(title: [Оглавление], depth: 1, indent: auto)
  }
  
  // -- 2. БИЛЕТЫ (H1) --
  show heading.where(level: 1): it => {
    // Билеты идут без разрывов страниц, сплошным потоком
    for k in ("Теорема", "Определение", "Лемма", "Следствие", "Замечание", "Аксиома", "Свойство", "Формула") {
      counter(k).update(0)
    }
    counter(math.equation).update(0)

    let is-ticket = it.numbering != none 
    let prefix = if is-ticket {
      [Вопрос #counter(heading).display() ] 
    } else {
      none 
    }

    // Тонкая плашка, чтобы не тратить место на листе
    v(1em, weak: true) 
    block(
      width: 100%,
      fill: rgb("#2a4b7c"), 
      inset: (x: 0.5em, y: 0.4em), 
      radius: 0.2em,
      align(center)[
        #text(fill: white, weight: "bold", size: 0.85em)[
          #prefix#it.body
        ]
      ]
    )
    v(0.5em, weak: true) 
  }

  // -- 3. ПОДЗАГОЛОВКИ (H2) --
  show heading.where(level: 2): it => {
    v(0.6em, weak: true) 
    text(fill: rgb("#2a4b7c"), weight: "bold", size: 0.85em)[#it.body] 
    v(0.3em, weak: true)
  }

  // -- 4. УРАВНЕНИЯ (без изменений) --
  show ref: it => {
    let el = it.element
    if el != none and el.func() == math.equation {
      let num = numbering(el.numbering, ..counter(math.equation).at(el.label))
      let clean = str(num).trim("(").trim(")")
      [(#clean)] 
    } else {
      it
    }
  }

  v(1em) 
  body
}
