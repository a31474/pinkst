#import "./math-fun/lib.typ": *
#import "./lib.typ": *

#show: heading-style-color

#show: default-cover.with(content: {
  align(center + horizon)[#text(size: 25pt)[请自己设计封面]]
})

#show: conf
#show: conf-style

#show: default-outline

= 测试
= 数学函数使用

== 定理 dingli

#dingli-1[测试][] <a>

$ a times b $

#dingli-1[测试][]

$ b times c $

#dingli-1(step: false)[-b][] <b>

$ c times e $

#dingli-2[测试][
  $ e times f $
]

#dingli-3[测试][
  $ f times g $
]

@a

@b