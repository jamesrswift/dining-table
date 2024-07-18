
#let counted(name: "", value) = [
  #value #metadata(value) #label("_counted:" + name)
]

#let sum(name) = context {
  query(selector(label("_counted:" + name)).before(here()))
    // .filter(el => (el.location().page() == here().page()))
    .map(it => it.value).sum()
}