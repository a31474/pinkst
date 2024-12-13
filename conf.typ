#import "header/conf.typ" as pinkst-header
#import "math/conf.typ" as pinkst-math
#import "num/conf.typ" as pinkst-num
#import "math-fun/conf.typ" as pinkst-math-fun

#import "@preview/numbly:0.1.0": numbly

#let fake-par = context {
  box()
  v(-measure(block() + box()).height)
}

#let conf(
  doc,
  math-equation-level: 1,
  math-fun-level: 1,
) = {
  show: pinkst-header.conf
  show: doc => pinkst-math.conf(doc, math-fun-level)
  show: doc => pinkst-num.conf(doc, math-equation-level)
  show: pinkst-math-fun.conf
  doc
}

#let conf-book(
  doc,
  math-equation-level: 1,
  math-fun-level: 1,
) = {
  show: pinkst-header.conf-book
  show: doc => pinkst-math.conf(doc, math-fun-level)
  show: doc => pinkst-num.conf(doc, math-equation-level)
  show: pinkst-math-fun.conf
  doc
}

#let conf-style(doc) = {
  set page(margin: (x: 9.5%))
  set heading(numbering: numbly("第{1}章", default: "1.1"))

  set par(justify: true, spacing: 0.8em)
  set text(lang: "zh", region: "cn", size: 10pt)
  set text(font: ("Times New Roman", "FZShuSong-Z01S"))
  show emph: set text(font: ("Times New Roman", "FZKai-Z03S"))
  show strong: set text(font: ("Times New Roman", "FZHei-B01S"))
  show text.where(weight: "bold"): set text(font: ("Times New Roman", "FZHei-B01S"))

  set par(first-line-indent: 1.8em)
  set enum(indent: 1.8em)
  set list(indent: 1.8em)

  show heading: it => it + fake-par
  show enum: it => it + fake-par
  show list: it => it + fake-par
  show figure: it => it + fake-par
  show math.equation.where(block: true): it => it + fake-par

  show ref: set text(blue)

  doc
}