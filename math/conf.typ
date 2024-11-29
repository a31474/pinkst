#let counter-list = ("定义", "定理", "命题")

#let heading-update(it, update-level) = {
  if it.numbering == none { } else {
    if it.level <= update-level {
      for name in counter-list {
        counter(name).update(0)
      }
    }
  }
}

#let conf(doc, update-level) = {
  show heading: it => it + heading-update(it, update-level)
  doc
}