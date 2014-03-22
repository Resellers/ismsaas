{spawn}     = require 'child_process'
{watchTree} = require 'watch'
_           = require 'underscore'
moment      = require 'moment'


runTests = _.throttle (=> spawn 'npm', ['test'], stdio: 'inherit'), 100, trailing: false
compileTemplate = (file) =>
  return unless _.isString file
  spawn 'eco', ['--output', 'lib/client/templates', '--identifier', 'JST', file]
  console.log "#{moment().format 'hh:mm:ss'} - compiled template: #{file}"


task 'dev', 'rebuild the project', (options) ->
  spawn 'coffee', ['--output', 'lib',  '--watch', '--compile', 'src'],  stdio: 'inherit'
  spawn 'nodemon', ['lib/index.js'], stdio: 'inherit'

  watchTree 'src', runTests
  watchTree 'test', runTests
  watchTree 'src/client/templates', compileTemplate
