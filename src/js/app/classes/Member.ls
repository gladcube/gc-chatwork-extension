class Member
  @id = "od6"
  @key = "1_zUfUl2rg1rB_LSVAv7gUqMfzaxyv6_vbVw2zhkPRU0"
  @url = -> "https://spreadsheets.google.com/feeds/list/#{@key}/#{@id}/private/basic?oauth_token=#{Main.token}&alt=json"
  @fetch = ->
    $.get @url!, (res)~>
      @instances = res.feed.entry |> map -> new @@ it
  ({content: {$t: @content}, title: {$t: @title}})->
  pieces:~ -> @_pieces ?= @content.match /\w+:[^,]+/g
  id:~ -> @pieces.0 |> split ": " |> last
  name:~ -> @pieces.1 |> split ": " |> last
  name_jp:~ -> @pieces.2 |> split ": " |> last
