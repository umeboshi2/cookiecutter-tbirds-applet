Backbone = require 'backbone'
Marionette = require 'backbone.marionette'
tc = require 'teacup'
marked = require 'marked'

{ navigate_to_url } = require 'tbirds/util/navigate-to-url'

view_template = tc.renderable (model) ->
  tc.div '.row.listview-list-entry', ->
    tc.raw marked "# #{model.appName} started."
    
class MainView extends Backbone.Marionette.View
  template: view_template
  templateContext:
    appName: '{{ cookiecutter.project_slug }}'
    
module.exports = MainView

