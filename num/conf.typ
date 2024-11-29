#let heading-update(it, update-level) = if it.numbering == none { } else {
  if it.level <= update-level {
    counter(math.equation).update(0)
  }
}

#let f-heading(level) = {
  let h = counter(heading).get()
  if h.len() > level {
    h.slice(0, count: level)
  } else {
    h
  }
}

#let conf(doc, update-level) = {
  show heading: it => it + heading-update(it, update-level)
  set math.equation(numbering: _ => [
    (#numbering("1.1",..f-heading(update-level)).#counter(math.equation).display("1"))
  ])
  doc
}