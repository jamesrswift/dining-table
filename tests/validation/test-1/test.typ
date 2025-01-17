#import "/src/deps.typ": *
#import "/src/validation.typ"
#import "/src/lib.typ" as dining-table

#import "@preview/typpuccino:0.1.0"
#let bg-fill-1 = typpuccino.latte.base
#let bg-fill-2 = typpuccino.latte.mantle

#let example = (
  (
    key: "date",
    header: align(left)[Date],
    display: (it)=>it.display(auto),
    fill: bg-fill-1,
    align: start,
    gutter: 0.5em,
  ),
  (
    key: "particulars",
    header: text(tracking: 5pt)[Particulars],
    width: 1fr,
    gutter: 0.5em,
  ),
  (
    key: "ledger",
    header: [Ledger],
    fill: bg-fill-2,
    width: 2cm,
    gutter: 0.5em,
  ),
  (
    header: align(center)[Amount],
    fill: bg-fill-1,
    gutter: 0.5em,
    hline: arguments(stroke: dining-table.lightrule),
    children: (
      (
        key: "amount.unit", 
        header: align(left)[£], 
        width: 5em, 
        align: right,
        vline: arguments(stroke: dining-table.lightrule),
        gutter: 0em,
      ),
      (
        key: "amount.decimal",
        header: align(right, text(number-type: "old-style")[.00]), 
        align: left
      ),
    )
  ),
  (
    header: align(center)[Total],
    gutter: 0.5em,
    hline: arguments(stroke: dining-table.lightrule),
    children: (
      (
        key: "total.unit", 
        header: align(left)[£], 
        width: 5em, 
        align: right,
        vline: arguments(stroke: dining-table.lightrule),
        gutter: 0em,
      ),
      (
        key: "total.decimal",
        header: align(right, text(number-type: "old-style")[.00]), 
        align: left
      ),
    )
  ),
)

#set text(size: 11pt)
#set page(height: auto, margin: 1em)


#z.parse(example, validation.columns-schema, ctx: z.z-ctx(remove-optional-none: true))