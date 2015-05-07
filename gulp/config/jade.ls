module.exports = (gulp, plugins)->
  gulp.task "jade", (cb)->
    gulp
      .src "src/**/*.jade"
      .pipe plugins.plumber!
      .pipe plugins.jade!
      .pipe gulp.dest "tmp/"
