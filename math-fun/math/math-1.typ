#import "util.typ": m-color, fake-par, f-heading

#let math-fun-1(type, step: true, math-color: rgb(0, 0, 0), it) = (
  {
    if step {
      counter(type).step()
    }
    set text(fill: math-color, weight: "bold")
    type + (
      context {
        numbering("1.1-", ..f-heading()) + counter(type).display()
      }
    ) + it
  } + h(1.8em)
)

#let dingyi-1 = math-fun-1.with("定义", math-color: m-color.green)
#let dingli-1 = math-fun-1.with("定理", math-color: m-color.light-blue)
#let mingti-1 = math-fun-1.with("命题", math-color: m-color.light-blue)
#let zhu-1(it) = text(fill: m-color.orange)[*注#it*] + h(1.8em)
#let zm-1(it) = text(fill: m-color.orange)[*证明#it*] + h(1.8em)
#let tuilun-1(it) = text(fill: m-color.light-blue)[*推论#it*] + h(1.8em)