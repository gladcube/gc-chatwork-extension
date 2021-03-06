Main =
  google_auth:~ ->
    @_google_auth ?= new OAuth2("google",
      client_id: "901616747998-rmkg9sqe7bupmfkdrq5p3b4fh5vh3a8g.apps.googleusercontent.com"
      client_secret: "6j2M5V2dH6cVyP9MLViHGjQM"
      api_scope: "https://spreadsheets.google.com/feeds"
    )
  is_expired:~ -> @google_auth.is-access-token-expired!
  token:~ -> @google_auth.get-access-token! if not @is_expired
  execute: ->
    @initialize!
  initialize: ->
    @set_google_auth!
    @listen!
  set_google_auth: -> @google_auth # oauth2 のライブラリが LocalStorage の値を使うが、時間差があるので先にインスタンス化しておく。
  authorize: (cb)->
    @google_auth.authorize -> cb?!
  listen: ->
    chrome.runtime.on-message.add-listener (request, sender, send-response)~>
      switch request.method
      | "get-token" => (
        if @token?
          send-response token: @token
        else if not @is_authorizing
          @is_authorizing = yes; @authorize(~> @is_authorizing = no); send-response {}
        else send-response {}
      )
      | _ => send-response {}

window.onload = -> Main.execute!
