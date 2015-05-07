module.exports = (gulp, plugins)->
  gulp.task "zip", (cb)->
    gulp
      .src require("../pipeline.ls").files_to_zip
      .pipe plugins.zip "gc_chatwork_extension.zip"
      .pipe gulp.dest "zip"
