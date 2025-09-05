# datastar_wisp

[![Package Version](https://img.shields.io/hexpm/v/datastar_wisp)](https://hex.pm/packages/datastar_wisp)
[![Hex Docs](https://img.shields.io/badge/hex-docs-ffaff3)](https://hexdocs.pm/datastar_wisp/)

Wisp adaptor for <https://hexdocs.pm/datastar>

```sh
gleam add datastar datastar_wisp
```

```gleam
import datastar/ds_sse
import datastar/ds_wisp

let events = [
  ds_sse.patch_elements()
  |> ds_sse.patch_elements_elements("<span>Hello</span>")
  |> ds_sse.patch_elements_selector("#notice")
  |> ds_sse.patch_elements_end,
]

wisp.ok()
|> ds_wisp.send(events)
```

This will add the events data to the Wisp response. And will also add the expected headers by Datastar.
