#import "../ledger.typ": *
#set text(size: 11pt)
#set page(height: auto, margin: 1em)
#dining-table.make(columns: example, 
  data: data, 
  notes: dining-table.note.display-list
)