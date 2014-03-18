{spawn}     = require 'child_process'
{watchTree} = require 'watch'
_           = require 'underscore'

task 'dev', 'rebuild the project', (options) ->
  spawn 'coffee', ['--output', 'lib',  '--watch', '--compile', 'src'],  stdio: 'inherit'
  spawn 'nodemon', ['lib/index.js'], stdio: 'inherit'

  runTests = _.throttle (=> spawn 'npm', ['test'], stdio: 'inherit'), 100, trailing: false

  watchTree 'src', runTests
  watchTree 'test', runTests
