var coffee = require('gulp-coffee');
var gulp = require('gulp');

gulp.task('coffee',function(){
	 gulp.src('*.coffee')
		.pipe(coffee({bare:true}))	
		.on('error', function(er){
			console.log(er);
		})
		.pipe(gulp.dest(''));
		
});

gulp.task("watchCoffee", function(){
	gulp.watch("*.coffee", ['coffee']);
});

gulp.task('default',['coffee','watchCoffee']);

