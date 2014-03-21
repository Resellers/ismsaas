{spawn}     = require 'child_process'
{watchTree} = require 'watch'
_           = require 'underscore'


runTests = _.throttle (=> spawn 'npm', ['test'], stdio: 'inherit'), 100, trailing: false
compileTemplate = (file) =>
  return unless _.isString file
  console.log "compiled template: #{file}"
  spawn 'eco', ['--output', 'lib/client/templates', '--identifier', 'JST', file]


task 'dev', 'rebuild the project', (options) ->
  spawn 'coffee', ['--output', 'lib',  '--watch', '--compile', 'src'],  stdio: 'inherit'
  spawn 'nodemon', ['lib/index.js'], stdio: 'inherit'

  watchTree 'src', runTests
  watchTree 'test', runTests
  watchTree 'src/client/templates', compileTemplate
