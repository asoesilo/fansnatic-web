gulp = require 'gulp'
karma = require('karma').server
paths = require './paths'

###
# Test Execution Tasks
# Execute jasmine tests using karma test runner
###

# Execute karma test runner with auto watch for file changes and
# reexecuting tests when there are changes in files
gulp.task 'test', ->
  karma.start
    configFile: paths.karma
