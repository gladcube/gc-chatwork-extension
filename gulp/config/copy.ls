{merge} = require "event-stream"

module.exports = (gulp, plugins)->
  gulp.task "copy", -> [
    * gulp
        .src "tmp/concat/*.js"
        .pipe gulp.dest "build/js"
    * gulp
        .src "tmp/*.css"
        .pipe gulp.dest "build/css"
    * gulp
        .src ["src/**/*.html", "tmp/**/*.html"]
        .pipe gulp.dest "build"
  ] |> merge
