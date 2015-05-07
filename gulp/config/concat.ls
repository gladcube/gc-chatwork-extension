{merge} = require "event-stream"

module.exports = (gulp, plugins)->
  gulp.task "concat", (cb)-> [
    * gulp
        .src require("../pipeline.ls").app_js_files_to_concat
        .pipe plugins.concat "app.js"
        .pipe gulp.dest "tmp/concat"
    * gulp
        .src require("../pipeline.ls").background_js_files_to_concat
        .pipe plugins.concat "background.js"
        .pipe gulp.dest "tmp/concat"
  ] |> merge
