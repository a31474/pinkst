// 默认封面
#let default-cover(doc, content: none) = {
  set page(header: none)
  if content == none {
    align(center + horizon, text(17pt)[封面])
  } else {content}
  counter(page).update(0)
} + doc

// 默认标题格式
#let default-heading-numbering = {
  (..nums) => if nums.pos().len() < 2 [
    第#nums.pos().map(str).join(".")章
  ] else [
    #nums.pos().map(str).join(".")
  ]
}

// 默认目录
#let default-outline(doc, content: none) = {
  set page(header: none)
  if content == none {
    set page(numbering: "i")
    outline(title: "目录", depth: 2, indent: 1em)
  } else {content}
} + counter(page).update(1) + doc

#let heading-style-color(doc) = {
  show heading.where(): it => {
    set text(fill: rgb(60, 113, 183))
    // 目录title 为 heading 且 numbering 为 none
    if it.numbering == none {
      it
    } else if it.level == 1 {
      align(center)[#it]
    } else if it.level == 2 {
      let it-numbering = numbering(it.numbering, ..counter(heading).at(it.location()))
      table(
        columns: 1,
        stroke: none,
        table.cell(
          stroke: (bottom: 1pt + rgb(60, 113, 183)),
          text(size: 1.2em)[#math.section] + it-numbering,
        ),
        h(1em) + it.body + h(2em),
      )
    } else {
      set text(size: 1.1em)
      it
    }
  }
  doc
}