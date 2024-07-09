#import "../src/lib.typ" as dining-table

#set par(justify: true)
#set text(size: 12pt)
#set page(margin: 1em)

#let converted = csv(
  "ETH-GBP.csv", 
  row-type: dictionary
).map((it) =>(:
  ..it,
  Date: datetime(
    ..(
      "year", "month", "day"
    ).zip(
      it.Date.matches(
        regex("(\d{4})-(\d{2})-(\d{2})")
      ).first().captures
    ).fold(
      (:), 
      (acc, (key, value)) => (..acc, (key): int(value))
    )
  )
))

#let column(key) = (:
  key: key,
  header: [#key],
  width: 1fr,
  align: right,
)

#dining-table.make(
  columns: (
    (
      key: "Date",
      header: [Date],
      display: (it)=>{it.display()},
      gutter: 1em
    ),
    column("Open"),
    column("High"),
    column("Low"),
    column("Close"),
    column("Volume")
  ),
  data: converted
)
