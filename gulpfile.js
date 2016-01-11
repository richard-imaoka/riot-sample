var gulp        = require('gulp');
var browserSync = require('browser-sync').create();

gulp.task('watch', function () {
  gulp.watch("*.{html,css,js,json,tag}", browserSync.reload);
  gulp.watch("/**/*.{html,css,js,json,tag}", browserSync.reload);
});

gulp.task('browser-sync', function() {
  //Start the Browsersync service. This will launch a server.
  browserSync.init({
    server: {
      baseDir: "./"
    }
  });
});

gulp.task('default', ['browser-sync', 'watch']);