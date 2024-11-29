#import "util.typ": m-color, fake-par, f-heading
#import "@preview/showybox:2.0.3": showybox

// 格式三 有block 复杂
#let math-fun-3(
  type,
  counter-use: false,
  step: true,
  color-body: rgb(255, 255, 255),
  color-frame: rgb(0, 0, 0),
  it,
  body,
) = (
  {
    if step {
      counter(type).step()
    }
    let main = type + {
      if counter-use {
        context {
          numbering("1.1-", ..f-heading()) + counter(type).display()
        }
      } else {
        ""
      }
    } + it
    pad(
    // right: -1em,
    x : -1em,
    showybox(
      title-style: (boxed-style: (anchor: (x: left, y: horizon), radius: 0pt)),
      frame: (
        border-color: color-frame,
        title-color: color-frame,
        body-color: color-body,
        radius: 5pt,
        body-inset: (left: 1em, right: 1em, top: 0.65em, bottom: 0.9em),
      ),
      title: text(weight: "bold",main),
    )[#body],
  )
  } + fake-par
)
#let dingyi-3 = math-fun-3.with("定义", counter-use: true, color-body: m-color.thin-green, color-frame: m-color.green)
#let dingli-3 = math-fun-3.with(
  "定理",
  counter-use: true,
  color-body: m-color.thin-blue,
  color-frame: m-color.light-blue,
)
#let mingti-3 = math-fun-3.with(
  "命题",
  counter-use: true,
  color-body: m-color.thin-blue,
  color-frame: m-color.light-blue,
)
#let zhu-3 = math-fun-3.with("注", color-body: m-color.thin-orange, color-frame: m-color.orange)
#let zm-3 = math-fun-3.with("证明", color-body: m-color.thin-orange, color-frame: m-color.orange)
#let tuilun-3 = math-fun-3.with("推论", color-body: m-color.thin-blue, color-frame: m-color.light-blue)