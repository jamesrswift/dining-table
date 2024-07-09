#let std-state = state
#let std-numbering = numbering

#let state = std-state("__booktabs:footnote", ())
#let numbering = std-state("__booktabs:numbering", "a")

#let clear() = state.update(())

#let set-numbering(new) = numbering.update(new)

#let make-numbering() = context std-numbering(numbering.get(), state.get().len() + 1)

#let make( body) =  {
  h(0em, weak: true) + sym.space.narrow + super(make-numbering())
  state.update(it=>{it.push(body);it})
}

#let display-numbering(key) = super(context std-numbering(numbering.get(), key + 1))

#let display = context {
  grid(
    columns: (auto, 1fr),
    inset: 0.15em,
    ..(for (key, value) in state.get().enumerate() {
      (display-numbering(key), value)
    })
  )
} + clear()

#let display-list = context {
  state.get()
   .enumerate()
   .map( ((key, value)) => box[#display-numbering(key) #value])
   .join(", ", last: ", and ")
}

#let display-style(notes) = {
  v(-0.5em)
  set text(0.888em)
  set block(spacing: 0.5em)
  set par(leading: 0.5em)
  align(start, notes)
}