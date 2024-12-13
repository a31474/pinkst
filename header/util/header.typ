#import "heading-L1.typ": find-1
#import "heading-L2.typ": find-2

// 第一页计数
#let coun-page-1 = counter("coun-heading-level-1")

// 页眉 标题
#let header-heading() = context {
  if find-1().at("has") or {
    not find-2().at("has") and counter(heading).get().len() <= 1
  } {
    find-1().at("value-h")
  } else {
    find-2().at("value-h")
  }
}

// 页眉 页数
#let header-page-num() = context {
  if coun-page-1.get().at(0) == 0 {
    [1/ #counter(page).final().at(0)]
  } else {
    counter(page).display("1 / 1", both: true)
  }
}

// 页眉 框体
#let header-rect(l, c, r) = rect(width: 100%, stroke: (bottom: 1pt + rgb(60, 113, 183)))[
  #grid(
    columns: (1fr, 1fr, 1fr),
    align(left, l), align(center, c), align(right, r),
  )
]

// 页眉
#let header-normal() = (
  header-rect(
    [],
    header-heading(),
    header-page-num(),
  ) + coun-page-1.update(1)
)

#let header-fun() = {
  set text(fill: rgb(60, 113, 183))
  header-normal()
}

// 页眉-book
#let header-heading-odd() = {
  find-1().at("value-h")
}
#let header-heading-even() = {
  find-2().at("value-h")
}

#let header-page-num-book() = {
  if coun-page-1.get().at(0) == 0 {
    [1]
  } else {
    counter(page).display("1")
  }
}

#let header-normal-book() = context {
  if calc.odd(here().page()) {
    header-rect(
      header-page-num-book(),
      header-heading-odd(),
      [],
    )
  } else {
    header-rect(
      [],
      header-heading-even(),
      header-page-num-book(),
    )
  }
} + coun-page-1.update(1)

#let header-fun-book() = {
  set text(fill: rgb(60, 113, 183))
  header-normal-book()
}