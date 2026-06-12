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
    stroke: (left: 3pt + color),
    inset: (left: 12pt, y: 6pt),
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
<<<<<<< Updated upstream
#let theorem    = make-block("Теорема",     rgb("#006400"))
#let definition = make-block("Определение", rgb("#2e7d32"))
=======
#let theorem    = make-block("Теорема",     rgb("#1b5e20")) // Темно-зеленый (хвойный)
#let definition = make-block("Определение", rgb("#689f38")) // Светло-зеленый (оливковый)
>>>>>>> Stashed changes
#let lemma      = make-block("Лемма",       rgb("#1565c0"))
#let corollary  = make-block("Следствие",   rgb("#e65100"))
#let remark     = make-block("Замечание",   rgb("#6a1b9a"))
#let axiom      = make-block("Аксиома",     rgb("#1565c0"))
<<<<<<< Updated upstream
#let property   = make-block("Свойство",    rgb("#00695c"))
=======
#let property   = make-block("Свойство",    rgb("#00838f")) // Бирюзовый (морская волна)
>>>>>>> Stashed changes
#let formula    = make-block("",            rgb("#c500fb"), counter-name: "Формула")
#let circled(body) = {
  box(circle(radius: 10pt, stroke: 1pt + black, inset: 0pt)[
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
  stroke: (left: 2pt + rgb("#3e424b")),
  {
    let title-part = if title != none {[ (#emph(title))] } else {[] }
    text(fill: rgb("#3e424b"), weight: "bold", style: "italic")[Доказательство \ $square.stroked$ #title-part]
    h(0.5em)
    body
    [ #h(1fr) $square.filled$ ]
  }
)


// ============================================
// Базовая настройка документа и красота
// ============================================
#let setup(body) = {
  set text(lang: "ru", size: 11.5pt) 
  set par(leading: 0.8em, justify: true) 
  set page(numbering: "1", paper: "a4")
  set math.equation(numbering: "(1)", supplement: none)

  // Умная нумерация: H1 получает цифру (для билетов), H2 и ниже — без цифр.
  set heading(numbering: (..nums) => {
    let levels = nums.pos()
    if levels.len() == 1 {
      return str(levels.first()) + "."
    }
    return none 
  })

  // -- 1. ОГЛАВЛЕНИЕ (Чистое, без синих блоков) --
  { // Фигурные скобки изолируют стиль оглавления от остального документа
    show heading.where(level: 1): it => {
      v(1em)
      text(size: 1.6em, weight: "bold", fill: black)[#it.body]
      v(1em)
    }
    outline(title: [Оглавление], depth: 1, indent: auto)
  }
  
  // -- 2. БИЛЕТЫ И ИСКЛЮЧЕНИЯ (H1) --
  show heading.where(level: 1): it => {
    // pagebreak(weak: true) 
    
    // Сброс счетчиков
    for k in ("Теорема", "Определение", "Лемма", "Следствие", "Замечание", "Аксиома", "Свойство", "Формула") {
      counter(k).update(0)
    }
    
    counter(math.equation).update(0)

    // Логика исключений: проверяем, включена ли нумерация у этого H1
    let is-ticket = it.numbering != none 
    let prefix = if is-ticket {
      [Вопрос #counter(heading).display() ] // Добавляем слово "Билет N. "
    } else {
      none // Для исключений ничего не добавляем
    }

    // Отрисовка плашки H1 (Вариант "Воздух" - чуть тоньше, текст по центру)
    v(1em)
    block(
      width: 100%,
      fill: rgb("#2a4b7c"), 
      inset: (x: 1.5em, y: 1em), // y: 1em делает плашку стройнее
      radius: 0.4em,
      align(center)[
        #text(fill: white, weight: "bold", size: 1.4em)[
          #prefix#it.body
        ]
      ]
    )
    v(1.5em)
  }

  // -- 3. ПОДЗАГОЛОВКИ (H2) — Скромные и аккуратные --
  show heading.where(level: 2): it => {
    v(1.2em)
    // Никаких линий! Просто жирный темно-синий шрифт, чуть крупнее обычного
    text(fill: rgb("#2a4b7c"), weight: "bold", size: 1.15em)[#it.body]
    v(0.6em)
  }

  // -- 4. СТИЛЬ ССЫЛОК НА УРАВНЕНИЯ --
  show ref: it => {
    let el = it.element
    if el != none and el.func() == math.equation {
      // Извлекаем номер (1, * или **), убираем лишние скобки и ставим свои
      let num = numbering(el.numbering, ..counter(math.equation).at(el.label))
      let clean = str(num).trim("(").trim(")")
      [(#clean)] 
    } else {
      it
    }
  }

  pagebreak()
  body
}
