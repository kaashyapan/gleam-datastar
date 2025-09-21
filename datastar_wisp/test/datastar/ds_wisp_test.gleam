import datastar/ds_sse
import datastar/ds_wisp
import wisp

// gleeunit test functions end in `_test`
pub fn send_test() {
  let events = [
    ds_sse.patch_elements()
    |> ds_sse.patch_elements_elements("<div />")
    |> ds_sse.patch_elements_end,
  ]

  let response =
    wisp.ok()
    |> ds_wisp.send(events)

  let expected_headers = [
    #("content-type", "text/event-stream"),
    #("cache-control", "no-cache"),
  ]

  assert response.headers == expected_headers

  assert response.body
    == wisp.Text("event: datastar-patch-elements\ndata: elements <div />\n\n")
}
