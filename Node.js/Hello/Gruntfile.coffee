module.exports = (grunt) ->

  fs = require 'fs'
  isModified = (filepath) ->
    now = new Date()
    modified =  fs.statSync(filepath).mtime
    return (now - modified) < 10000

  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    coffee:
      options:
        sourceMap: true
        bare: true
        force: true # needs to be added to the plugin
      all:
        expand: true
        cwd: 'src/coffee/'
        src: '**/*.coffee'
        dest: 'compiled'
        ext: '.js'
      modified:
        expand: true
        cwd: 'src/coffee/'
        src: '**/*.coffee'
        dest: 'compiled'
        ext: '.js'
        filter: isModified

    coffeelint:
      options:
        force: true
      all:
        expand: true
        cwd: 'src/coffee/'
        src: '**/*.coffee'
      modified:
        expand: true
        cwd: 'src/coffee/'
        src: '**/*.coffee'
        filter: isModified

    nodemon:
        dev:
          script:'compiled/index2.js'

    watch:
      coffeescript:
        files: ['src/**/*.coffee']
        tasks: ['coffeelint:modified', 'coffee:modified']

    concurrent:
        dev:
            tasks: ['nodemon','watch']
            options:
                logConcurrentOutput: true

  grunt.loadNpmTasks 'grunt-concurrent'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-nodemon';

  grunt.registerTask 'default', ['coffeelint:all', 'coffee:all','concurrent:dev']
