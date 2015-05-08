Main =
  is_ready:~ -> @token?
  members:~ -> Member.instances
  execute: ->
    @initialize!
  initialize: ->
    @watch!
    @listen!
    @get_token!
  get_token: ->
    chrome.runtime.send-message method: "get-token", ({token}?)~>
      if token? then @token = token
      else set-timeout @~get_token, 500
  watch: ->
    Object.observe @, ~> if @is_ready then @read!
  read: -> Member.fetch!
  listen: ->
    $ "\#_chatText" .textcomplete [
      * match: /\B@([\-+\w]*)/
        search: (term, cb)~>
          @members |> filter ( .title.index-of(term) >= 0) |> cb
        template: -> "<span class='member-name'>#{it.name_jp}さん</span>"
        replace: -> "[To:#{it.id}] #{it.name_jp}さん "
        index: 1
    ]

$(document).on "ready", -> Main.execute!
