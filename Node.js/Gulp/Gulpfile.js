// Inserindo dependências do projeto
var gulp = require("gulp"),
	browserSync = require('browser-sync'),
	plugins = require("gulp-load-plugins")(),
	reload = browserSync.reload;

	devRoot = "dev/", // DEV - Arquivos compilados
	source = devRoot + "source/", // DEV - Código fonte
	prodRoot = "prod/", // PROD - Arquivos para publicação

	// DEV - Diretórios de código fonte
	sass = source + "sass/",
	coffee = source + "coffee/",

	// DEV - Diretórios de códigos compilados
	devCss = devRoot + "css/",
	devJs = devRoot + "js/",
	devImages = devRoot + "assets/img/",
	devFonts = devRoot + "assets/fonts/",

	// PROD - Diretórios da versão final
	prodCss = prodRoot + "css/",
	prodJs = prodRoot + "js/",
	prodImages = prodRoot + "assets/img/",
	prodFonts = prodRoot + "assets/fonts/";


// DEV - Task's do ambiente de desenvolvimento

// Cria o servidor para o livereload
gulp.task("buildServer", function() {
	browserSync({
		browser: "chrome",
		logPrefix : "dev", 
		notify: true,
		open: true,
		port: 3000,
		server: {
			baseDir: devRoot,
			index: "index.html"
		}
	});
});

// Checar gulpfile na task watch
gulp.task("gulpfile", function() {
	return gulp.src("./Gulpfile.js")
		.pipe(plugins.plumber())
		.pipe(reload({stream:true}));
});

// Validação do HTML
gulp.task("checkHtml", function() {
	return gulp.src(devRoot + "**/*.html")
		.pipe(plugins.plumber())
		.pipe(plugins.htmlhint(
			{
				"tagname-lowercase": true,
				"attr-lowercase": true,
				"attr-value-double-quotes": true,
				"attr-value-not-empty": true,
				"attr-no-duplication": true,
				"doctype-first": true,
				"tag-pair": true,
				"tag-self-close": true,
				"spec-char-escape": false,
				"id-unique": true,
				"src-not-empty": true,
				"head-script-disabled": false,
				"img-alt-require": true,
				"doctype-html5": true,
				"id-class-value": true,
				"style-disabled": true,
				"space-tab-mixed-disabled": true,
				"id-class-ad-disabled": true,
				"href-abs-or-rel": true,
				"attr-unsafe-chars": false
			}
		))
		.pipe(plugins.htmlhint.reporter())
		.pipe(plugins.htmlhint.failReporter())
		.pipe(gulp.dest(devRoot))
		.pipe(reload({stream:true}));
});

// Compilação do CSS
gulp.task("compileSass", function() {
	return gulp.src(sass + "**/*.scss")
		.pipe(plugins.plumber({
	    	errorHandler: function (error) {
		        console.log(error.message);
		        this.emit('end');
		   	}
		}))
		.pipe(plugins.compass(
			{
				style: "expanded",
				sass: sass,
				css: devCss,
				javascript: devJs,
				font: devFonts,
				image: devImages,
				comments: true,
				logging: true,
				time: true
			}
		))
		.pipe(gulp.dest(devCss))
		.pipe(reload({stream:true}));
});

// Compilação do Coffeescript
gulp.task("compileCoffee", function() {
	return gulp.src(coffee + "**/*.coffee")
		.pipe(plugins.plumber())
		.pipe(plugins.coffee(
			{
				bare: true
			}
		))
		.pipe(gulp.dest(devJs))
		.pipe(reload({stream:true}));
});

// Verifica alterações no Gulpfile
gulp.task("watchGulpfile", function() {
	gulp.watch('Gulpfile.js', ['gulpfile']);
});

// Verifica alterações nos HTML's
gulp.task("watchHtml", function() {
	gulp.watch(devRoot + "**/*.html", ['checkHtml']);
});

// Verifica alterações nos SCSS's
gulp.task("watchSass", function() {
	gulp.watch(sass + "**/*.scss", ['compileSass']);
});

// Verifica alterações nos Coffeescript
gulp.task("watchCoffee", function() {
	gulp.watch(coffee + "**/*.coffee", ['compileCoffee']);
});

// Executar DEV
gulp.task("default",["buildServer","watchGulpfile","watchHtml","watchSass","watchCoffee"]);

// PROD - Task's do ambiente de produção

// Minificar HTML
gulp.task("minifyHtml", function() {
	return gulp.src(devRoot + "**/*.html")
		.pipe(plugins.htmlmin({
			removeComments : true,
			collapseWhitespace: true
		}))
		.pipe(gulp.dest(prodRoot));
});

// Minificar CSS
gulp.task("minifyCss", function() {
	return gulp.src(devCss + "**/*.css")
		.pipe(plugins.cssmin({
			showLog: true
		}))
		.pipe(gulp.dest(prodCss));
});

// Minificar Scripts
gulp.task("minifyJs", function() {
	return gulp.src(devJs + "*.js")
		.pipe(plugins.concat("main.js"))
		.pipe(plugins.uglify())
		.pipe(gulp.dest(prodJs));
});

// Minificar Plugins/Bibliotecas JS
gulp.task("minifyPlugins", function() {
	return gulp.src(devJs + "lib/*.js")
		.pipe(plugins.concat("plugins.js"))
		.pipe(plugins.uglify())
		.pipe(gulp.dest(prodJs + "lib/"));
});

// Otimizar imagens
gulp.task("optmizeImg", function() {
	return gulp.src(devImages + "{**/*.{jpg,png,gif,svg}, *.{jpg,png,gif,svg}}")
		.pipe(plugins.imagemin({
			progressive: true,
			interlaced: true,
			optimizationLevel: 7,
			svgoPlugins: [{removeViewBox: false}]
		}))
		.pipe(gulp.dest(prodImages));
});

// Copiar fonts
gulp.task("fontsToProd", function() {
	return gulp.src(devFonts + "**/*.{eot,svg,ttf,woff}")
		.pipe(gulp.dest(prodFonts));
});

// Executar Production
gulp.task("prod",["minifyHtml","minifyCss","minifyJs","minifyPlugins","optmizeImg","fontsToProd"]);