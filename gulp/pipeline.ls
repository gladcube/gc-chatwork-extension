module.exports =
  app_js_files_to_concat: [
    "bower_components/jquery/dist/jquery.js"
    "bower_components/prelude-ls/browser/prelude-browser.js"
    "bower_components/jquery-textcomplete/dist/jquery.textcomplete.js"
    "oauth2/oauth2.js"
    "tmp/js/app/config/**/*.js"
    "tmp/js/app/classes/**/*.js"
    "tmp/js/app/**/*.js"
  ]
  background_js_files_to_concat: [
    "bower_components/prelude-ls/browser/prelude-browser.js"
    "tmp/js/background/**/*.js"
  ]
