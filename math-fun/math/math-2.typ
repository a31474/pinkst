#import "util.typ": m-color, fake-par, f-heading

#let math-fun-2-block = rect.with(
  width: 100%,
  inset: (x: 0pt, y: 5pt),
  outset: (left: 4pt, right: 7pt, top: 3.5pt, bottom: 3pt),
)
#let math-fun-2(
  type,
  counter-use: false,
  step: true,
  color-box: rgb(255, 255, 255),
  color-text: rgb(0, 0, 0),
  it,
  body,
) = figure(
  {
    let main = h(1.8em) + type + {
      if counter-use {
        if step {
          counter(type).step()
        }
        context {
          numbering("1.1-", ..f-heading()) + counter(type).display()
        }
      }
    } + it + h(1.8em)
    math-fun-2-block(fill: color-box, text(fill: color-text, weight: "bold", main) + body)
  },
  supplement: type + ":" + str(int(step)),
  kind: "math-fun",
)

#let dingyi-2 = math-fun-2.with("定义", counter-use: true, color-box: m-color.thin-green, color-text: m-color.green)
#let dingli-2 = math-fun-2.with("定理", counter-use: true, color-box: m-color.thin-blue, color-text: m-color.light-blue)
#let mingti-2 = math-fun-2.with("命题", counter-use: true, color-box: m-color.thin-blue, color-text: m-color.light-blue)
#let zhu-2 = math-fun-2.with("注", color-box: m-color.thin-orange, color-text: m-color.orange)
#let zm-2 = math-fun-2.with("证明", color-box: m-color.thin-orange, color-text: m-color.orange)
#let tuilun-2 = math-fun-2.with("推论", color-box: m-color.thin-blue, color-text: m-color.light-blue)