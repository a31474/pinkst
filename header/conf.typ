#import "util/heading-L1.typ": last-heading-l1-update, first-heading-l1-update
#import "util/heading-L2.typ": last-heading-l2-update, first-heading-l2-update
#import "util/header.typ": header-fun

#let heading-update(it) = if it.level == 1 {
  last-heading-l1-update(it)
  first-heading-l1-update(it)
} else if it.level == 2 {
  last-heading-l2-update(it)
  first-heading-l2-update(it)
}

#let conf(doc) = {
  show heading: it => it + heading-update(it)
  set page(header: header-fun())
  doc
}