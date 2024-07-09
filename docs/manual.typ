#import "@preview/tidy:0.3.0"

#{
    import "../src/lib.typ" as dining-table
    let document-module(name, file) = tidy.parse-module(
        read(file),
        name: name,
        scope: (dining-table: dining-table)
    )

    let lib = ("", "../src/lib.typ")
    let impl = ("", "../src/impl.typ")
    let styles = ("", "../src/styles.typ")
    let note = ("note", "../src/note.typ")

    for (name, file) in (lib, impl, styles, note){
        tidy.show-module(
            document-module(name, file),
            style: tidy.styles.default,
        )
    }
}
