#import "deps.typ": *

#let columns-schema = z.array(
  z.dictionary((:
    key: z.any(),
    header: z.content(optional: true),
    display: z.function(optional: true),
    fill: z.color(optional: true),
    align: z.alignment(default: start),
    gutter: z.length(optional: true),
    width: z.any(optional: true),
  )) + (:
    handle-descendents: (self, it, ctx: z.z-ctx(), scope: ()) => {

      if (it.len() == 0 and self.optional) {
        return none
      }

      // Check `it` if strict
      if (ctx.strict == true) {
        for (key, value) in it {
          if (key not in self.dictionary-schema) {
            return (self.fail-validation)(
              self,
              it,
              ctx: ctx,
              scope: scope,
              message: "Unknown key `" + key + "` in dictionary",
            )
          }
        }
      }

      if "children" in it {
        it.children = z.parse(
          it.children,
          z.array(
            self,
            z.coerce.array
          ),
          ctx: ctx
        )
      }

      for (key, schema) in self.dictionary-schema {

        let entry = (
          schema.validate
        )(
          schema,
          it.at(key, default: none), // implicitly handles missing entries
          ctx: ctx,
          scope: (..scope, str(key))
        )

        if (entry != none or ctx.remove-optional-none == false) {
          it.insert(key, entry)
        }

      }
      return it
    },
  )
)
