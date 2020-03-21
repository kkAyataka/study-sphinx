const os = require('os');
const gulp = require('gulp');
const shell = require('gulp-shell');

gulp.task('build-sphinx', async () => {
  let cmd = ''
  if (os.type().startsWith('Windows')) {
    cmd = '.venv\\Scripts\\activate.bat & make -C doc html';
  } else {
    cmd = '. .venv/bin/activate; make -C doc html';
  }

  return shell.task(cmd)();
});

gulp.task('watch-rst', () => {
  gulp.watch('./doc/**/*.rst', gulp.task('build-sphinx'));
});
