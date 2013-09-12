module.exports = function(grunt) {

	grunt.initConfig({

  	shell: {
      bootruby: {
        command: 'bundle exec shotgun',
      },
    },

    sass: {
      dist: {                            // Target
    	  options: {                       // Target options
          style: 'compressed'
        },
      	files: {                         // Dictionary of files
          'public/style.css': 'assets/css/style.scss'
        },
      },
    },

    uglify: {
      my_target: {
        files: {
    	    'public/app.min.js': ['assets/js/main.js','assets/js/ZeroClipboard.js']
        },
      },
    },

    watch: {
      css: {
        files: ['assets/css/style.scss'],
        tasks: ['sass'],
      },
      js: {
    	  files: ['assets/js/main.js'],
        tasks: ['uglify']
      },
    },

    concurrent: {
      target: {
    	  tasks: ['shell:bootruby', 'watch'],
    	    options: {
            logConcurrentOutput: true
          }
      }
    }

  });

  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-sass');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-shell');
  grunt.loadNpmTasks('grunt-concurrent');

  grunt.registerTask('default', ['concurrent:target']);

};