var gulp = require('gulp');
var $ = require('gulp-load-plugins')();
var browserSync = require('browser-sync').create();
var del = require('del');
var runSequence = require('run-sequence');

var publicFolder = 'docs';

// Start browserSync server
gulp.task('browserSync', function() {
    browserSync.init({
        server: {
            baseDir: 'dev',
            https: true
        }
    });
});

gulp.task('testPublic', function() {
    browserSync.init({
        server: {
            baseDir: publicFolder,
            https: true
        }
    });
});


gulp.task('handlebars', function() {
    var templateData = {

        },
        options = {
            ignorePartials: true,
            batch: ['dev/partial'],
            helpers: {}
        };

    return gulp.src(['dev/**/*.hb', '!dev/partial/**'])
        .pipe($.compileHandlebars(templateData, options).on('error', function(e) {
            console.log(e);
        }))
        .pipe($.rename(function(path) {
            path.extname = ".html";
        }))
        .pipe(gulp.dest('dev'));
});


gulp.task('sass', function() {
    return gulp.src('dev/**/scss/*.scss') // Gets all files ending with .scss in dev/scss and children dirs
        .pipe($.sass().on('error', $.sass.logError)) // Passes it through a gulp-sass
        .pipe(gulp.dest('dev')) // Outputs it in the css folder
        .pipe(browserSync.stream());
});

var reload = browserSync.reload;
// Watchers
gulp.task('watch', function() {
    gulp.watch('dev/**/scss/*.scss', ['sass']);
    gulp.watch('dev/**/*.hb', ['handlebars', reload]);
    gulp.watch('dev/**/js/*.js', reload);
    gulp.watch('dev/**/lib/*.js', reload);
    gulp.watch('dev/**/*.+(png|jpg|jpeg|gif|svg|ttf)', reload);
});

// Optimization Tasks 
// ------------------

// Optimizing CSS and JavaScript 
gulp.task('useref', function() {
    return gulp.src(['dev/**/*.html', '!dev/**/*webgl/**'])
        .pipe($.useref({
            transformPath: function(filePath) {
                var path = filePath;
                var i = filePath.indexOf('\\/') + 1;
                if (i > 0)
                    path = process.cwd() + '/dev' + filePath.substring(i);
                // console.log(path);
                return path;
            }
        }))
        .pipe($.if('*.js', $.uglify()))
        .pipe($.if('*.css', $.autoprefixer()))
        .pipe($.if('*.css', $.csso()))
        .pipe(gulp.dest(publicFolder));
});

// Optimizing Images 
gulp.task('images', function() {
    return gulp.src('dev/**/*.+(ico|png|jpg|jpeg|gif|svg)')
        // Caching images that ran through imagemin
        .pipe($.cache($.imagemin({
            interlaced: true,
        })))
        .pipe(gulp.dest(publicFolder));
});

// Copying other files 
gulp.task('copy', function() {
    return gulp.src([
            'dev/**/global.css',
            'dev/**/*.+(xml|json)',
            'dev/+(CNAME|sw.js)',
            'dev/**/*webgl/**',
            '!dev/**/*webgl/*.html',
            '!dev/**/Development/**',
            '!dev/**/Development',
            '!dev/**/*.+(ico|png|jpg|jpeg|gif|svg)'
        ])
        .pipe(gulp.dest(publicFolder));
});
// Cleaning
gulp.task('clean', function() {
    return del.sync(publicFolder);
});

// Build Sequences
// ---------------

gulp.task('default', function(callback) {
    runSequence(['sass', 'handlebars', 'browserSync'], 'watch',
        callback
    );
});

gulp.task('build', function(callback) {
    runSequence(
        'clean', ['sass', 'handlebars'], ['useref', 'images', 'copy'],
        'testPublic',
        callback
    );
});
