#import "../ledger.typ": *
#set text(size: 11pt)
#set page(height: 3.5cm, margin: 1em)
#dining-table.make(columns: example, 
  header: none,
  data: data, 
  notes: dining-table.note.display-list
)

#dining-table.make(columns: example, 
  data: data, 
  notes: dining-table.note.display-list
)