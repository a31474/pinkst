#import "math/util.typ": f-heading

#let conf(doc) = {
  show figure.where(kind: "math-fun"): set align(left)

  show ref: it => {
    let i = it.element
    if i != none and i.func() == figure and i.kind == "math-fun" {
      let is = i.supplement.text.split(":")
      link(
        i.location(),
        is.at(0) + numbering("1.1-", ..f-heading()) + numbering(
          "1",
          counter(is.at(0)).at(i.location()).at(0) + int(is.at(1)),
        ),
      )
    } else {
      it
    }
  }

  doc
}