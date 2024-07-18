#import "../../ledger.typ": *
#set text(size: 11pt)
#set page(height: 7.5cm, margin: 1em)

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
        display: dining-table.contextual.counted.with(name: "amount.unit")
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
        display: dining-table.contextual.counted.with(name: "total.unit")
      ),
      (
        key: "total.decimal",
        header: align(right, text(number-type: "old-style")[.00]), 
        align: left
      ),
    )
  ),
)


#dining-table.make(columns: example, 
  footer: (
    table.cell(
      colspan: 3, fill: none,
      align(right, strong(smallcaps[total])),
    ),
    dining-table.contextual.sum("amount.unit"),[00],
    dining-table.contextual.sum("total.unit"),[00]
  ),
  data: data*2, 
  notes: dining-table.note.display-list
)