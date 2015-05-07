module.exports = (gulp, plugins)->
  gulp.task "compile", (cb)->
    plugins.sequence do
      "clean"
      <[livescript stylus jade]>
      "concat"
      "copy"
      # "zip"
      cb
