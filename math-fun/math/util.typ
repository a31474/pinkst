#let fake-par = context {
  box()
  v(-measure(block() + box()).height)
}

#let m-color = (
  deep-blue: rgb(60, 113, 183),
  light-blue: rgb(0, 174, 247),
  orange: rgb(255, 134, 24),
  green: rgb(0, 166, 82),
  thin-green: rgb(242, 251, 246),
  thin-blue: rgb(242, 251, 255),
  thin-orange: rgb(255, 249, 243),
)

#let f-heading(level: 1) = {
  let h = counter(heading).get()
  if h.len() > level {
    h.slice(0, count: level)
  } else {
    h
  }
}