#import "../ledger.typ": *
#set text(size: 11pt)
#set page(height: 5cm, margin: 1em)
#dining-table.make(columns: example, 
  footer: none,
  data: data, 
  notes: dining-table.note.display-list
)

#v(0.5cm)

#dining-table.make(columns: example, 
  footer: (
    table.cell(
      colspan: 3, fill: none,
      align(right, strong(smallcaps[total])),
    ),
    [#{7*100}],[00],
    [#{7*99}],[00]
  ),
  data: data, 
  notes: dining-table.note.display-list
)