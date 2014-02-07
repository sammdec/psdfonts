var gulp = require('gulp');
var gutil = require('gulp-util');
var sass = require('gulp-sass');
var uglify = require('gulp-uglify');
var concat = require('gulp-concat');

var paths = {
  css: 'assets/css/style.scss',
  js: ['assets/js/jquery.min.js', 'assets/js/main.js', 'assets/js/ZeroClipboard.js']
};

gulp.task('css', function () {
  gulp.src(paths.css)
    .pipe(sass({
      outputStyle: "compressed"
    }))
    .pipe(gulp.dest('public'));
});

gulp.task('js', function () {
  gulp.src(paths.js)
    .pipe(uglify())
    .pipe(concat('app.min.js'))
    .pipe(gulp.dest('public'));
});

gulp.task('watch', function () {
  gulp.watch(paths.js, ['js']);
  gulp.watch(paths.css, ['css']);
});

gulp.task('default', ['css', 'js', 'watch']);